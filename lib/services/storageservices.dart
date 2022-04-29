import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:firebase_core/firebase_core.dart' as firebasecore;

class Storage {
  final firebaseStorage.FirebaseStorage storage =
      firebaseStorage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      await storage.ref().child('docs/$fileName').putFile(file);
    } on firebasecore.FirebaseException catch (e) {
      print(e);
    }
  }
}
