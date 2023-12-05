import 'package:flutter/material.dart';
import 'package:wedlock/widgets/rating.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String paymentStatus = 'Unpaid';

  void updatePaymentStatus(String newStatus) {
    setState(() {
      paymentStatus = newStatus;
    });
  }

  Future<void> _showPaymentConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap a button to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to confirm the payment?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thank you for purchasing!')),
                );
                updatePaymentStatus('Paid');
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to the RatingPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RatingPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showPaymentConfirmationDialog();
                //updatePaymentStatus('Paid');
              },
              child: const Text('Credit Card'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showPaymentConfirmationDialog();
                //updatePaymentStatus('Paid');
              },
              child: const Text('PayPal'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showPaymentConfirmationDialog();
                //updatePaymentStatus('Paid');
              },
              child: const Text('Google Pay'),
            ),
          ),
          const SizedBox(height: 10),
          // Add the PriceCalculatorForm here
          //PriceCalculatorForm(),
          const SizedBox(height: 10),
          Text(
            'Payment Status: $paymentStatus',
            style: const TextStyle(fontSize: 20),
          ),
          /*if (paymentStatus == 'Paid') ...[
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 200, // Set the width of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RatingPage()),
                  );
                },
                child: Text('Leave a rating'),
              ),
            ),
          ],*/
        ],
      ),
    );
  }
}
