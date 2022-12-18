import 'dart:developer';

import 'package:anubandhit/helper/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfileController {
  var db = FirebaseFirestore.instance;

  Future createNewLabour(
      {name, phone, address, panNumber, adahaarNumber}) async {
    log("Creating New Labour");
    final labourData = <String, dynamic>{
      "labour_id": SPController().getLabourId(),
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
