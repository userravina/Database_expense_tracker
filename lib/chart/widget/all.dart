import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({Key? key, required this.expenses}) : super(key: key);
  final List<double> expenses;
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: GoogleFonts.abel(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: kTextColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtn(onPress: () {}, iconData: Icons.arrow_back_outlined),
              Text(
                'Nov 10, 2020 - Nov 18, 2021',
                style: GoogleFonts.atma(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: kTextColor),
              ),
              CustomBtn(onPress: () {}, iconData: Icons.arrow_forward_outlined),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomBar(
                  day: 'Su',
                  amountSpent: expenses[0],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Mo',
                  amountSpent: expenses[1],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Tu',
                  amountSpent: expenses[2],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'We',
                  amountSpent: expenses[3],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Th',
                  amountSpent: expenses[4],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Fr',
                  amountSpent: expenses[5],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Sa',
                  amountSpent: expenses[6],
                  expensive: mostExpensive),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget {
  CustomBar(
      {Key? key,
        required this.day,
        required this.amountSpent,
        required this.expensive})
      : super(key: key);
  final String day;
  final double amountSpent;
  final double expensive;
  final double _maxBarHeight = 20.h;
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / expensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: GoogleFonts.aubrey(
              fontSize: 11.sp, fontWeight: FontWeight.w500, color: kTextColor),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: barHeight,
          width: 3.w,
          decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          day,
          style: GoogleFonts.abel(
              fontSize: 11.sp, fontWeight: FontWeight.w600, color: kTextColor),
        ),
      ],
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({Key? key, required this.onPress, required this.iconData})
      : super(key: key);
  final VoidCallback onPress;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(iconData),
    );
  }
}

const Color kScaffoldColor = Color(0xFF1C2833);
const Color kPrimaryColor = Color(0xFF17202A);
const Color kSecondaryColor = Color(0xFF32B3DF);
const Color kTextColor = Color(0xFFFFFFFF);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double percentage) {
  if (percentage >= 0.50) {
    return kScaffoldColor;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}