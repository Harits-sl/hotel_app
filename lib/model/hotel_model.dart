import 'package:flutter/material.dart';

class HotelModel {
  final String name;
  final String location;
  final String description;
  final String imageAsset;
  final List imageAssetList;
  final double rate;
  final double price;
  final List facilityList;

  HotelModel({
    required this.name,
    required this.location,
    required this.description,
    required this.imageAsset,
    required this.imageAssetList,
    required this.rate,
    required this.price,
    required this.facilityList,
  });
}

List<HotelModel> hotelList = [
  HotelModel(
    name: 'Simple Hotel',
    location: 'Jakarta, Indonesia',
    description:
        'Hotel dengan konsep minimalis dan modern yang membuat betah dan nyaman.',
    imageAsset: 'assets/hotel-1.jpg',
    imageAssetList: [
      'assets/hotel-1.jpg',
      'assets/interior-1.jpg',
      'assets/interior-2.jpg',
      'assets/interior-3.jpg',
    ],
    rate: 4.8,
    price: 245.000,
    facilityList: [
      {
        'icon': Icons.bed_outlined,
        'title': '2 Bed',
      },
      {
        'icon': Icons.pool_outlined,
        'title': 'Swimming Pool',
      },
      {
        'icon': Icons.brunch_dining_outlined,
        'title': 'Free Breakfast',
      },
    ],
  ),
  HotelModel(
    name: 'White Hotel',
    location: 'Bandung, Indonesia',
    description: 'Hotel dengan bernuansa modern yang membuat betah dan nyaman.',
    imageAsset: 'assets/hotel-2.jpg',
    imageAssetList: [
      'assets/hotel-2.jpg',
      'assets/interior-4.jpg',
      'assets/interior-5.jpg',
      'assets/interior-6.jpg',
    ],
    rate: 4.5,
    price: 510.000,
    facilityList: [
      {
        'icon': Icons.bed_outlined,
        'title': '3 Bed',
      },
      {
        'icon': Icons.kitchen_outlined,
        'title': 'Kitchen',
      },
      {
        'icon': Icons.bathtub_outlined,
        'title': '2 Bathtub',
      },
    ],
  ),
  HotelModel(
    name: 'Wooden Hotel',
    location: 'Bogor, Indonesia',
    description: 'Hotel yang membuat anda betah untuk tinggal disini.',
    imageAsset: 'assets/hotel-3.jpg',
    imageAssetList: [
      'assets/hotel-3.jpg',
      'assets/interior-1.jpg',
      'assets/interior-3.jpg',
      'assets/interior-5.jpg',
    ],
    rate: 4.2,
    price: 315.000,
    facilityList: [
      {
        'icon': Icons.bed_outlined,
        'title': '4 Bed',
      },
      {
        'icon': Icons.kitchen_outlined,
        'title': 'Kitchen',
      },
      {
        'icon': Icons.pool_outlined,
        'title': 'Swimming Pool',
      },
    ],
  ),
  HotelModel(
    name: 'Aria Romance Hotel',
    location: 'Jakarta, Indonesia',
    description: 'Hotel ini memiliki 2 lantai, dengan 4 kamar.',
    imageAsset: 'assets/hotel-4.jpg',
    imageAssetList: [
      'assets/hotel-4.jpg',
      'assets/interior-2.jpg',
      'assets/interior-4.jpg',
      'assets/interior-6.jpg',
    ],
    rate: 4.6,
    price: 650.000,
    facilityList: [
      {
        'icon': Icons.pool_outlined,
        'title': 'Swimming Pool',
      },
      {
        'icon': Icons.brunch_dining_outlined,
        'title': 'Free Breakfast',
      },
      {
        'icon': Icons.kitchen_outlined,
        'title': 'Kitchen',
      },
    ],
  ),
  HotelModel(
    name: 'Holiday Hotel',
    location: 'Bogor, Indonesia',
    description: 'Hotel dengan pemandangan laut yang sangat indah.',
    imageAsset: 'assets/hotel-5.jpg',
    imageAssetList: [
      'assets/hotel-5.jpg',
      'assets/interior-1.jpg',
      'assets/interior-4.jpg',
      'assets/interior-5.jpg',
    ],
    rate: 4.9,
    price: 480.000,
    facilityList: [
      {
        'icon': Icons.bed_outlined,
        'title': '2 Bed',
      },
      {
        'icon': Icons.brunch_dining_outlined,
        'title': 'Free Breakfast',
      },
      {
        'icon': Icons.kitchen_outlined,
        'title': 'Kitchen',
      },
    ],
  ),
  HotelModel(
    name: 'The Omnia Hotel',
    location: 'Bandung, Indonesia',
    description:
        'Hotel berkonsep perumahan yang membuat anda berasa dirumah sendiri.',
    imageAsset: 'assets/hotel-6.jpg',
    imageAssetList: [
      'assets/hotel-6.jpg',
      'assets/interior-3.jpg',
      'assets/interior-4.jpg',
      'assets/interior-6.jpg',
    ],
    rate: 4.3,
    price: 455.000,
    facilityList: [
      {
        'icon': Icons.bed_outlined,
        'title': '4 Bed',
      },
      {
        'icon': Icons.brunch_dining_outlined,
        'title': 'Free Breakfast',
      },
      {
        'icon': Icons.pool_outlined,
        'title': 'Swimming Pool',
      },
    ],
  ),
];
