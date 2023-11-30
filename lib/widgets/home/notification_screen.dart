import 'package:hotelp/models/coupons.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final Coupons coupons;
  const NotificationScreen({Key? key, required this.coupons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 2,
                      blurRadius: 10)
                ]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Row(children: [
                      Expanded(
                        child: Text(
                          coupons.coupName,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                      //const Spacer(),
                    ]),
                    const SizedBox(height: 5),
                    Text(
                      coupons.coupDesc,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    const Text("Use Code:"),
                    Text(
                      coupons.coupCode,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                  ]),
            )));
  }
}
