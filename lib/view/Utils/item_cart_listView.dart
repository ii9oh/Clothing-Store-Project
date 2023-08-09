import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding itemsListView({
  required String title,
  required Function() order,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 20),
      child: Container(
        height: 95.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 10,
                offset: Offset(0, 8),
                spreadRadius: 2,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 87.w,
                height: 70.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'white t-shirt',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.80,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      't-shirt',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 11.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 15, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp 70.000,00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 95.w,
                      height: 30.h,
                      child: ElevatedButton(
                        onPressed: order,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF212121),
                          ),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 12.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
