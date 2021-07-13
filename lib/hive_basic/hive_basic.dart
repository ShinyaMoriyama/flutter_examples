import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import 'package:path_provider/path_provider.dart';

// import 'package:hive/hive.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter_svg/svg.dart';
import './hperson.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // UserCredential userCredential =
  //     await FirebaseAuth.instance.signInAnonymously();
  // print(userCredential);

  await Hive.initFlutter();
  Hive.registerAdapter(HpersonAdapter());
  var hpersons = await Hive.openBox<Hperson>('hperson');
  final hperson = Hperson(name: "Jack", age: 20);
  hpersons.add(hperson);
  hperson.age = 22;
  hperson.save();

  for (final key in hpersons.keys) {
    final a = hpersons.get(key);
    // final b = hpersons.get
    print("$key: ${a?.name} ${a?.age}");
  }

  hpersons.toMap().forEach((key, value) {
    print("*** $key $value");
  });

  // print("hpersons: $hpersons");
  // var jack = hpersons.get('Jack');
  // print("jack: ${jack?.name}");
  // print("jack: ${jack?.age}");

  var box = await Hive.openBox('testBox');
  box.put('file', 'Mars.vectornator.svg');
  var file = box.get('file');
  print('File: $file');

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // File downloadToFile = File('${appDocDir.path}/download.svg');

  // try {
  //   final ref = FirebaseStorage.instance.ref(file);
  //   // final ref = FirebaseStorage.instance.ref('New_Document.svg');
  //   print('ref: $ref');

  //   final result = await ref.writeToFile(downloadToFile);
  //   // resultUrl = await ref.getDownloadURL();
  //   print('result: $result');
  // } on FirebaseException catch (e) {
  //   print('FirebaseException');
  //   print(e);
  // }

  // runApp(MyApp(
  //   downloadedFile: downloadToFile,
  // ));
}

class MyApp extends StatelessWidget {
  final File downloadedFile;
  // final String url;
  MyApp({required this.downloadedFile});
  @override
  Widget build(BuildContext context) {
    print(downloadedFile.path);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hive Demo'),
        ),
        backgroundColor: Colors.blue.shade200,
        body: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: SvgPicture.asset(
                  downloadedFile.path,
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
            SafeArea(
                child: Center(
              child: Text('Showing SVG Image'),
            ))
          ],
        ),
      ),
    );
  }
}
