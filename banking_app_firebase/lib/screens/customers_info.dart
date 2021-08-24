import 'package:banking_app_firebase/constants.dart';
import 'package:banking_app_firebase/networking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CustomerScreen extends StatefulWidget {
  final CustomerInfo? customerInfo;
  const CustomerScreen({Key? key, this.customerInfo}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  String? name;
  String? surname;
  int? balance;
  String? avatarLink;

  void getData() {
    name = widget.customerInfo!.name;
    surname = widget.customerInfo!.surname;
    balance = widget.customerInfo!.balance;
    avatarLink = widget.customerInfo!.avatarLink;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Account Summary",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.bell,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarLink!),
                ),
              ],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                name!,
                style: kInfoTextDecoration,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                balance!.toString(),
                style: kInfoTextDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
