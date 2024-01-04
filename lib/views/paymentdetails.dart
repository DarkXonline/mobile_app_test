import 'package:wedlock/views/notifications.dart';
import 'package:wedlock/widgets/details/paymentcalc_coup.dart';
import 'package:wedlock/widgets/pricetext.dart';
import 'package:wedlock/models/wedding.dart';
import 'package:wedlock/widgets/details/payment_method.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class PaymentDetails extends StatefulWidget {
  final Wedding wedding;
  final int duration;
  final bool liveBandValue;
  final bool photoBoothValue;
  final bool wifiValue;

  const PaymentDetails(
      {Key? key,
      required this.wedding,
      required this.duration,
      required this.liveBandValue,
      required this.photoBoothValue,
      required this.wifiValue})
      : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late String couponCode = '';
  late double finalPrice = 0.0;
  late double totalPrice = 0.0;

  static const double liveBandPrice = 50.0;
  static const double photoBoothPrice = 30.0;
  static const double wifiPrice = 20.0;

  double calculateFinalPrice() {
    double totalPrice = widget.wedding.price + (widget.duration * 200);

    if (widget.liveBandValue) {
      totalPrice += liveBandPrice;
    }

    if (widget.photoBoothValue) {
      totalPrice += photoBoothPrice;
    }

    if (widget.wifiValue) {
      totalPrice += wifiPrice;
    }

    return totalPrice;
  }

  double totalAdditionalPrice() {
    double totaladditional = 0.0;

    if (widget.liveBandValue) {
      totaladditional += liveBandPrice;
    }

    if (widget.photoBoothValue) {
      totaladditional += photoBoothPrice;
    }

    if (widget.wifiValue) {
      totaladditional += wifiPrice;
    }

    return totaladditional;
  }

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
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                )
              ]),
              const Spacer(),
              IconButton(
                icon: const HeroIcon(HeroIcons.bell),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CouponsDetails(),
                    ),
                  );
                },
              ),
            ]),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.wedding.name,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            if (couponCode != '') ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MonthlyPrice(price: finalPrice),
                  const SizedBox(width: 8),
                  Text(
                    'RM${calculateFinalPrice()}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
            if (couponCode == '') ...[
              MonthlyPrice(price: calculateFinalPrice()),
            ],
            const SizedBox(width: 5),
            Text(
              'Additional Service charges: ${totalAdditionalPrice()}',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5),
            Text(
              'Duration: ${widget.duration} hours',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            // Pass the callback functions to PriceCalculatorForm
            PriceCalculatorForm(
              wedding: widget.wedding,
              totalprice: calculateFinalPrice(),
              onCouponCodeChanged: (code) {
                setState(() {
                  couponCode = code; // Update couponCode in the state
                });
              },
              onFinalPriceChanged: (fprice) {
                setState(() {
                  finalPrice = fprice; // Update finalPrice in the state
                });
              },
            ),

            const SizedBox(height: 5),
            const Text(
              'Payment Method:',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const PaymentForm(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
