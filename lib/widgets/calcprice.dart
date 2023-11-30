import 'package:flutter/material.dart';

class MonthlyPrice extends StatelessWidget {
  final double price;

  const MonthlyPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: 'RM${price.ceil()}',
            style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 22,
                fontWeight: FontWeight.w900)),
      ]),
    );
  }
}
