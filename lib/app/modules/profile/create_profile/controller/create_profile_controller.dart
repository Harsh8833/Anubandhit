import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfileController {
  String name = '';
  String phone = '';
  String address = '';
  String panNumber = '';
  String adahaarNumber = '';
  String bankNumber = '';
  var db = FirebaseFirestore.instance;

  Future createNewLabour() async {
    final labourData = <String, dynamic>{
      "name": name,
      "phone": phone,
      "address": address,
      "panNumber": panNumber,
      "adahaarNumber": adahaarNumber,
      "bankNumber": bankNumber
    };

    // await db.collection('labours').add(labourData).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));
    print(labourData);
  }
}
