import 'builder.dart';

void builderMain(List<String> args) {
  final builder = UserAccountBuilder("user1@gmail.com","user123",1);
  final u1 =  builder.build();
  print(u1);

  final builder2 = UserAccountBuilder("user2@gmail.com","user123",2);
  builder2.firstName="USER 2";
  final u2 =  builder2.build();
  print(u2);
}