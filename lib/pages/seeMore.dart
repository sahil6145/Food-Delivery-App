import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Data/menuList.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/Addcart.dart';

import 'package:food_app/pages/cartScreen.dart';
import 'package:food_app/pages/search.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.back)),
            elevation: 2,
            titleTextStyle: TextStyle(fontFamily: 'Carter One', fontSize: 21),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: const Icon(
                    CupertinoIcons.search,
                  )),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  child: const Icon(CupertinoIcons.bag)),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: mainColor,
            title: Text('MENU'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Consumer<Listprovider>(
              builder: (context, list, child) => GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 330,
                    mainAxisSpacing: 20),
                itemCount: list.Mylist.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(blurRadius: 2)]),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'Images/food/${list.Mylist[index]['image']}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        list.Mylist[index]['name'],
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Mukta'),
                      ),
                      Text(
                        'Rs ${list.Mylist[index]['price']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            fontFamily: 'Mukta',
                            color: mainColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<Listprovider>(context, listen: false)
                              .addToCart(index);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(11),
                            ),
                            color: Color.fromARGB(60, 97, 94, 94),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(fontFamily: 'Mukta'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
