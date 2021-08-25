import 'package:banking_app_firebase/constants.dart';
import 'package:banking_app_firebase/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerScreen extends StatefulWidget {
  final CustomerInfo? customerInfo;
  const CustomerScreen({Key? key, this.customerInfo}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int _selectedIndex = 0;
  String? name;
  String? surname;
  int? balance;
  String? avatarLink;
  String? cardNumber;
  String? cardProvider;

  void getData() {
    name = widget.customerInfo!.name;
    surname = widget.customerInfo!.surname;
    balance = widget.customerInfo!.balance;
    avatarLink = widget.customerInfo!.avatarLink;
    cardNumber = widget.customerInfo!.cardNumber;
    cardProvider = widget.customerInfo!.cardProvider;
  }

  bool isMasterCard() {
    if (cardProvider == "MasterCard") {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Account Summary",
                    style: kInfoTextDecoration,
                  ),
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(avatarLink!),
                    ),
                    height: 59,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning",
                    style: kInfoTextDecoration.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "$name $surname",
                    style: kInfoTextDecoration.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                height: 199,
                width: 344,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.grey[200],
                ),
                child: Stack(
                  children: [
                    isMasterCard()
                        ? Image(
                            image: NetworkImage(
                                "https://brand.mastercard.com/content/dam/mccom/brandcenter/thumbnails/mastercard_circles_92px_2x.png"),
                            height: 50,
                            width: 50,
                          )
                        : Image(
                            image: NetworkImage(
                                "https://cdn.freebiesupply.com/logos/large/2x/visa-logo-png-transparent.png"),
                            height: 50,
                            width: 50,
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.amazonPay),
            label: "Send",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.arrowAltCircleDown),
            label: "Withdraw",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dollarSign),
            label: "Deposit",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
