import 'package:flutter/material.dart';

Padding itemsListView({
  required String title,
  required Function() order,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 20),
      child: Container(
        width: 367,
        height: 119,
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
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 21,
                      child: Text(
                        'white t-shirt',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        't-shirt',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 13,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
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
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
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
                            fontSize: 13,
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
