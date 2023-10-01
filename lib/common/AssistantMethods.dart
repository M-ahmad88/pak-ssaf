import 'package:firebase_database/firebase_database.dart';

import '../models/userModel.dart';
import '../utils/global.dart';

class AssistantMethod{
  static getPointsOfUser() async {
    currentFirebaseUser = fAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child('users')
        .child(currentFirebaseUser!.uid);

    userRef.once().then((snap) =>  {
      if (snap.snapshot.value != null){
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot)
      }

    });

    return userModelCurrentInfo!.points.toString();

  }
}