import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

class Storage extends StatefulWidget {
  const Storage({Key key}) : super(key: key);

  @override
  State<Storage> createState() => _StorageState();

  uploadFile(String path, String fileName) {}
}

class _StorageState extends State<Storage> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg', 'jpeg']);
              if (results == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No file selected!'),
                  ),
                );
                //return null;
              }

              final path = results.files.single.path;
              final fileName = results.files.single.path;

              //print(path);
              //print(fileName);

              storage.uploadFile(path, fileName).then((value) => print('Done'));
            },
            child: Text('Upload Files'),
          ),
        ],
      ),
    );
  }
}
