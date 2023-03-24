import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/coffee_tile.dart';
import '../utils/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          //Find the best coffee for you
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the Best Coffee for You",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          //SearchBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find Your Coffee",
                  focusedBorder: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //Horizontal Listview of CoffeeTypes
          Container(
            height: 50,
            child: ListView.builder(
              itemCount: coffeeType.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeetype: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    ontap: () {
                      coffeetypeselected(index);
                    });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Horizontal Listview of CoffeeTiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(imgpath: 'images/capuccino.jpg', name: 'capuccino', price: '\$4',), 
              CoffeeTile(imgpath: 'images/latte.jpg', name: 'Latte', price: '\$5.3',), 
              CoffeeTile(imgpath: 'images/milk.jpg', name: 'Milk', price: '\$2.5',)],
          ))
        ],
      ),
    );
  }

  void coffeetypeselected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length;i++){
       coffeeType[i][1] = false;

      }
       coffeeType[index][1] = true;
    });
  }

  final List coffeeType = [
    //[coffeetype, isSelected]
    ['Cappucino', true],
    ['Latte', false],
    ['Milk', false],
    ['Black', false],
  ];
}
