import 'package:firebase_database/firebase_database.dart';

class UserModel {
  int? points;

  UserModel({this.points});

  UserModel.fromSnapshot(DataSnapshot snap){
    points =( snap.value as dynamic)['points'];
  }
}