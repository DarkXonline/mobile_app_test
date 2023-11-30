import 'package:wedlock/widgets/details/photo_details.dart';
import 'package:wedlock/widgets/pricetext.dart';
import 'package:wedlock/models/wedding.dart';
import 'package:wedlock/widgets/forms/customer_details.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class BookingDetails extends StatelessWidget {
  final Wedding wedding;

  const BookingDetails({Key? key, required this.wedding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Row(children: [
                IconButton(
                  icon: const HeroIcon(HeroIcons.chevronLeft),
                  onPressed: () => Navigator.pop(context),
                ),
                const Row(children: [
                  SizedBox(width: 5),
                  Text(
                    'Booking Details',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  )
                ]),
              ]),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  wedding.more['url'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              PhotoDetails(photos: wedding.more['details']),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Text(
                    wedding.name,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(children: [
                  Text(
                    wedding.star.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  HeroIcon(HeroIcons.star,
                      size: 28,
                      style: HeroIconStyle.solid,
                      color: Colors.yellow.shade500)
                ])
              ]),
              const SizedBox(height: 5),
              MonthlyPrice(price: wedding.price),
              const SizedBox(height: 20),
              Container(
                height: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade100)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${wedding.more['course']} courses',
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      Container(
                        width: 2,
                        height: 40,
                        color: Colors.black26,
                      ),
                      Text('${wedding.more['vanue']}',
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ]),
              ),
              const SizedBox(height: 20),
              const SizedBox(width: 5),
              const Text(
                'Customer information:',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              // Include the MyCustomForm widget here
              const CustomerDetailsForm(),
            ]),
      ),
    );
  }
}
