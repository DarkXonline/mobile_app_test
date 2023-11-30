import 'package:hotelp/views/home.dart';
import 'package:hotelp/data/historyutils.dart';
import 'package:hotelp/widgets/booking/booking_history.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class BHistory extends StatelessWidget {
  const BHistory({Key? key}) : super(key: key);

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
                Row(children: [
                  IconButton(
                    icon: const HeroIcon(HeroIcons.bars2),
                    onPressed: () {
                      // Open the sidebar when the bars icon is pressed
                      Scaffold.of(scaffoldContext).openDrawer();
                    },
                  ),
                  const Row(children: [
                    SizedBox(width: 5),
                    Text(
                      'Booking History',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    )
                  ]),
                ]),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: $historyUtils.historys.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BookingHistory(
                        historys: $historyUtils.historys[index]);
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Booking History'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
