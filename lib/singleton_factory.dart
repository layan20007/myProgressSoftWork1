class mySingleton{

  mySingleton._internel();

  static final mySingleton instance = mySingleton._internel();
  factory mySingleton()=> instance;
}