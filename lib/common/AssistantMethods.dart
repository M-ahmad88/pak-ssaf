import 'package:firebase_database/firebase_database.dart';

import '../models/userModel.dart';
import '../utils/global.dart';

class AssistantMethod{

  static Future<int?> getPointsOfUser() async {
    try {
      currentFirebaseUser = fAuth.currentUser;

      if (currentFirebaseUser == null) {
        // Handle the case when the user is not authenticated.
        return 0;
      }

      DatabaseReference userRef = FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(currentFirebaseUser!.uid);

      DataSnapshot snapshot = (await userRef.once()).snapshot; // Access the snapshot property

      if (snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snapshot);
        points = userModelCurrentInfo!.points!;
        return userModelCurrentInfo!.points;
      }

      return 0;
    } catch (e) {
      return 0;
    }
  }



  static Future<String> getNameOfUser() async {
    try {
      currentFirebaseUser = fAuth.currentUser;

      if (currentFirebaseUser == null) {
        // Handle the case when the user is not authenticated.
        return "Not Authenticated";
      }

      DatabaseReference userRef = FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(currentFirebaseUser!.uid);

      DataSnapshot snapshot = (await userRef.once()).snapshot; // Access the snapshot property

      if (snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snapshot);
        userName =  userModelCurrentInfo!.name!;
        return userModelCurrentInfo!.name.toString();
      }

      return "Data not available";
    } catch (e) {
      // Handle Firebase-related errors here.
      return "Error: $e";
    }
  }






}