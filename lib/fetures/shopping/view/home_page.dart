// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_project/fetures/shopping/domain/controller/controller.dart';
import 'package:store_project/fetures/shopping/domain/state/state.dart';
import 'package:store_project/fetures/shopping/view/util/category_list_view_container.dart';
import 'package:store_project/fetures/shopping/view/util/grid_view_container.dart';
import 'package:store_project/fetures/shopping/view/util/lodding_page.dart';
import 'package:store_project/fetures/shopping/view/util/show_name&options.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    final controller = ref.read(storeProvider.notifier);
    controller.getAPI(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(storeProvider.notifier);
    final state = ref.watch(storeProvider);

    return state.status == Status.loading
        ? loadingPage()
        : Scaffold(
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
                      nameOptionBar(
                          name: state.users.length != 0
                              ? state.users[0].name!.firstname.toString()
                              : '',
                          cartFun: () => context.go("/Cart"),
                          optionFun: () {}),
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
                              border: Border.all(
                                  width: 0.50, color: Color(0xFFAFAFAF)),
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
                          itemCount: state.categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) => categoryListView(
                              categoryName: state.categories[index].toString(),
                              tapFun: () {
                                controller.selectCat(index);
                              },
                              color:
                                  state.selectedCat == state.categories[index]
                                      ? Colors.black12
                                      : Colors.white),
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
                                itemCount: state.status == Status.loading
                                    ? 6
                                    : state.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 0.65,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                ),
                                itemBuilder: (context, index) {
                                  return state.status == Status.loading
                                      ? Shimmer.fromColors(
                                          child: gridViewContainer(
                                              title: "",
                                              category: "",
                                              price: "",
                                              image: "",
                                              order: () {},
                                              productView: () {}),
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.white)
                                      : controller.isShow(index)
                                          ? gridViewContainer(
                                              image: state.products[index].image
                                                  .toString(),
                                              title: state.products[index].title
                                                  .toString(),
                                              category: state
                                                  .products[index].category
                                                  .toString(),
                                              price: state.products[index].price
                                                  .toString(),
                                              order: () {},
                                              productView: () =>
                                                  Navigator.pushNamed(
                                                      context, "/Cart"),
                                            )
                                          : SizedBox();
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
