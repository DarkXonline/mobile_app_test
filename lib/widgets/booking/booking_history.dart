import 'package:wedlock/models/historys.dart';

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
                          historys.historyPackage,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                      //const Spacer(),
                    ]),
                    const SizedBox(height: 5),
                    Text(
                      historys.historyComments,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    const Text("You Rated:"),
                    Row(children: [
                      Text(
                        historys.historyRate.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 5),
                      HeroIcon(HeroIcons.star,
                          size: 28,
                          style: HeroIconStyle.solid,
                          color: Colors.yellow.shade500),
                    ]),
                    const SizedBox(width: 5),
                  ]),
            )));
  }
}
