import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfileController {
  var db = FirebaseFirestore.instance;

  Future createNewLabour(
      {name, phone, address, panNumber, adahaarNumber}) async {
    log("Creating New Labour");
    final labourData = <String, dynamic>{
      "name": name,
      "phone": phone,
      "address": address,
      "panNumber": panNumber,
      "adahaarNumber": adahaarNumber,
    };

    await db.collection('labours').add(labourData).then(
        (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
    print(labourData);
  }
}
