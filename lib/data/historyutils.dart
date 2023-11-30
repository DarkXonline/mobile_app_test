import 'package:wedlock/models/historys.dart';

import 'package:flutter/material.dart';

final $historyUtils = HistoryUtils();

class HistoryUtils {
  late final primary = Colors.blueGrey;

  final historys = <Historys>[
    Historys(
        historyPackage: 'Platinum Package',
        historyComments: 'Sumpah gempaksss x rugi ooo',
        historyRate: 5.0),
    Historys(
        historyPackage: 'Silver Package',
        historyComments: 'Servis mantaps, cuma makanan kurang skit je',
        historyRate: 4.5)
  ];
}
