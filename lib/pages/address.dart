import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/cartScreen.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool newAddress = false;
  bool saveAddress = false;

  // This method is for CheckBox active and inactive functionality
  void check() {
    if (newAddress == true && saveAddress == false) {
      newAddress = false;
      saveAddress = true;
    } else {
      newAddress = true;
      saveAddress = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(CupertinoIcons.back)),
          title: const Text(
            'ADDRESS',
            style: TextStyle(fontFamily: 'Carter One', fontSize: 20),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                child: const Icon(CupertinoIcons.bag)),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: mainColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.black,
                            shape: CircleBorder(),
                            value: newAddress,
                            onChanged: (value) {
                              setState(() {
                                check();
                              });
                            },
                          ),
                          const Text('Add New Address')
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.black,
                            shape: const CircleBorder(),
                            value: saveAddress,
                            onChanged: (value) {
                              setState(() {
                                check();
                              });
                            },
                          ),
                          const Text('Saved Address')
                        ],
                      ),
                    ),
                  ],
                ),
                AddressFields(
                  name: 'First Name',
                ),
                AddressFields(
                  name: 'Last Name',
                ),
                AddressFields(
                  name: 'Building No ',
                ),
                AddressFields(
                  name: 'Near By Landmark ',
                ),
                AddressFields(
                  name: 'State',
                ),
                AddressFields(
                  name: 'Pin Code ',
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      'Save Address',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Mukta'),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressFields extends StatelessWidget {
  final String name;

  const AddressFields({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusColor: Colors.black45,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: name),
        cursorColor: Colors.black,
      ),
    );
  }
}
