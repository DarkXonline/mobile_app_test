import 'package:flutter/material.dart';
import 'package:wedlock/models/wedding.dart';

class PriceCalculatorForm extends StatefulWidget {
  final Wedding wedding;
  final double totalprice;
  final Function(String) onCouponCodeChanged;
  final Function(double) onFinalPriceChanged; // Add callback for finalPrice

  const PriceCalculatorForm({
    Key? key,
    required this.onCouponCodeChanged,
    required this.onFinalPriceChanged,
    required this.totalprice,
    required this.wedding,
  }) : super(key: key);

  @override
  _PriceCalculatorFormState createState() => _PriceCalculatorFormState();
}

class _PriceCalculatorFormState extends State<PriceCalculatorForm> {
  String couponCode = '';
  double discountPercentage = 0.0;

  double calculateCouponPrice() {
    double finalprice = widget.totalprice;

    // Apply coupon code discount
    if (couponCode == 'CUTIYAY') {
      // Set your coupon code and discount percentage here
      discountPercentage = 20.0;
      finalprice -= (widget.totalprice * (discountPercentage / 100));
    }
    if (widget.wedding.name == 'Platinum Package') {
      if (couponCode == 'RAYARAYARAYA') {
        // Set your coupon code and discount percentage here
        discountPercentage = 10.0;
        finalprice -= (widget.totalprice * (discountPercentage / 100));
      }
    }

    return finalprice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Coupon Code:'),
          TextFormField(
            onChanged: (value) {
              setState(() {
                couponCode = value;
                //widget.onCouponCodeChanged(couponCode);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              double finalPrice = calculateCouponPrice();
              widget.onCouponCodeChanged(couponCode); // Notify parent
              widget.onFinalPriceChanged(finalPrice); // Notify parent

              //print('Final Price: $finalPrice');
            },
            child: const Text('Apply coupon'),
          ),
        ],
      ),
    );
  }
}
