import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:food_app/pages/Addcart.dart';
import 'package:food_app/pages/cartScreen.dart';

import 'package:food_app/pages/search.dart';
import 'package:food_app/pages/seeMore.dart';
import 'package:provider/provider.dart';

import '../Data/menuList.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bottomColor = backgroundColor;

  //List<Map<String, dynamic>> Mylist = [];
  @override
  void initState() {
    Provider.of<Listprovider>(context, listen: false).Mylist =
        Provider.of<Listprovider>(context, listen: false).Food;
    super.initState();
  }

  int selectedIndex = 0;
  // int bottombarIndex = 0;
  // void navigator(int value) {
  //   if (value == 1) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: ((context) => Search())));
  //   } else {
  //     print(value);
  //   }
  // }
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: Scaffold(
        drawer: Drawer(),
        key: _globalKey,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Consumer<Listprovider>(
              builder: (context, list, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _globalKey.currentState!.openDrawer();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Image.asset(
                            'Images/icons/drawer.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // This will take user to cart screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const CartScreen()),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Image.asset(
                            'Images/icons/cart1.png',
                            height: 30,
                            width: 30,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Delicious \nfood for you',
                            style: TextStyle(
                                fontSize: 39,
                                fontFamily: 'Carter One',
                                color: Color.fromARGB(255, 29, 28, 28)
                                //color: mainColor
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, bottom: 20, top: 10),
                    child: TextField(
                      onTap: () {
                        // This ontab will navigat the user to the search screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Search())));
                      },
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        prefixIcon: const Hero(
                          tag: 1,
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.black38,
                          ),
                        ),
                        hintText: 'Search',
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 25),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Foods', 0, list.Food),
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Drinks', 1, list.Drinks),
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Snacks', 2, list.Deserts),
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Salads', 3, list.Drinks),
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Deserts', 4, list.Deserts),
                          const SizedBox(
                            width: 20,
                          ),
                          Category_button('Mains', 5, list.Deserts),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            print('see more');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menu()));
                          },
                          child: const Text(
                            'See more',
                            style: TextStyle(fontFamily: 'Mukta', fontSize: 17),
                          ),
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FoodItem(
                          index: 0,
                          image: list.Mylist[0]['image'],
                          name: list.Mylist[0]['name'],
                          price: list.Mylist[0]['price'],
                        ),
                        FoodItem(
                          index: 1,
                          image: list.Mylist[1]['image'],
                          name: list.Mylist[1]['name'],
                          price: list.Mylist[1]['price'],
                        ),
                        FoodItem(
                          index: 2,
                          image: list.Mylist[2]['image'],
                          name: list.Mylist[2]['name'],
                          price: list.Mylist[2]['price'],
                        ),
                        FoodItem(
                          index: 3,
                          image: list.Mylist[3]['image'],
                          name: list.Mylist[3]['name'],
                          price: list.Mylist[3]['price'],
                        ),
                        FoodItem(
                          index: 4,
                          image: list.Mylist[4]['image'],
                          name: list.Mylist[4]['name'],
                          price: list.Mylist[4]['price'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Consumer<Bottom>(
          builder: (context, bottom, child) => BottomNavigationBar(
            onTap: (value) {
              print(value);
              setState(() {
                bottom.bottombarIndex = value;
                bottom.navigator(value, context);
              });
            },
            currentIndex: bottom.bottombarIndex,
            fixedColor: mainColor,
            unselectedItemColor: Colors.black26,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  CupertinoIcons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  CupertinoIcons.search,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  CupertinoIcons.person,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  CupertinoIcons.settings,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack Category_button(
      String name, int index, List<Map<String, dynamic>> selected) {
    return Stack(
      children: [
        Consumer<Listprovider>(
          builder: (context, list, child) => GestureDetector(
            onTap: () {
              setState(() {
                list.Mylist = selected;
                selectedIndex = index;
              });
              print(name);
            },
            child: SizedBox(
              height: 30,
              width: 58,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 3,
              width: 50,
              color: selectedIndex == index ? mainColor : backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}

class FoodItem extends StatefulWidget {
  String image;
  String name;
  String price;
  int index;

  FoodItem(
      {required this.image,
      required this.name,
      required this.price,
      required this.index});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Cart(
                        listIndex: widget.index,
                      ))));
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 25, right: 10, bottom: 10),
        height: 320,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('Images/food/${widget.image}'),
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontFamily: 'Mukta'),
            ),
            Text(
              'Rs ${widget.price}',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Mukta', color: mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
