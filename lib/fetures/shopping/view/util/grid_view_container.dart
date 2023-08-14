import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector gridViewContainer(
        {required String title,
        required String category,
        required String price,
        required String image,
        required Function() order,
        required Function() productView}) =>
    GestureDetector(
      onTap: productView,
      child: FittedBox(
        child: Container(
            width: 150.w,
            height: 210.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  )
                ]),
            child: Column(children: [
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 95.w,
                height: 95.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 50.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                            ),
                            Text(
                              category,
                              style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 11.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 11.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.60,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 130.w,
                        height: 20.h,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 20,
                            offset: Offset(0, 0),
                            spreadRadius: 1,
                          )
                        ]),
                        child: ElevatedButton(
                            onPressed: order,
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF212121),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  size: 20,
                                ),
                                Text(
                                  '  Add to cart',
                                  style: TextStyle(
                                    color: Color(0xFFFEFEFE),
                                    fontSize: 11.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.60,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
