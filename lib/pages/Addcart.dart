import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/Data/menuList.dart';
import 'package:food_app/pages/cartScreen.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  final int listIndex;
  Cart({required this.listIndex});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isHeartSelected = false;

  void isSelected() {
    if (isHeartSelected == false) {
      isHeartSelected = true;
    } else {
      isHeartSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(CupertinoIcons.back)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected();
                      });
                    },
                    child: Icon(
                      isHeartSelected
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isHeartSelected ? Colors.red : Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<Listprovider>(
              builder: (context, list, child) => Container(
                margin: EdgeInsets.only(top: 20),
                height: 450,
                width: 340,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                            image: AssetImage(
                                'Images/food/${list.Mylist[widget.listIndex]['image']}')),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${list.Mylist[widget.listIndex]['name']}',
                      style: const TextStyle(
                        fontFamily: 'Carter One',
                        fontSize: 30,
                        // color: mainColor
                      ),
                    ),
                    Text(
                      'Rs ${list.Mylist[widget.listIndex]['price']} ',
                      style: TextStyle(
                          fontFamily: 'Carter One',
                          fontSize: 20,
                          color: mainColor),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 22),
              child: const Row(
                children: [
                  Text(
                    'Rating 5.0',
                    style: TextStyle(fontFamily: 'Mukta', fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xFFFFB721),
                    size: 18,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xFFFFB721),
                    size: 18,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xFFFFB721),
                    size: 18,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xFFFFB721),
                    size: 18,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xFFFFB721),
                    size: 18,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Delivery Info',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Mukta', fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                  style: TextStyle(
                      color: Colors.black38, fontFamily: 'Mukta', fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Return Policy',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Mukta', fontSize: 16),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                  style: TextStyle(
                      color: Colors.black38, fontFamily: 'Mukta', fontSize: 16),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Add to Cart');
                Provider.of<Listprovider>(context, listen: false)
                    .addToCart(widget.listIndex);
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CartScreen())));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 2)],
                  color: mainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Add to cart",
                    style: TextStyle(fontFamily: 'Mukta', fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
