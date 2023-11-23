// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_project/fetures/cart/view/util/cart_item_container.dart';
import 'package:store_project/fetures/cart/view/util/item_cart_listView.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 40,
          ),
          leading: IconButton(
              onPressed: () => context.go("/"), icon: Icon(Icons.arrow_back))),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              cartItemContainer(itmeCount: 4),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) =>
                    itemsListView(title: "title", order: () {}),
              ),
              SizedBox(
                height: //20,
                    MediaQuery.of(context).size.height / 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                    width: 280.w,
                    height: 38.h,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 2,
                      )
                    ]),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Checkout",
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 16.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.60,
                          )),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
