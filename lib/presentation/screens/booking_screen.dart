import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';

import 'package:hotel_app/presentation/screens/success_booking_screen.dart';
import 'package:hotel_app/theme.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late int _bookingNight;

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late bool _nameValidate;
  late bool _phoneValidate;

  @override
  void initState() {
    super.initState();

    _bookingNight = 1;

    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _nameValidate = false;
    _phoneValidate = false;
  }

  void _onTapBooking() {
    _nameValidate = false;
    _phoneValidate = false;

    if (_nameController.text.isEmpty && _phoneController.text.isEmpty) {
      setState(() {
        _nameValidate = true;
        _phoneValidate = true;
      });
    } else if (_nameController.text.isEmpty) {
      setState(() {
        _nameValidate = true;
      });
    } else if (_phoneController.text.isEmpty) {
      setState(() {
        _phoneValidate = true;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessBookingScreen()),
      );
    }
  }

  void _incrementBooking() {
    setState(() {
      _bookingNight++;
    });
  }

  void _decrementBooking() {
    if (_bookingNight != 1) {
      setState(() {
        _bookingNight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _customTextField({
      required String title,
      required TextEditingController controller,
      required bool validate,
      required TextInputType keyboardType,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Text(
              title,
              style: primaryTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            // height: 35,
            margin: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                filled: true,
                fillColor: whiteColor,
                errorText: validate ? 'This Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildDetailHotel() {
      return Container(
        margin: const EdgeInsets.only(
          left: 12,
          bottom: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.hotel.imageAsset,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.name,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      widget.hotel.location,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${widget.hotel.price.toStringAsFixed(3)} /night',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildBookingFewNight() {
      Widget _button({required String text, required Function() onPressed}) {
        return TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(35, 35),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            _button(
              text: '-',
              onPressed: _decrementBooking,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                _bookingNight.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            _button(
              text: '+',
              onPressed: _incrementBooking,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              '/night',
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget _buildTotalPrice() {
      return Container(
        margin: const EdgeInsets.only(
          left: 16,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Text(
              'Rp. ${(widget.hotel.price * _bookingNight).toStringAsFixed(3)}',
              style: primaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget _buildButtonBooking() {
      return Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
        ),
        child: TextButton(
          onPressed: _onTapBooking,
          style: TextButton.styleFrom(
            primary: whiteColor,
            backgroundColor: primaryColor,
            minimumSize: const Size.fromHeight(45),
            textStyle: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text('Book Now'),
        ),
      );
    }

    Widget _buildBody() {
      return SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 500,
              margin: EdgeInsets.all(
                defaultMargin,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDetailHotel(),
                  Divider(
                    thickness: .5,
                    color: secondaryTextColor,
                  ),
                  _customTextField(
                    title: 'Full Name',
                    controller: _nameController,
                    validate: _nameValidate,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _customTextField(
                    title: 'No. Phone',
                    controller: _phoneController,
                    validate: _phoneValidate,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildBookingFewNight(),
                  _buildTotalPrice(),
                  _buildButtonBooking(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: _buildBody(),
    );
  }
}
