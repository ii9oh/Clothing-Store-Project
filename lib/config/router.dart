import 'package:go_router/go_router.dart';
import 'package:store_project/fetures/cart/view/cart_page.dart';
import 'package:store_project/fetures/shopping/view/home_page.dart';
import 'package:store_project/fetures/shopping/view/side_bar.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: "Home",
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: "Cart",
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: "SideBar",
            builder: (context, state) => const SideBar(),
          ),
        ]),
  ],
);
