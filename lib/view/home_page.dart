// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_project/controller/store_notifire.dart';
import 'package:store_project/view/Utils/category_list_view_container.dart';
import 'package:store_project/view/Utils/grid_view_container.dart';
import 'package:store_project/view/Utils/show_name&options.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    final storeNotifier = ref.read(storeProvider.notifier);
    storeNotifier.getProducts();
    storeNotifier.getCategories();
    storeNotifier.getUsers(1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final storeNotifier = ref.read(storeProvider.notifier);
    final storeState = ref.watch(storeProvider);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                  //30,
                ),
                nameOptionBar(name: "Sohaib", cartFun: () {}, optionFun: () {}),
                SizedBox(
                  height: //40,
                      MediaQuery.of(context).size.height / 38,
                ),
                Form(
                    child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      width: 290.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        border:
                            Border.all(width: 0.50, color: Color(0xFFAFAFAF)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: TextField(), //! Hide button arrow
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.search,
                        color: Colors.black26,
                        weight: 20.w,
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: //35,
                      MediaQuery.of(context).size.height / 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: SizedBox(
                    width: 450.w,
                    child: Text(
                      "Category",
                      style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: //20
                        MediaQuery.of(context).size.height / 58),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(
                    height: 50,
                  ),
                  child: ListView.builder(
                    itemCount: storeState.categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) => categoryListView(
                        categoryName: storeState.categories[index].toString(),
                        tapFun: () {},
                        cancelFun: () {}),
                  ),
                ),
                SizedBox(
                    height: //20
                        MediaQuery.of(context).size.height / 55),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.65,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return gridViewContainer(
                              image:
                                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                              title: "title",
                              category: "category",
                              price: "100",
                              order: () {},
                              productView: () =>
                                  Navigator.pushNamed(context, "/Cart"),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
