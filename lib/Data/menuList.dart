import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/Home.dart';

import '../pages/search.dart';

class Listprovider extends ChangeNotifier {
  List<Map<String, dynamic>> allItems = [
    {
      'name': 'Chocolate Brownie',
      'image': 'ChocolateBrownie.jpg',
      'price': '150'
    },
    {
      'name': 'Vanilla Ice Cream',
      'image': 'VanillaIceCream.jpg',
      'price': '120'
    },
    {'name': 'Cheesecake', 'image': 'Cheesecake.jpg', 'price': '180'},
    {'name': 'Gulab Jamun', 'image': 'GulabJamun.jpg', 'price': '100'},
    {
      'name': 'Strawberry Shortcake',
      'image': 'StrawberryShortcake.jpg',
      'price': '200'
    },
    {'name': 'Mango Sorbet', 'image': 'MangoSorbet.jpg', 'price': '130'},
    {
      'name': 'Red Velvet Cupcake',
      'image': 'RedVelvetCupcake.jpg',
      'price': '90'
    },
    {'name': 'Tiramisu', 'image': 'Tiramisu.jpg', 'price': '140'},
    {'name': 'Panna Cotta', 'image': 'PannaCotta.jpg', 'price': '110'},
    {'name': 'Fruit Trifle', 'image': 'FruitTrifle.jpg', 'price': '160'},
    {
      'name': 'Chicken \nBiryani',
      'image': 'ChickenBiryani.jpg',
      'price': '900',
    },
    {
      'name': 'Panner \nHandi',
      'image': 'EggCurry.png',
      'price': '800',
    },
    {
      'name': 'Egg \nCurry',
      'image': 'KajuMasaala.jpg',
      'price': '700',
    },
    {
      'name': 'Kaju \nMasaala',
      'image': 'PannerHandi.jpg',
      'price': '750',
    },
    {
      'name': 'Panner \nTikka',
      'image': 'PannerTikka.jpg',
      'price': '700',
    },
    {'name': 'Mango Lassi', 'image': 'MangoLassi.jpg', 'price': '100'},
    {'name': 'Cappuccino', 'image': 'Cappuccino.jpg', 'price': '150'},
    {'name': 'Iced Tea', 'image': 'IcedTea.jpg', 'price': '120'},
    {'name': 'Mojito', 'image': 'Mojito.jpg', 'price': '180'},
    {
      'name': 'Strawberry Smoothie',
      'image': 'StrawberrySmoothie.jpg',
      'price': '200'
    },
    {'name': 'Hot Chocolate', 'image': 'HotChocolate.jpg', 'price': '130'},
    {'name': 'Green Tea', 'image': 'GreenTea.jpg', 'price': '90'},
    {'name': 'Orange Juice', 'image': 'OrangeJuice.jpg', 'price': '110'},
    {'name': 'Lemonade', 'image': 'Lemonade.jpg', 'price': '100'},
    {'name': 'Coke', 'image': 'coke.jpg', 'price': '60'},
    {
      'name': 'Mirinda',
      'image': 'mirinda.jpg',
      'price': '50',
    },
    {
      'name': 'Fanta',
      'image': 'Fanta.png',
      'price': '50',
    },
    {
      'name': 'Sprite',
      'image': 'Sprite.png',
      'price': '50',
    },
    {
      'name': 'Red Bull',
      'image': 'RedBull.jpg',
      'price': '120',
    },
    {
      'name': 'Monster',
      'image': 'monster.jpg',
      'price': '100',
    }
  ];
  List<Map<String, dynamic>> Mylist = [];
  List<Map<String, dynamic>> Drinks = [
    {'name': 'Mango Lassi', 'image': 'MangoLassi.jpg', 'price': '100'},
    {'name': 'Cappuccino', 'image': 'Cappuccino.jpg', 'price': '150'},
    {'name': 'Iced Tea', 'image': 'IcedTea.jpg', 'price': '120'},
    {'name': 'Mojito', 'image': 'Mojito.jpg', 'price': '180'},
    {
      'name': 'Strawberry Smoothie',
      'image': 'StrawberrySmoothie.jpg',
      'price': '200'
    },
    {'name': 'Hot Chocolate', 'image': 'HotChocolate.jpg', 'price': '130'},
    {'name': 'Green Tea', 'image': 'GreenTea.jpg', 'price': '90'},
    {'name': 'Orange Juice', 'image': 'OrangeJuice.jpg', 'price': '110'},
    {'name': 'Lemonade', 'image': 'Lemonade.jpg', 'price': '100'},
    {'name': 'Coke', 'image': 'coke.jpg', 'price': '60'},
    {
      'name': 'Mirinda',
      'image': 'mirinda.jpg',
      'price': '50',
    },
    {
      'name': 'Fanta',
      'image': 'Fanta.png',
      'price': '50',
    },
    {
      'name': 'Sprite',
      'image': 'Sprite.png',
      'price': '50',
    },
    {
      'name': 'Red Bull',
      'image': 'RedBull.jpg',
      'price': '120',
    },
    {
      'name': 'Monster',
      'image': 'monster.jpg',
      'price': '100',
    }
  ];
  List<Map<String, dynamic>> Food = [
    {
      'name': 'Chicken \nBiryani',
      'image': 'ChickenBiryani.jpg',
      'price': '900',
    },
    {
      'name': 'Panner \nHandi',
      'image': 'EggCurry.png',
      'price': '800',
    },
    {
      'name': 'Egg \nCurry',
      'image': 'KajuMasaala.jpg',
      'price': '700',
    },
    {
      'name': 'Kaju \nMasaala',
      'image': 'PannerHandi.jpg',
      'price': '750',
    },
    {
      'name': 'Panner \nTikka',
      'image': 'PannerTikka.jpg',
      'price': '700',
    }
  ];
  List<Map<String, dynamic>> Deserts = [
    {
      'name': 'Chocolate Brownie',
      'image': 'ChocolateBrownie.jpg',
      'price': '150'
    },
    {
      'name': 'Vanilla Ice Cream',
      'image': 'VanillaIceCream.jpg',
      'price': '120'
    },
    {'name': 'Cheesecake', 'image': 'Cheesecake.jpg', 'price': '180'},
    {'name': 'Gulab Jamun', 'image': 'GulabJamun.jpg', 'price': '100'},
    {
      'name': 'Strawberry cake',
      'image': 'StrawberryShortcake.jpg',
      'price': '200'
    },
    {'name': 'Mango Sorbet', 'image': 'MangoSorbet.jpg', 'price': '130'},
    {
      'name': 'Red Velvet Cupcake',
      'image': 'RedVelvetCupcake.jpg',
      'price': '90'
    },
    {'name': 'Tiramisu', 'image': 'Tiramisu.jpg', 'price': '140'},
    {'name': 'Panna Cotta', 'image': 'PannaCotta.jpg', 'price': '110'},
    {'name': 'Fruit Trifle', 'image': 'FruitTrifle.jpg', 'price': '160'},
  ];

  List<Map<String, dynamic>> Cart = [];

  void addToCart(int index) {
    Cart.add(Mylist[index]);
    notifyListeners();
  }

  void removeFromCart(int index) {
    Cart.remove(Cart[index]);
    notifyListeners();
  }

  int quantity = 1;
  void Increase(int index) {
    quantity++;
    notifyListeners();
  }

  void decreaes(int index) {
    quantity--;
    notifyListeners();
  }

  String totalPrice() {
    double price = 0;
    for (int i = 0; i <= Cart.length - 1; i++) {
      price += double.parse(Cart[i]['price']);
    }

    return price.toStringAsFixed(2);
  }
}

class Bottom extends ChangeNotifier {
  int bottombarIndex = 0;
  void navigator(int value, context) {
    if (value == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Search())));
    } else if (value == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Home())));
    } else if (value == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Drawer())));
    }
  }
}
