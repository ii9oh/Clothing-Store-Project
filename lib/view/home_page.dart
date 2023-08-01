// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_project/controller/store_notifire.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    final storeNotifier = ref.read(storeProvider.notifier);
    storeNotifier.getCategories();
    storeNotifier.getUsers(1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final storeNotifier = ref.read(storeProvider.notifier);
    final storeState = ref.watch(storeProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
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
                    storeState.usersModel.username.toString(),
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
                            onTap: () {},
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
                      onTap: () {},
                    ),
                    //! Than add Red Dot Here
                  )
                ],
              ),
              SizedBox(
                height: 66,
              ),
              Form(
                  child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    width: 360,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 0.50, color: Color(0xFFAFAFAF)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextField(), //! Hide button arrow
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black26,
                    weight: 20,
                  ),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    SizedBox(
                      width: 450,
                      child: Text(
                        "Category",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: storeState.categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          child: Container(
                            width: 130,
                            height: 39,
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
                                  storeState.categories[index].toString(),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
