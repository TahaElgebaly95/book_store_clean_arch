// ============ HOME FEATURE - CLEAN ARCHITECTURE ============
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_sources/check_forgot_password_code_remote_data_source.dart';
import '../../features/auth/data/data_sources/login_remote_data_source.dart';
import '../../features/auth/data/data_sources/logout_remote_data_source.dart';
import '../../features/auth/data/data_sources/register_remote_data_source.dart';
import '../../features/auth/data/data_sources/resend_verify_link_remote_data_source.dart';
import '../../features/auth/data/data_sources/reset_password_remote_data_source.dart';
import '../../features/auth/data/data_sources/send_forgot_password_link_remote_data_source.dart';
import '../../features/auth/data/data_sources/verify_email_remote_data_source.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/use_cases/check_forgot_password_code_use_case.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/logout_use_case.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/auth/domain/use_cases/resend_verify_link_use_case.dart';
import '../../features/auth/domain/use_cases/reset_password_use_case.dart';
import '../../features/auth/domain/use_cases/send_forgot_password_link_use_case.dart';
import '../../features/auth/domain/use_cases/verify_email_use_case.dart';
import '../../features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import '../../features/books/data/data_sources/all_products_remote_data_source.dart';
import '../../features/books/data/data_sources/search_product_data_source.dart';
import '../../features/books/data/data_sources/show_product_details_remote_data_source.dart';
import '../../features/books/data/repo/all_products_repo.dart';
import '../../features/books/data/repo/all_products_repo_impl.dart';
import '../../features/books/domain/use_cases/get_all_products_use_case.dart';
import '../../features/books/presentation/view_model/all_products_cubit/all_books_products_cubit.dart';
import '../../features/cart/data/data_sources/add_to_cart_remote_data_source.dart';
import '../../features/cart/data/data_sources/fetch_cart_remote_data_source.dart';
import '../../features/cart/data/data_sources/remove_from_cart_remote_data_source.dart';
import '../../features/cart/data/data_sources/update_cart_remote_data_source.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/domain/use_cases/add_to_cart_use_case.dart';
import '../../features/cart/domain/use_cases/fetch_cart_use_case.dart';
import '../../features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import '../../features/cart/domain/use_cases/update_cart_use_case.dart';
import '../../features/cart/presentation/view_model/add_or_remove_to_cart_cubit/add_or_remove_to_cart_cubit.dart';
import '../../features/cart/presentation/view_model/fetch_cart_cubit/fetch_cart_cubit.dart';
import '../../features/cart/presentation/view_model/update_cart_cubit/update_cart_cubit.dart';
import '../../features/contact_us/data/data_source/contact_us_data_source.dart';
import '../../features/contact_us/data/repo/contact_us_repo.dart';
import '../../features/contact_us/data/repo/contact_us_repo_impl.dart';
import '../../features/contact_us/domain/use_case/contact_us_use_case.dart';
import '../../features/contact_us/presentation/view_model/contact_us_cubit/contact_us_cubit.dart';
import '../../features/faq/data/data_source/faq_remote_data_source.dart';
import '../../features/faq/data/repo/faq_repo.dart';
import '../../features/faq/data/repo/faq_repo_impl.dart';
import '../../features/faq/domain/use_case/get_all_faqs_use_case.dart';
import '../../features/faq/presentation/view_model/faq_cubit/faq_cubit.dart';
import '../../features/favourite/data/data_sources/add_fav_remote_data_source.dart';
import '../../features/favourite/data/data_sources/get_fav_remote_data_source.dart';
import '../../features/favourite/data/data_sources/remove_fav_remote_data_source.dart';
import '../../features/favourite/data/repo/fav_repo.dart';
import '../../features/favourite/data/repo/fav_repo_impl.dart';
import '../../features/favourite/domain/use_cases/add_fav_use_case.dart';
import '../../features/favourite/domain/use_cases/remove_fav_use_case.dart';
import '../../features/favourite/presentation/view_model/add_and_remove_fav_cubit/add_and_remove_fav_cubit.dart';
import '../../features/favourite/presentation/view_model/get_fav_cubit/get_favourite_cubit.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/use_cases/get_best_seller_use_case.dart';
import '../../features/home/domain/use_cases/get_categories_use_csae.dart';
import '../../features/home/domain/use_cases/get_category_product_use_case.dart';
import '../../features/home/domain/use_cases/get_new_arrival_use_case.dart';
import '../../features/home/domain/use_cases/get_slider_use_case.dart';
import '../../features/home/presentation/view_model/home_cubit/home_cubit.dart';
import '../../features/order/data/data_sources/checkout_remote_data_source.dart';
import '../../features/order/data/data_sources/order_history_remote_data_source.dart';
import '../../features/order/data/data_sources/place_order_remote_data_source.dart';
import '../../features/order/data/data_sources/show_single_order_remote_data_source.dart';
import '../../features/order/data/repo/order_repo.dart';
import '../../features/order/data/repo/order_repo_impl.dart';
import '../../features/order/domain/use_cases/checkout_use_case.dart';
import '../../features/order/domain/use_cases/get_order_history_use_case.dart';
import '../../features/order/domain/use_cases/place_order_use_case.dart';
import '../../features/order/domain/use_cases/show_single_order_use_case.dart';
import '../../features/order/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import '../../features/order/presentation/view_model/order_history_cubit/order_history_cubit.dart';
import '../../features/order/presentation/view_model/place_order_cubit/place_order_cubit.dart';
import '../../features/order/presentation/view_model/show_single_order_cubit/show_single_order_cubit.dart';
import '../../features/profile/data/datasources/change_password_remote_data_source.dart';
import '../../features/profile/data/datasources/delete_profile_remote_data_source.dart';
import '../../features/profile/data/datasources/show_profile_remote_data_source.dart';
import '../../features/profile/data/datasources/update_profile_remote_data_source.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/domain/use_cases/change_password_use_case.dart';
import '../../features/profile/domain/use_cases/delete_account_use_case.dart';
import '../../features/profile/domain/use_cases/get_user_profile.dart';
import '../../features/profile/domain/use_cases/update_profile_use_case.dart';
import '../../features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import '../../features/profile/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import '../../features/profile/presentation/view_model/get_profile_cubit/profile_cubit.dart';
import '../../features/profile/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import '../data/network/helper/api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // #################### External ####################
  sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  // #################### Features ####################

  // -------------------- Auth Feature --------------------
  // Data Sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ResetPasswordRemoteDataSource>(
        () => ForgotPasswordRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<LogoutRemoteDataSource>(
        () => LogoutRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CheckForgotPasswordCodeRemoteDataSource>(
        () => CheckForgotPasswordCodeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SendForgotPasswordLinkRemoteDataSource>(
        () => SendForgotPasswordLinkRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ResendVerifyLinkRemoteDataSource>(
        () => ResendVerifyLinkRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<VerifyEmailRemoteDataSource>(
        () => VerifyEmailRemoteDataSourceImpl(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => SendForgotPasswordLinkUseCase(sl()));
  sl.registerLazySingleton(() => CheckForgotPasswordCodeUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResendVerifyLinkUseCase(sl()));
  sl.registerLazySingleton(() => VerifyEmailUseCase(sl()));

  // Cubits
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerFactory<ResetPasswordCubit>(
        () => ResetPasswordCubit(
      sendLinkUseCase: sl(),
      checkCodeUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );

  // ==================== HOME FEATURE - CLEAN ARCHITECTURE ====================
  // Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl<ApiService>()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetCategoryProductsUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetBestSellersUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetNewArrivalsUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton(() => GetSlidersUseCase(sl<HomeRepository>()));

  // Cubit - Single Unified Cubit
  sl.registerFactory(() => HomeCubit(
    getCategoriesUseCase: sl(),
    getCategoryProductsUseCase: sl(),
    getBestSellersUseCase: sl(),
    getNewArrivalsUseCase: sl(),
    getSlidersUseCase: sl(),
  ));

  // -------------------- Books Feature --------------------
  // Cubit
  sl.registerFactory<AllBooksProductsCubit>(() => AllBooksProductsCubit(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AllProductsRepo>(
        () => AllProductsRepoImpl(sl(), sl(), sl()),
  );

  // Data Sources
  sl.registerLazySingleton<AllProductsRemoteDataSource>(
        () => AllProductsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SearchProductDataSource>(
        () => SearchProductDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ShowProductDetailsRemoteDataSource>(
        () => ShowProductDetailsRemoteDataSourceImpl(sl()),
  );

  // -------------------- Favourite Feature --------------------
  // Use Cases
  sl.registerLazySingleton(() => AddFavouriteUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFavUseCase(sl()));

  // Cubits
  sl.registerFactory<GetFavouriteCubit>(() => GetFavouriteCubit(sl()));
  sl.registerFactory<AddOrRemoveFavCubit>(
        () => AddOrRemoveFavCubit(sl(), sl()),
  );

  // Repository
  sl.registerLazySingleton<FavouriteRepo>(
        () => FavouriteRepoImpl(sl(), sl(), sl()),
  );

  // Data Sources
  sl.registerLazySingleton<GetFavouriteRemoteDataSource>(
        () => FavouriteRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AddFavouriteRemoteDataSource>(
        () => AddFavouriteRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<RemoveFavRemoteDataSource>(
        () => RemoveFavRemoteDataSourceImpl(sl()),
  );

  // -------------------- Cart Feature --------------------
  // Data Sources
  sl.registerLazySingleton<FetchCartRemoteDataSource>(
        () => FetchCartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AddToCartRemoteDataSource>(
        () => AddToCartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<RemoveFromCartRemoteDataSource>(
        () => RemoveFromCartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<UpdateCartRemoteDataSource>(
        () => UpdateCartRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(sl(), sl(), sl(), sl()),
  );

  // Use Cases
  sl.registerLazySingleton<FetchCartUseCase>(() => FetchCartUseCase(sl()));
  sl.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton<RemoveFromCartUseCase>(
        () => RemoveFromCartUseCase(sl()),
  );
  sl.registerLazySingleton<UpdateCartUseCase>(() => UpdateCartUseCase(sl()));

  // Cubits
  sl.registerFactory<FetchCartCubit>(() => FetchCartCubit(sl()));
  sl.registerFactory<AddOrRemoveToCartCubit>(
        () => AddOrRemoveToCartCubit(sl(), sl()),
  );
  sl.registerFactory<UpdateCartCubit>(() => UpdateCartCubit(sl()));

  // -------------------- Profile Feature --------------------
  // Data Source
  sl.registerLazySingleton<GetProfileRemoteDataSource>(
        () => GetProfileRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<UpdateProfileRemoteDataSource>(
        () => UpdateProfileRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChangePasswordRemoteDataSource>(
        () => ChangePasswordRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<DeleteAccountRemoteDataSource>(
        () => DeleteAccountRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(sl(), sl(), sl(), sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAccountUseCase(sl()));

  // Cubit
  sl.registerFactory(() => GetProfileCubit(sl()));
  sl.registerFactory(() => UpdateProfileCubit(sl()));
  sl.registerFactory(() => ChangePasswordCubit(sl()));
  sl.registerFactory(() => DeleteAccountCubit(sl()));

  // -------------------- Order Feature --------------------
  // Data Sources
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
        () => CheckoutRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PlaceOrderRemoteDataSource>(
        () => PlaceOrderRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<OrderHistoryRemoteDataSource>(
        () => OrderHistoryRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ShowSingleOrderRemoteDataSource>(
        () => ShowSingleOrderRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<OrderRepo>(
        () => OrderRepoImpl(
      checkoutRemoteDataSource: sl(),
      placeOrderRemoteDataSource: sl(),
      orderHistoryRemoteDataSource: sl(),
      showSingleOrderRemoteDataSource: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => CheckoutUseCase(sl()));
  sl.registerLazySingleton(() => PlaceOrderUseCase(sl()));
  sl.registerLazySingleton(() => GetOrderHistoryUseCase(sl()));
  sl.registerLazySingleton(() => ShowSingleOrderUseCase(sl()));

  // Cubits
  sl.registerFactory(() => CheckoutCubit(sl()));
  sl.registerFactory(() => PlaceOrderCubit(sl()));
  sl.registerFactory(() => OrderHistoryCubit(sl()));
  sl.registerFactory(() => ShowSingleOrderCubit(sl()));

  // -------------------- Contact Us Feature --------------------
  // Data Source
  sl.registerLazySingleton<ContactUsRemoteDataSource>(
        () => ContactUsRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ContactUsRepo>(
        () => ContactUsRepoImpl(contactUsRemoteDataSource: sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));

  // Cubit
  sl.registerFactory(() => ContactUsCubit(sl()));

  // -------------------- FAQ Feature --------------------
  // Data Source
  sl.registerLazySingleton<FaqRemoteDataSource>(
        () => FaqRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<FaqRepo>(
        () => FaqRepoImpl(faqRemoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetAllFaqsUseCase(sl()));

  // Cubits
  sl.registerFactory(() => FaqCubit(sl()));
}