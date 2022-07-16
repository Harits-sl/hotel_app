import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/theme.dart';

class CustomCardNicePlaceHotel extends StatelessWidget {
  const CustomCardNicePlaceHotel({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              hotel.imageAsset,
              width: 235,
              height: 135,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hotel.name,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: primaryColor,
              ),
              const SizedBox(width: 2),
              Text(
                hotel.location,
                style: secondaryTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: light,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Rp ',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                  children: [
                    TextSpan(
                      text: hotel.price.toStringAsFixed(3),
                      style: blueTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                    TextSpan(
                      text: ' /night',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.yellow[600],
                    size: 20,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    hotel.rate.toString(),
                    style: secondaryTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
