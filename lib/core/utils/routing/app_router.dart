import 'package:book_store_mvvm/core/utils/routing/routs.dart';
import 'package:book_store_mvvm/core/utils/service_locator.dart';
import 'package:book_store_mvvm/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:book_store_mvvm/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:book_store_mvvm/features/books/presentation/view_model/all_products_cubit/all_books_products_cubit.dart';
import 'package:book_store_mvvm/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:book_store_mvvm/features/cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import 'package:book_store_mvvm/features/cart/presentation/view_model/update_cart_cubit/update_cart_cubit.dart';
import 'package:book_store_mvvm/features/favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import 'package:book_store_mvvm/features/profile/presentation/view_model/get_profile_cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/view/reset_password_view.dart';
import '../../../features/auth/presentation/view/login_view.dart';
import '../../../features/auth/presentation/view/register_view.dart';
import '../../../features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../../features/books/data/model/all_products_books.dart';
import '../../../features/books/presentation/view/widgets/show_book_details_view/show_book_details_view.dart';
import '../../../features/cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../../features/contact_us/presentation/view/contact_us_view.dart';
import '../../../features/contact_us/presentation/view_model/contact_us_cubit/contact_us_cubit.dart';
import '../../../features/faq/presentation/view/faq_view.dart';
import '../../../features/faq/presentation/view_model/faq_cubit/faq_cubit.dart';
import '../../../features/favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../../features/home/domain/entities/product_entity.dart';
import '../../../features/home/presentation/view/screens/category_products_screen.dart';
import '../../../features/home/presentation/view/screens/product_details_screen.dart';
import '../../../features/order/presentation/view/checkout_view.dart';
import '../../../features/order/presentation/view/order_details_view.dart';
import '../../../features/order/presentation/view/order_history_view.dart';
import '../../../features/order/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import '../../../features/order/presentation/view_model/order_history_cubit/order_history_cubit.dart';
import '../../../features/order/presentation/view_model/place_order_cubit/place_order_cubit.dart';
import '../../../features/order/presentation/view_model/show_single_order_cubit/show_single_order_cubit.dart';
import '../../../features/profile/presentation/view/widgets/change_password/change_password_view.dart';
import '../../../features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import '../../../features/profile/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import '../../../features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import '../../../features/splash/presentation/view/splash_view.dart';

import '../../../features/home/presentation/view_model/home_cubit/home_cubit.dart';

class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      GoRoute(
        path: Routs.loginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: const LoginView(),
        ),
      ),

      GoRoute(
        path: Routs.registerRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<RegisterCubit>(),
          child: const RegisterView(),
        ),
      ),

      // ==================== BOTTOM NAV BAR ====================
      GoRoute(
        path: Routs.bottomNavBarRoute,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              // HOME CUBIT - Single unified cubit
              BlocProvider(
                create: (context) => sl<HomeCubit>()..loadHomeData(),
              ),

              // Books Feature
              BlocProvider(
                create: (context) => sl<AllBooksProductsCubit>()..getAllProducts(),
              ),

              // Favourite Feature
              BlocProvider(
                create: (context) => sl<GetFavouriteCubit>()..getFavourite(),
              ),
              BlocProvider(create: (context) => sl<AddOrRemoveFavCubit>()),

              // Cart Feature
              BlocProvider(
                create: (context) => sl<FetchCartCubit>()..fetchCart(),
              ),
              BlocProvider(create: (context) => sl<AddOrRemoveToCartCubit>()),
              BlocProvider(create: (context) => sl<UpdateCartCubit>()),

              // Profile Feature
              BlocProvider(
                create: (context) => sl<GetProfileCubit>()..getProfile(),
              ),
              BlocProvider(create: (context) => sl<UpdateProfileCubit>()),
              BlocProvider(create: (context) => sl<ChangePasswordCubit>()),
              BlocProvider(create: (context) => sl<DeleteAccountCubit>()),
            ],
            child: const BottomNavBarView(),
          );
        },
      ),

      // ==================== CATEGORY PRODUCTS - FIXED ====================
      GoRoute(
        path: '/category/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id']!) ?? 0;

          String? categoryName;
          if (state.extra != null && state.extra is Map<String, dynamic>) {
            final extra = state.extra as Map<String, dynamic>;
            categoryName = extra['categoryName'] as String?;
          }

          return CategoryProductsScreen(
            categoryId: id,
            categoryName: categoryName,
          );
        },
      ),

// ✅ Product Details Route (Already correct)
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final product = state.extra as ProductEntity;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<AddOrRemoveFavCubit>()),
              BlocProvider(create: (context) => sl<GetFavouriteCubit>()),
              BlocProvider(create: (context) => sl<FetchCartCubit>()..fetchCart()),
              BlocProvider(create: (context) => sl<AddOrRemoveToCartCubit>()),
            ],
            child: ProductDetailsScreen(product: product),
          );
        },
      ),

      // Option 2: Keep OLD Product Details (if you still need it)
      GoRoute(
        path: Routs.showBookDetailsRoute,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<AddOrRemoveFavCubit>()),
              BlocProvider(create: (context) => sl<GetFavouriteCubit>()),
              BlocProvider(create: (context) => sl<FetchCartCubit>()..fetchCart()),
              BlocProvider(create: (context) => sl<AddOrRemoveToCartCubit>()),
            ],
            child: ShowProductDetailsView(products: product),
          );
        },
      ),
      // ==================== CHECKOUT ====================
      GoRoute(
        path: Routs.checkoutRoute,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<CheckoutCubit>()..getCheckout()),
              BlocProvider(create: (context) => sl<PlaceOrderCubit>()),
            ],
            child: const CheckoutView(),
          );
        },
      ),

      // ==================== ORDER HISTORY ====================
      GoRoute(
        path: Routs.orderHistoryRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<OrderHistoryCubit>()..getOrderHistory(),
            child: const OrderHistoryView(),
          );
        },
      ),

      // ==================== ORDER DETAILS ====================
      GoRoute(
        path: Routs.orderDetailsRoute,
        builder: (context, state) {
          final orderId = state.extra as int;
          return BlocProvider(
            create: (context) => sl<ShowSingleOrderCubit>()..getOrderById(orderId),
            child: OrderDetailsView(orderId: orderId),
          );
        },
      ),

      // ==================== CHANGE PASSWORD ====================
      GoRoute(
        path: Routs.changePasswordRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<ChangePasswordCubit>(),
            child: const ChangePasswordView(),
          );
        },
      ),

      // ==================== CONTACT US ====================
      GoRoute(
        path: Routs.contactUsRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<ContactUsCubit>(),
            child: const ContactUsView(),
          );
        },
      ),

      // ==================== FAQ ====================
      GoRoute(
        path: Routs.faqRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<FaqCubit>()..getAllFaqs(),
            child: const FaqView(),
          );
        },
      ),

      // ==================== FORGOT PASSWORD ====================
      GoRoute(
        path: Routs.forgotPasswordRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<ResetPasswordCubit>(),
            child: const ResetPasswordView(),
          );
        },
      ),
    ],
  );
}