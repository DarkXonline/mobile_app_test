import 'package:hotelp/widgets/home/wedding_card.dart';
import 'package:hotelp/views/notifications.dart';
import 'package:hotelp/views/bookinghistory.dart';
import 'package:hotelp/data/utils.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Builder(
          builder: (BuildContext scaffoldContext) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const HeroIcon(HeroIcons.bars2),
                        onPressed: () {
                          // Open the sidebar when the bars icon is pressed
                          Scaffold.of(scaffoldContext).openDrawer();
                        },
                      ),
                      const Row(children: [
                        Image(
                          image: AssetImage('assets/animations/splash.png'),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'WedLock',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        )
                      ]),
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
                const Text(
                  '  Choose a package:',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: $utils.wedding.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return WeddingCard(wedding: $utils.wedding[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                ),
              ],
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Booking History'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BHistory(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
