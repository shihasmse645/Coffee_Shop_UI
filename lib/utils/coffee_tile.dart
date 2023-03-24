import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String imgpath;
  final String name;
  final String price;

  const CoffeeTile({super.key, required this.imgpath, required this.name, required this.price, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        bottom: 30
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Coffee Image
            ClipRRect(child: Image.asset(imgpath)),

            //Coffee Name
            Text(name,style: TextStyle(fontSize: 20),),
            Text("With Almond Milk",style: TextStyle(color: Colors.grey[700]),),

            //Price of Coffee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12)   
                  ),
                  child: Icon(Icons.add)),
              ],
            )
          ],
        )
      ),
    );
  }
}
