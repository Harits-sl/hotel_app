import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24;
double maxWidth = 900;

// color
Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff000000);
Color backgroundColor = const Color(0xffF3F9FF);
Color primaryColor = const Color(0xff195CB7);
Color secondaryColor = const Color(0xff02318E);
Color primaryTextColor = const Color(0xff1F2736);
Color secondaryTextColor = const Color(0xffA4B8CE);

// textStyle
TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);
TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

// fontWeight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
