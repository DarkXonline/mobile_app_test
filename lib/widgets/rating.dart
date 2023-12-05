import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wedlock/views/home.dart';

import 'package:heroicons/heroicons.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
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
                  'Rating',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                )
              ]),
            ]),
            const Text(
              'Rate this package:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Comment:'),
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the rating submission logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thank you for your rating!')),
                );
                // Navigate to the homepage
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
