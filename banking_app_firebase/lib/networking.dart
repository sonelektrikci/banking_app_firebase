import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerInfo {
  String? email;
  String? name;
  String? surname;
  String? avatarLink;
  String? cardNumber;
  String? cardProvider;
  int? balance;

  CollectionReference user = FirebaseFirestore.instance.collection('customers');

  CustomerInfo({this.email});

  Future getCustomerData() async {
    await user.where('email', isEqualTo: email).snapshots().listen((data) {
      name = data.docs[0]['name'];
      surname = data.docs[0]['surname'];
      balance = data.docs[0]['balance'];
      avatarLink = data.docs[0]['photo'];
      cardNumber = data.docs[0]['credit_card'];
      cardProvider = data.docs[0]['cardProvider'];
    });
  }
}
