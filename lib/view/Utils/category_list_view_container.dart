import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row categoryListView({
  required String categoryName,
  required Function() tapFun,
  required Function() cancelFun,
}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {},
            onTapCancel: () {},
            child: Container(
              width: 120.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0xFFAFAFAF),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
