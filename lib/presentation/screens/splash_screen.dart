import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/screens/home_screen.dart';
import 'package:hotel_app/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    }

    Widget _buildBody() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Find Your Perfect Place To Stay',
                style: whiteTextStyle.copyWith(
                  fontSize: 40,
                  fontWeight: bold,
                  height: 1.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 20,
                ),
                child: Text(
                  'Find your hotel easily and travel anywhere you want with us.',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    height: 1.4,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const Alignment(0, .6),
                  child: TextButton(
                    onPressed: _onTap,
                    style: TextButton.styleFrom(
                      primary: whiteColor,
                      backgroundColor: primaryColor,
                      minimumSize: const Size.fromHeight(55),
                      textStyle: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Explore Now'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: _buildBody(),
    );
  }
}
