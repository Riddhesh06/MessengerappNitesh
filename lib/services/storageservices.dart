import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:firebase_core/firebase_core.dart' as firebasecore;
import 'package:flutter/cupertino.dart';

class Storage {
  final firebaseStorage.FirebaseStorage storage =
      firebaseStorage.FirebaseStorage.instance;

  Future<void> uploadFile (
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      //await storage.ref().child('docs/$fileName').putFile(file);
      await storage.ref('docs/$fileName').putFile(file);
    } on firebasecore.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebaseStorage.ListResult> listFiles() async {
    firebaseStorage.ListResult results = await storage.ref('docs').listAll();

    results.items.forEach((firebaseStorage.Reference ref) {
      print('found file: $ref');
    });

    return results;
  }
}
