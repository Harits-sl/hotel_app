import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/presentation/screens/booking_screen.dart';
import 'package:hotel_app/presentation/widgets/item_facility.dart';
import 'package:hotel_app/theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String _imageUrl;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _imageUrl = widget.hotel.imageAssetList[0];
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onTapBack() {
    Navigator.pop(context);
  }

  void _changeImage(String imageUrl) {
    setState(() {
      _imageUrl = imageUrl;
    });
  }

  void _onTapBooking() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingScreen(
          hotel: widget.hotel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildImageAndButtonBack(double width) {
      Widget _image() {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            _imageUrl,
            width: width,
            height: 380,
            fit: BoxFit.cover,
          ),
        );
      }

      Widget _iconBack() {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _onTapBack,
            child: Container(
              margin: const EdgeInsets.only(
                left: 12,
                top: 12,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor.withAlpha(125),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: primaryTextColor,
              ),
            ),
          ),
        );
      }

      Widget _listImage() {
        Widget itemImage(String imageUrl) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                _changeImage(imageUrl);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _imageUrl == imageUrl ? primaryColor : whiteColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    imageUrl,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }

        return Positioned(
          right: 12,
          bottom: 16,
          child: SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: widget.hotel.imageAssetList
                  .map((imageUrl) => itemImage(imageUrl))
                  .toList(),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.all(
          defaultMargin,
        ),
        child: Stack(
          children: [
            _image(),
            _iconBack(),
            _listImage(),
          ],
        ),
      );
    }

    Widget _buildDetailHotel() {
      Widget _title() {
        return Text(
          widget.hotel.name,
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        );
      }

      Widget _location() {
        return Container(
          margin: const EdgeInsets.only(
            top: 4,
            bottom: 12,
          ),
          child: Row(
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
        );
      }

      Widget _rating() {
        return Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: Colors.yellow[600],
              size: 22,
            ),
            const SizedBox(width: 2),
            Text(
              widget.hotel.rate.toString(),
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
            ),
          ],
        );
      }

      Widget _description() {
        return SizedBox(
          child: Text(
            widget.hotel.description,
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
              height: 2,
            ),
            maxLines: 3,
            softWrap: true,
          ),
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(),
                    _location(),
                  ],
                ),
                _rating(),
              ],
            ),
            _description(),
          ],
        ),
      );
    }

    Widget _buildFacilities() {
      int _index = 0;
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: defaultMargin,
              ),
              child: Text(
                'Facilities',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 45,
              child: Scrollbar(
                isAlwaysShown: kIsWeb ? true : false,
                thickness: kIsWeb ? 4 : 0,
                controller: _scrollController,
                child: ListView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: widget.hotel.facilityList.map(
                    (facility) {
                      _index++;
                      return Container(
                        margin: EdgeInsets.only(
                          left: _index == 1 ? defaultMargin : 12,
                          right: _index == 3 ? defaultMargin : 0,
                        ),
                        child: ItemFacility(
                          icon: facility['icon'],
                          title: facility['title'],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildBookNow() {
      Widget _price() {
        return RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: 'Rp ${widget.hotel.price.toStringAsFixed(3)}',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
            children: [
              TextSpan(
                text: '\n/night',
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        );
      }

      Widget _buttonBookNow() {
        return TextButton(
          onPressed: _onTapBooking,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 65,
              vertical: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            'Book Now',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        );
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _price(),
              _buttonBookNow(),
            ],
          ),
        ),
      );
    }

    Widget _buildBody() {
      Widget _buildMobileView() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageAndButtonBack(double.infinity),
                  _buildDetailHotel(),
                  _buildFacilities(),
                  SizedBox(
                    height: defaultMargin * 3,
                  ),
                ],
              ),
            ),
            _buildBookNow(),
          ],
        );
      }

      Widget _buildWebView() {
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageAndButtonBack(
                  MediaQuery.of(context).size.width / 2.73),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultMargin,
                    ),
                    _buildDetailHotel(),
                    _buildFacilities(),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    _buildBookNow(),
                  ],
                ),
              ),
            ],
          ),
        );
      }

      return SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 900) {
            return _buildMobileView();
          } else {
            return _buildWebView();
          }
        }),
      );
    }

    return Scaffold(
      body: _buildBody(),
    );
  }
}
