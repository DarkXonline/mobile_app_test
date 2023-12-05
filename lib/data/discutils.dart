import 'package:wedlock/models/coupons.dart';

import 'package:flutter/material.dart';

final $discUtils = DiscUtils();

class DiscUtils {
  late final primary = Colors.blueGrey;

  final coupons = <Coupons>[
    Coupons(
      coupName: 'Cuti Sekolah deals',
      coupDesc: 'Discount 20% off all package on Cuti Sekolah!',
      coupCode: 'CUTIYAY',
    ),
    Coupons(
      coupName: 'Aidilfitri Deals',
      coupDesc: 'Discount 10% off Platinum Package on Aidilfitri!',
      coupCode: 'RAYARAYARAYA',
    )
  ];
}
