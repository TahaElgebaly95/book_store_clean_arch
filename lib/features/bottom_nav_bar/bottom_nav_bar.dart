import 'package:book_store_mvvm/features/books/presentation/view/books_view.dart';
import 'package:book_store_mvvm/features/cart/presentation/view/cart_view.dart';
import 'package:book_store_mvvm/features/favourite/presentation/view/favourite_view.dart';
import 'package:book_store_mvvm/features/home/presentation/view/home_view.dart';
import 'package:book_store_mvvm/features/profile/presentation/view/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int currentScreen = 0;

  final List<Widget> screens = [
    const HomeView(),
    const BooksView(),
    const FavouriteView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: AppColors.kBlack,
        style: TabStyle.react,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        initialActiveIndex: currentScreen,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.book, title: 'Books'),
          TabItem(icon: Icons.favorite, title: 'Favourite'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
      ),
      body: screens[currentScreen],
    );
  }
}