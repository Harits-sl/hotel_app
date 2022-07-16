import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/theme.dart';

class ItemPopularHotel extends StatelessWidget {
  const ItemPopularHotel({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 285,
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              hotel.imageAsset,
              fit: BoxFit.cover,
              width: 185,
              height: 285,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(
                left: 8,
                bottom: 12,
              ),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: blackColor.withAlpha(135),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                hotel.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: light,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
