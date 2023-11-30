import 'package:hotelp/models/historys.dart';

import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  final Historys historys;
  const BookingHistory({Key? key, required this.historys}) : super(key: key);

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
                          historys.coupName,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                      //const Spacer(),
                    ]),
                    const SizedBox(height: 5),
                    Text(
                      historys.coupDesc,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    const Text("Use Code:"),
                    Text(
                      historys.coupCode,
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
