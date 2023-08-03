import 'package:flutter/material.dart';

Container cartItemContainer({
  required int itmeCount,
}) =>
    Container(
      width: 360,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 20,
              offset: Offset(0, 0),
              spreadRadius: 2,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${itmeCount.toString()} item",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
