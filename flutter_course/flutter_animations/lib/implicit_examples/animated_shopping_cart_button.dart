import 'package:flutter/material.dart';

class AnimatedShoppingCart extends StatefulWidget {
  @override
  State<AnimatedShoppingCart> createState() => _AnimatedShoppingCartState();
}

class _AnimatedShoppingCartState extends State<AnimatedShoppingCart> {
  // const AnimatedShoppingCart({super.key});
  bool isTouched = false;


  @override


  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //   isTouched = !isTouched;
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          width: isTouched ? 230 : 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isTouched ? 40 : 10),
            color: isTouched ? Colors.green : Colors.blue,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isTouched = !isTouched;
                    });
                  },
                  icon: Icon(isTouched ? Icons.airplane_ticket :Icons.shopping_cart,color: Colors.white,),
      ),

              Text(isTouched ? 'added to Cart' : ''),

            ],
          ),
        ),
      ),
    );
  }
}
