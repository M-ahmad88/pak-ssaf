import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/userModel.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
Barcode? result ;
int points = 0;
String userName = "";