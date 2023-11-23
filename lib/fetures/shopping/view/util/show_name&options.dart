import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Row nameOptionBar({
  required String name,
  required Function() cartFun,
  required Function() optionFun,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hi  ",
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 25.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 120.w,
          //MediaQuery.of(context as BuildContext).size.width,
        ),
        SizedBox(
          width: 32.w,
          child: Stack(
            children: [
              GestureDetector(
                onTap: cartFun,
                child: Image.asset("assets/images/wishlist.png"),
              )
            ],
          ),
        ),
        SizedBox(
          width: 38.w,
          child: GestureDetector(
            onTap: optionFun,
            child: Image.asset("assets/images/burger button.png"),
          ),
          //! Than add Red Dot Here
        )
      ],
    );
