import 'package:get/get.dart';

import '../modules/addCategory/bindings/add_category_binding.dart';
import '../modules/addCategory/views/add_category_view.dart';
import '../modules/admin_categories/bindings/admin_categories_binding.dart';
import '../modules/admin_categories/views/admin_categories_view.dart';
import '../modules/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/admin_main/bindings/admin_main_binding.dart';
import '../modules/admin_main/views/admin_main_view.dart';
import '../modules/admin_orders/bindings/admin_orders_binding.dart';
import '../modules/admin_orders/views/admin_orders_view.dart';
import '../modules/admin_products/bindings/admin_products_binding.dart';
import '../modules/admin_products/views/admin_products_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/getCategory/bindings/get_category_binding.dart';
import '../modules/getCategory/views/get_category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/searchUI/bindings/search_u_i_binding.dart';
import '../modules/searchUI/views/search_u_i_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const LOGIN = Routes.LOGIN;
  static const HOME = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_U_I,
      page: () => const SearchUIView(),
      binding: SearchUIBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CATEGORY,
      page: () => const AddCategoryView(),
      binding: AddCategoryBinding(),
    ),
    GetPage(
      name: _Paths.GET_CATEGORY,
      page: () => const GetCategoryView(),
      binding: GetCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MAIN,
      page: () => const AdminMainView(),
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_CATEGORIES,
      page: () => const AdminCategoriesView(),
      binding: AdminCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ORDERS,
      page: () => const AdminOrdersView(),
      binding: AdminOrdersBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PRODUCTS,
      page: () => const AdminProductsView(),
      binding: AdminProductsBinding(),
    ),
  ];
}
