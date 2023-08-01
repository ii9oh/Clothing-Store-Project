import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row nameOptionbar({
  required String name,
  required Function() carFun,
  required Function() optionFun,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Hi  ",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 175,
        ),
        Container(
          width: 42,
          height: 38,
          child: Stack(
            children: [
              Container(
                width: 38,
                height: 38,
                child: GestureDetector(
                  child: Image.asset("assets/images/wishlist.png"),
                  onTap: carFun,
                ),
                //! Than add Red Dot Here
              )
            ],
          ),
        ),
        Container(
          width: 38,
          height: 38,
          child: GestureDetector(
            child: Image.asset("assets/images/burger button.png"),
            onTap: optionFun,
          ),
          //! Than add Red Dot Here
        )
      ],
    );
