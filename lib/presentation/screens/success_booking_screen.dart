import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/screens/home_screen.dart';
import 'package:hotel_app/theme.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }

    Widget _buildBody() {
      return Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: maxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image-1.jpg',
                ),
                const SizedBox(height: 20),
                Text(
                  'Success Booking',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    top: 40,
                  ),
                  child: TextButton(
                    onPressed: _onTap,
                    style: TextButton.styleFrom(
                      primary: primaryTextColor,
                      // backgroundColor: primaryColor,
                      minimumSize: const Size.fromHeight(45),
                      textStyle: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('Find Hotel Again'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffFDFAF5),
      body: _buildBody(),
    );
  }
}
