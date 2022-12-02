import 'package:flutter_ecommerce/users/model/history.dart';

class API {
  static const hostConnect = "http://10.10.61.177/foodies_api";
  static const hostConnectUser = "$hostConnect/user/";

  // signUp user
  static const signUp = "$hostConnect/user/signup.php";
  // Validate Email
  static const validateEmail = "$hostConnect/user/validate_email.php";

  static const signUpNew = "http://10.10.61.177/foodies_api/user/signup.php";
  static const checkEmail =
      "http://10.10.61.177/foodies_api/user/validate_email.php";
  static const login = "http://10.10.61.177/foodies_api/user/login.php";

  // Login Admin
  static const adminlogin = "http://10.10.61.177/foodies_api/admin/login.php";

  // Food Popular
  static const getTrendingMostPopularClothes =
      "http://10.10.61.177/foodies_api/food/trending.php";
  // All Food
  static const getAllFood = "http://10.10.61.177/foodies_api/food/all.php";
  // Cart
  static const addToCart = "http://10.10.61.177/foodies_api/cart/add.php";
  static const addToCartTemp =
      "http://10.10.61.177/foodies_api/cart/cart_temp.php";

  static const getCartList = "http://10.10.61.177/foodies_api/cart/read.php";

  static const deleteSelectedItemsFromCartList =
      "http://10.10.61.177/foodies_api/cart/delete.php";

  static const deleteSelectedItemsFromCartListTemp =
      "http://10.10.61.177/foodies_api/cart/deleteCartTemp.php";

// Restaurant
  static const getAllRestaurant =
      "http://10.10.61.177/foodies_api/restaurant/getAll.php";

  static const getRestauranFood =
      "http://10.10.61.177/foodies_api/restaurant/readFood.php";

  static const getRestaurantAll =
      "http://10.10.61.177/foodies_api/restaurant/getAllRestaurant.php";

  static const imagesRes =
      "http://10.10.61.177/foodies_api/restaurant/imagesRes.php";

  // Summary
  static const addSummary = "http://10.10.61.177/foodies_api/cart/summary.php";
  static const getSummary =
      "http://10.10.61.177/foodies_api/cart/getSummary.php";

  // Transaksi
  static const addTransaksi =
      "http://10.10.61.177/foodies_api/transaksi/transaksi.php";
  static const getTransaksi =
      "http://10.10.61.177/foodies_api/transaksi/getTransaksi.php";

  // Update Saldo
  static const updateSaldo =
      "http://10.10.61.177/foodies_api/user/updateSaldo.php";

// Filter Kategori
  static const kategoriFilter =
      "http://10.10.61.177/foodies_api/restaurant/categoryFilter.php";

// search
  static const searchItems =
      "http://10.10.61.177/foodies_api/restaurant/search.php";

  // Saldo
  static const saldo = "http://10.10.61.177/foodies_api/user/saldo.php";

  // add refund
  static const transaksiKembali =
      "http://10.10.61.177/foodies_api/transaksi/addTransaksiKembali.php";

  // Hapus transaksi
  static const deleteTrans =
      "http://10.10.61.177/foodies_api/transaksi/deleteTransaksi.php";

  // Show History
  static const historyTransaksi =
      "http://10.10.61.177/foodies_api/transaksi/historyTransaksi.php";
}
