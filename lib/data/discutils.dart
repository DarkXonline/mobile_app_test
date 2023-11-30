import 'package:wedlock/models/coupons.dart';

import 'package:flutter/material.dart';

final $discUtils = DiscUtils();

class DiscUtils {
  late final primary = Colors.blueGrey;

  final coupons = <Coupons>[
    Coupons(
      coupName: 'Black Friday deals',
      coupDesc: 'Discount 20% off all package on Black Friday!',
      coupCode: 'BLACKFRIYAY',
    ),
    Coupons(
      coupName: 'Cyber Monday deals',
      coupDesc: 'Discount 50% off Platinum Package on Cyber Monday!',
      coupCode: 'CYBER50',
    )
  ];
}
