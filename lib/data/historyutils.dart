import 'package:hotelp/models/historys.dart';

import 'package:flutter/material.dart';

final $historyUtils = HistoryUtils();

class HistoryUtils {
  late final primary = Colors.blueGrey;

  final historys = <Historys>[
    Historys(
      coupName: 'Black Friday deals',
      coupDesc: 'Discount 20% off all package on black friday!',
      coupCode: 'BLACKFRIYAY',
    ),
    Historys(
      coupName: 'Cyber Monday deals',
      coupDesc: 'Discount 50% off Platinum Package on Cyber Monday!',
      coupCode: 'CYBER90',
    )
  ];
}
