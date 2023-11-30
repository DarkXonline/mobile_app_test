import 'package:hotelp/models/wedding.dart';

import 'package:flutter/material.dart';

final $utils = Utils();

class Utils {
  late final primary = Colors.blueGrey;

  final wedding = <Wedding>[
    Wedding(
        name: 'Silver Package',
        briefdesc: 'Elegant Affair, Classic charm meets simplicity',
        mostpopular: '',
        price: 950.0,
        star: 4.4,
        description:
            'Elevate your wedding with our Silver package, the Elegant Affair. This package is designed for couples who appreciate the beauty in simplicity. Enjoy the charm of our venue with basic yet tasteful decorations. Indulge in a delightful three-course dinner with menu options to suit every palate. The Silver Package offers an intimate and refined setting, perfect for couples who desire an elegant celebration without excessive frills.',
        more: {
          'course': '3',
          'vanue': 'Beautiful venue',
          'location': 'Rome, Italy',
          'url': 'assets/home/pack1.jpg',
          'details': [
            'assets/details/silver1.jpg',
            'assets/details/silver2.jpg',
            'assets/details/silver3.jpg'
          ],
        }),
    Wedding(
        name: 'Gold Package',
        briefdesc: 'Elevated Luxe, A step beyond ordinary',
        mostpopular: 'Most Popular!',
        price: 1150.0,
        star: 4.6,
        description:
            'Make your wedding a Premier Celebration with our Gold Package. This tier provides an exclusive experience in a premium venue adorned with enhanced decor options. Delight your guests with a gourmet four-course dinner, including an array of appetizers during cocktail hour. The upgraded open bar and champagne toast add an extra touch of luxury. The Gold Package is perfect for couples seeking a sophisticated and memorable celebration.',
        more: {
          'course': '4',
          'vanue': 'Premium venue',
          'location': 'Tuscany, Italy',
          'url': 'assets/home/pack2.jpg',
          'details': [
            'assets/details/gold1.jpg',
            'assets/details/gold2.jpg',
            'assets/details/gold3.jpg'
          ],
        }),
    Wedding(
        name: 'Platinum Package',
        briefdesc: 'Unrivaled Extravagance, Beyond dreams',
        mostpopular: '',
        price: 2000.0,
        star: 4.8,
        description:
            'For an unparalleled wedding experience, choose our Ultimate Extravaganza, the Platinum Package. This package is designed for couples who dream of a lavish celebration in a top-tier venue adorned with luxurious decor. Indulge in a five-course plated dinner with exquisite wine pairings, complemented by a premium bar. The grand dessert buffet, featuring a variety of decadent treats, and the personalized dessert experience make this package perfect for couples who want their wedding to be a true masterpiece, reflecting their unique style and taste.',
        more: {
          'course': '5',
          'vanue': 'Top-tier venue',
          'location': 'Milan, Italy',
          'url': 'assets/home/pack3.jpg',
          'details': [
            'assets/details/plat1.jpg',
            'assets/details/plat2.jpg',
            'assets/details/plat3.jpg'
          ],
        })
  ];
}
