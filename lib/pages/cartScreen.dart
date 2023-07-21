import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Data/menuList.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/address.dart';
import 'package:food_app/pages/search.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: backgroundColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: mainColor,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                child: Icon(CupertinoIcons.search)),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Consumer<Listprovider>(
                builder: (context, list, child) => Expanded(
                  child: ListView.builder(
                    itemCount: list.Cart.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(blurRadius: 2)],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(
                                  'Images/food/${list.Cart[index]['image']}',
                                ),
                                height: 80,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list.Cart[index]['name']}',
                                style: const TextStyle(
                                    fontFamily: 'Mukta', fontSize: 18),
                              ),
                              Text(
                                'Qty : ${list.quantity}',
                                style: const TextStyle(
                                    fontFamily: 'Mukta', fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                'Price: ${list.Cart[index]['price']} Rs',
                                style: const TextStyle(
                                    fontFamily: 'Mukta', fontSize: 18),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        list.decreaes(index);
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('${list.quantity}'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        list.Increase(index);
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: const Icon(
                              CupertinoIcons.minus_rectangle_fill,
                            ),
                            onPressed: () {
                              setState(() {
                                list.removeFromCart(index);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<Listprovider>(
                builder: (context, list, child) => Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3)],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Total Price : ',
                        style: TextStyle(
                          fontFamily: 'Mukta ',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '${list.totalPrice()} Rs',
                        style: const TextStyle(
                          fontFamily: 'Mukta ',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Address()));
                  print('Buy');
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 2)],
                    borderRadius: BorderRadius.circular(20),
                    color: mainColor,
                  ),
                  child: const Center(
                      child: Text(
                    'Buy',
                    style: TextStyle(fontFamily: 'Carter One', fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
