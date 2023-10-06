import 'package:flutter/material.dart';

class AnimatedShoppingCartButton extends StatefulWidget {


  const AnimatedShoppingCartButton({super.key});

  @override
  State<AnimatedShoppingCartButton> createState() => _AnimatedShoppingCartButtonState();
}

class _AnimatedShoppingCartButtonState extends State<AnimatedShoppingCartButton> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),

      body: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;

          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
              width: isExpanded ? 200 : 70,
              height: 60,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 15 : 10)
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(isExpanded ? Icons.check : Icons.shopping_cart),
                Text( isExpanded ? 'the button has expanded' : '')
              ],
            )
            )
          ),

        ),
    );
  }
}
