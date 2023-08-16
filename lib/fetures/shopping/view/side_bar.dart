import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_project/fetures/shopping/domain/controller/controller.dart';
import 'package:store_project/fetures/shopping/view/util/list_tile_sidebar.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            accountName: Text(
              state.users[0].name!.firstname.toString(),
              style: GoogleFonts.roboto(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              state.users[0].email.toString(),
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          listTileContainer(
              onTap: () {}, icon: Icons.account_box, title: "Account"),
          listTileContainer(
              onTap: () {}, icon: Icons.shopping_cart, title: "Cart"),
          listTileContainer(
              onTap: () {}, icon: Icons.delivery_dining, title: "Orders"),
          listTileContainer(
              onTap: () {}, icon: Icons.settings, title: "Settings"),
          listTileContainer(onTap: () {}, icon: Icons.logout, title: "Logout"),
          SizedBox(
            height: 280.h,
          ),
          const Center(child: Text("This App made by Sohaib Almoudi"))
        ],
      ),
    );
  }
}
