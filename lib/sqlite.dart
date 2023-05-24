import 'package:flutter/material.dart';
import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class todo {
  final int id;
  final String title;
  final String description;

  todo({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  todo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"];

  @override
  String toString() {
    return 'todo{id: $id, title: $title, description: $description}';
  }
}

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late DatabaseHandler handler;
  late Future<List<todo>> _todo;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _todo = getList();
      });
    });
  }

  Future<List<todo>> getList() async {
    return await handler.todos();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _todo = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<List<todo>>(
        future: _todo,
        builder: (BuildContext context, AsyncSnapshot<List<todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return new Text('Error: ${snapshot.error}');
          } else {
            final items = snapshot.data ?? <todo>[];
            return new Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(items[index].id),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deletetodo(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Text(items[index].title),
                            subtitle: Text(items[index].description.toString()),
                          )),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}
class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add todo'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseHandler()
                        .inserttodo(todo(
                        title: title,
                        description: description,
                        id: Random().nextInt(50)))
                        .whenComplete(() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListScreen()),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'tododatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> inserttodo(todo todo) async {
    final db = await initializeDB();
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<todo>> todos() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('todos');
    return queryResult.map((e) => todo.fromMap(e)).toList();
  }

  Future<void> deletetodo(int id) async {
    final db = await initializeDB();
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}



