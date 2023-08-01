import 'package:flutter/material.dart';

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
              width: 130,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.50,
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
                      fontSize: 12,
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
