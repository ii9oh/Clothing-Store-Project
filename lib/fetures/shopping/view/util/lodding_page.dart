import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Scaffold loadingPage() => Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
            ),
            Text(
              'SOHAIB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: 8,
              ),
            ),
            Text(
              'ONLINE CLOTHING STORE SOHAIB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
