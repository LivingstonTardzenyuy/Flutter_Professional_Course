import 'package:flutter/material.dart';


class AnimatedShoppingCartButton extends StatefulWidget {

  @override
  State<AnimatedShoppingCartButton> createState() => _AnimatedShoppingCartButtonState();
}

class _AnimatedShoppingCartButtonState extends State<AnimatedShoppingCartButton> {

  bool isExpanded = false;
  Color selectedColor = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),

      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width:  isExpanded ? 80 : 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 10 ),
              color: isExpanded ? Colors.blue : Colors.green,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Icon(
                    isExpanded ? Icons.shopping_bag : Icons.check,
                    color: Colors.white,
                  ),
                ),

                if(!isExpanded)
                  Text('added to cart')
              ],
            )
            ),
          ),
        ),
    );
  }
}
