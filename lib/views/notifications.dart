import 'package:hotelp/utils/discutils.dart';
import 'package:hotelp/widgets/home/notification_screen.dart';

import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';

class CouponsDetails extends StatelessWidget {
  const CouponsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  icon: const HeroIcon(HeroIcons.chevronLeft),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                itemCount: $discUtils.coupons.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NotificationScreen(coupons: $discUtils.coupons[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
            ]),
      ),
    );
  }
}
