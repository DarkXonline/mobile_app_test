import 'package:hotelp/widgets/pricetext.dart';
import 'package:hotelp/views/details.dart';
import 'package:hotelp/models/wedding.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class WeddingCard extends StatelessWidget {
  final Wedding wedding;

  const WeddingCard({Key? key, required this.wedding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WeddingDetails(wedding: wedding)));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 2,
                    blurRadius: 10)
              ]),
          child: Stack(children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(wedding.more['url'], fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: wedding.mostpopular != '' &&
                            wedding.mostpopular.isNotEmpty,
                        child: Text(
                          wedding.mostpopular.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                          child: Text(
                            wedding.name,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ),
                        //const Spacer(),
                      ]),
                      const SizedBox(height: 5),
                      Text(
                        wedding.briefdesc,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Row(children: [
                        MonthlyPrice(price: wedding.price),
                        const Spacer(),
                        Row(children: [
                          Text(
                            wedding.star.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          HeroIcon(HeroIcons.star,
                              size: 26,
                              style: HeroIconStyle.solid,
                              color: Colors.yellow.shade500)
                        ])
                      ])
                    ]),
              ),
            )
          ])),
    );
  }
}
