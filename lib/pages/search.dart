import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Data/menuList.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/Addcart.dart';
import 'package:food_app/pages/cartScreen.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, dynamic>> SearchList = [];
  void searchItem(String name) {
    List<Map<String, dynamic>> result = [];
    if (name.isEmpty) {
      result =
          Provider.of<Listprovider>(context, listen: false).allItems.toList();
    } else {
      List<Map<String, dynamic>> names = [];
      names = Provider.of<Listprovider>(context, listen: false).allItems;
      result = names
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(name.toString().toLowerCase()))
          .toList();
    }
    setState(() {
      SearchList = result;
    });
  }

  @override
  void initState() {
    SearchList = Provider.of<Listprovider>(context, listen: false).allItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: backgroundColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchItem(value);
                    });
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
              Consumer<Listprovider>(
                builder: (context, list, child) => Expanded(
                  child: SearchList.isNotEmpty
                      ? ListView.builder(
                          itemCount: SearchList.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Cart(
                                                  listIndex: SearchList.indexOf(
                                                      SearchList[index]),
                                                ))));
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 25, right: 10, bottom: 10),
                                  height: 100,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    boxShadow: const [BoxShadow(blurRadius: 5)],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 60,
                                        margin: const EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              'Images/food/${SearchList[index]['image']}'),
                                        ),
                                      ),
                                      Text(
                                        SearchList[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 20, fontFamily: 'Mukta'),
                                      ),
                                      Text(
                                        'Rs ${SearchList[index]['price']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Mukta',
                                            color: mainColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                      : Text('No Result found'),
                ),
              ),
            ],
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
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                label: 'Serech',
                icon: Icon(CupertinoIcons.search),
              ),
              BottomNavigationBarItem(
                label: 'Serach',
                icon: Icon(CupertinoIcons.person),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(CupertinoIcons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
