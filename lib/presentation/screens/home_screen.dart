import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/presentation/screens/detail_screen.dart';
import 'package:hotel_app/presentation/screens/search_screen.dart';
import 'package:hotel_app/presentation/widgets/custom_card_nice_place_hotel.dart';
import 'package:hotel_app/presentation/widgets/custom_list_tile_hotel.dart';
import 'package:hotel_app/presentation/widgets/item_popular_hotel.dart';
import 'package:hotel_app/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollPopularHotelController;
  late ScrollController _scrollNiceHotelController;

  @override
  void initState() {
    super.initState();

    _scrollPopularHotelController = ScrollController();
    _scrollNiceHotelController = ScrollController();
  }

  @override
  void dispose() {
    _scrollPopularHotelController.dispose();
    _scrollNiceHotelController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<HotelModel> _hotelList = hotelList;

    void _onTap(HotelModel hotel) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(hotel: hotel)),
      );
    }

    void _onTapSearch() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    }

    Widget _title(String title) {
      return Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 14,
          fontWeight: semiBold,
        ),
      );
    }

    Widget _buildSearch() {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _onTapSearch,
          child: Container(
            width: maxWidth,
            height: 45,
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11),
                  child: Icon(
                    Icons.search_rounded,
                    color: secondaryTextColor,
                  ),
                ),
                Text(
                  'Search Hotel',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildRecomendedHotel() {
      Widget _listTileRecommendedHotel(HotelModel hotel) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _onTap(hotel);
            },
            child: Container(
              padding: const EdgeInsets.all(
                16,
              ),
              margin: const EdgeInsets.only(
                top: 12,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        hotel.imageAsset,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          hotel.name,
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          hotel.description,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: light,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        width: maxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Recommended Hotel'),
            _listTileRecommendedHotel(_hotelList[0]),
          ],
        ),
      );
    }

    Widget _buildPopularHotel() {
      int _index = 0;

      return Scrollbar(
        isAlwaysShown: kIsWeb ? true : false,
        thickness: kIsWeb ? 4 : 0,
        controller: _scrollPopularHotelController,
        child: Container(
          width: maxWidth,
          padding: EdgeInsets.only(
            top: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                ),
                child: _title('Popular Hotel'),
              ),
              SizedBox(
                height: 285,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollPopularHotelController,
                  children: hotelList.skip(1).take(2).map((hotel) {
                    _index++;

                    return Container(
                      margin: EdgeInsets.only(
                        left: _index == 1 ? defaultMargin : 16,
                        right: _index == 2 ? defaultMargin : 0,
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            _onTap(hotel);
                          },
                          child: ItemPopularHotel(hotel: hotel),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildNicePlaceToStayHotel() {
      int _index = 0;

      return Container(
        width: maxWidth,
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
              child: _title('Nice Place to Stay'),
            ),
            SizedBox(
              height: 250,
              child: Scrollbar(
                isAlwaysShown: kIsWeb ? true : false,
                thickness: kIsWeb ? 4 : 0,
                controller: _scrollNiceHotelController,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollNiceHotelController,
                  children: hotelList.skip(3).take(2).map((hotel) {
                    _index++;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          _onTap(hotel);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: _index == 1 ? defaultMargin : 16,
                            right: _index == 2 ? defaultMargin : 0,
                          ),
                          child: CustomCardNicePlaceHotel(hotel: hotel),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildBestHotel() {
      List<HotelModel> _bestHotelList = [];

      _bestHotelList.add(_hotelList[5]);
      _bestHotelList.add(_hotelList[3]);
      _bestHotelList.add(_hotelList[1]);
      _bestHotelList.add(_hotelList[0]);

      Widget _bestHotelListView() {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: _bestHotelList
              .map(
                (hotel) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _onTap(hotel);
                    },
                    child: CustomListTileHotel(hotel: hotel),
                  ),
                ),
              )
              .toList(),
        );
      }

      Widget _bestHotelGrid(int gridCount) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: gridCount,
          mainAxisSpacing: 14,
          crossAxisSpacing: defaultMargin,
          childAspectRatio: (1 / .25),
          physics: const NeverScrollableScrollPhysics(),
          children: _bestHotelList
              .map(
                (hotel) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _onTap(hotel);
                    },
                    child: CustomListTileHotel(hotel: hotel),
                  ),
                ),
              )
              .toList(),
        );
      }

      return Container(
        width: maxWidth,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Best Hotel'),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 700) {
                return _bestHotelListView();
              } else {
                return _bestHotelGrid(2);
              }
            }),
          ],
        ),
      );
    }

    Widget _buildBody() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: defaultMargin,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearch(),
                  _buildRecomendedHotel(),
                  _buildPopularHotel(),
                  _buildNicePlaceToStayHotel(),
                  _buildBestHotel(),
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
