import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

 Future<Uint8List> compressList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      quality: 10,
      
    );
    print(list.length);
    print(result.length);
    return result;
  }


  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
  ) async {
    String uid = const Uuid().v1();
    //compress image;
    final image = await compressList(file);

    Reference ref =
        _storage.ref().child(childName).child(uid);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

}