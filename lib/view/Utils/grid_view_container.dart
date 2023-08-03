import 'package:flutter/material.dart';

GestureDetector gridViewContainer(
        {required String title,
        required String category,
        required double price,
        required String image,
        required Function() order,
        required Function() productView}) =>
    GestureDetector(
      onTap: productView,
      child: Container(
          width: 175,
          height: 275,
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
              height: 10,
            ),
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        price.toString(),
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 150,
                        height: 25,
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
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.60,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
