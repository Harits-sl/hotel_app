import 'package:flutter/material.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/presentation/screens/detail_screen.dart';
import 'package:hotel_app/presentation/widgets/custom_list_tile_hotel.dart';
import 'package:hotel_app/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<HotelModel> _hotelDatas;
  late List<HotelModel> _hotelList;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _hotelDatas = hotelList;
    _hotelList = [];
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  void _onTap(HotelModel hotel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(hotel: hotel)),
    );
  }

  void _searchHotel(String query) {
    List<HotelModel> _list = [];

    for (var hotel in _hotelDatas) {
      if (hotel.name.toLowerCase().contains(query.toLowerCase())) {
        _list.add(hotel);
      }
    }
    setState(() {
      _hotelList = _list;
    });
  }

  void _clearResult() {
    setState(() {
      _hotelList.clear();
      _hotelList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSearch() {
      return Container(
        width: maxWidth,
        height: 45,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: TextField(
          autofocus: true,
          controller: _searchController,
          textAlignVertical: TextAlignVertical.bottom,
          onChanged: (String query) {
            _searchHotel(query);

            if (_searchController.text == '') {
              _clearResult();
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            hintText: 'Search hotel',
            hintStyle: secondaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: Icon(
                Icons.search_rounded,
                color: secondaryTextColor,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      );
    }

    Widget _buildResultSearch() {
      return Container(
        width: maxWidth,
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result (${_hotelList.length})',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _hotelList
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
            ),
          ],
        ),
      );
    }

    Widget _buildBody() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSearch(),
                _buildResultSearch(),
              ],
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
