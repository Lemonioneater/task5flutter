import 'package:flutter/material.dart';
import 'package:task3ahmed_faisal/Data/Product%20file.dart';


class Cartdisp extends StatefulWidget {
  final Product product2;

  const Cartdisp({super.key, required this.product2});

  @override
  State<Cartdisp> createState() => _CartdispState();
}

class _CartdispState extends State<Cartdisp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[400]
          ),
          child: Row(
            children: [
              Container(
         height: 125, width: 125,
         margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage( widget.product2.thumbnail
    ),
    ),
    ),
    ),
              Column(
                children: [
                  Text('Item : ${widget.product2.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                    ),),
                  Text('Total quantity of this item : ${widget.product2.count}',
                   style: TextStyle(
                     fontWeight: FontWeight.w400
                   ),),
                  Text('Total price of them : ${(widget.product2.count*widget.product2.price).toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              )
    ],
    ),
    ),
    ],
    );
  }
}
