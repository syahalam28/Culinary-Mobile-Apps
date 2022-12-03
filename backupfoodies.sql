-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2022 pada 17.01
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backupfoodies`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_table`
--

CREATE TABLE `cart_table` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(400) NOT NULL,
  `size` varchar(400) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart_table`
--

INSERT INTO `cart_table` (`cart_id`, `user_id`, `item_id`, `quantity`, `color`, `size`, `id_kategori`, `date`) VALUES
(18, 1, 2, 2, '[Hot', 'M]', 1, '2022-12-02'),
(19, 5, 2, 1, '[Hot', 'M]', 1, '2022-12-03'),
(20, 5, 3, 2, '[Original]', 'M]', 1, '2022-12-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_table_temp`
--

CREATE TABLE `cart_table_temp` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(400) NOT NULL,
  `size` varchar(400) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `items_table`
--

CREATE TABLE `items_table` (
  `item_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `rating` double NOT NULL,
  `tags` varchar(400) NOT NULL,
  `price` double NOT NULL,
  `sizes` varchar(400) NOT NULL,
  `colors` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `id_restrauran` int(11) NOT NULL,
  `kategori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `items_table`
--

INSERT INTO `items_table` (`item_id`, `name`, `rating`, `tags`, `price`, `sizes`, `colors`, `description`, `image`, `id_restrauran`, `kategori`) VALUES
(1, 'Tonkotsu Ramen ', 3.5, '[noodle, soup]', 25000, '[S, M, L]', '[spicy, original]', 'Tonkotsu is a unique style of ramen consisting of an extremely rich, fatty pork broth, fresh noodles, soft-yolk eggs, and tender pork belly that melts', 'https://img.freepik.com/free-photo/japanese-seafood-ramen-with-cuttlefish-sauce_1205-9380.jpg?size=626&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 1, 'makanan'),
(2, 'Ocha Tea', 4.8, '[GreenTea]', 15000, '[S, M]', '[Hot, Original]', 'It is traditionally made using bancha tea leaves and unpolished brown rice grains.', 'https://img.freepik.com/free-photo/top-view-green-matcha-beverage_23-2148296707.jpg?size=626&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 1, 'minuman'),
(3, 'Shabu – Shabu', 4.2, '[Hotpot]', 23000, '[S, M]', '[Original]', 'Shabu Shabu is a popular Japanese-style hot pot where the meat and assorted vegetables are cooked in a flavorful broth called kombu dashi', 'https://img.freepik.com/free-photo/raw-meat-fresh-vegetable-hot-pot-shabu-menu_1150-35277.jpg?size=626&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 1, 'makanan'),
(4, 'Kare', 4.2, '[Soup]', 45000, '[S, M]', '[Original]', 'Indian Food ', 'https://img.freepik.com/premium-photo/curry-rice-with-fried-pork-cutlet-creamy-omelet_1339-172388.jpg?size=626&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 2, 'makanan'),
(5, 'Smoothies ', 5, '[Milk]', 20000, '[S, M, L]', '[Hot, Cold]', 'Smoothies are thick, creamy beverages usually blended from puréed fruits, vegetables, juices, yogurt, nuts, seeds, and/or dairy or nondairy milk.', 'https://img.freepik.com/free-photo/glass-papaya-juice-put-white-marble-floor_1150-28077.jpg?size=626&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 2, 'minuman'),
(6, 'Edamame', 5, '[snack]', 29000, '[M]', '[original,spicy]', 'Edamame', 'https://assets-pergikuliner.com/3PL6zhYBaZFSikIdnyqGPcaykDI=/fit-in/1366x768/smart/filters:no_upscale()/https://assets-pergikuliner.com/uploads/bootsy/image/19955/Kacang_Edamame_Momo__pergikuliner.com_.jpg', 1, 'snack'),
(7, 'pudding', 4.8, '[sweet, soft]', 35000, '[M]', '[caramel]', 'Pudding with caramel sauce', 'https://img.freepik.com/free-photo/caramel-custard-pudding_1203-3685.jpg?w=1060&t=st=1670003000~exp=1670003600~hmac=f6cc20fb97ad1850e2a12b08b4223af6c2bedfd5bc358d3e333b2e35f4cd7f89', 1, 'dessert'),
(8, 'Takoyaki', 4.5, '[takoyaki]', 58000, '[M]', '[spicy,original]', 'Takoyaki with sauce', 'https://img.freepik.com/free-photo/japanese-food-takoyaki-octopus-balls-wooden-background_181624-43900.jpg?w=1060&t=st=1670003122~exp=1670003722~hmac=342edc4a8333d7d87c69f9a3c7a778da4b9f97facdff8d4f87930c8237ad26ac', 1, 'snack'),
(9, 'Ice Tea', 4.8, '[Drink]', 29000, '[M]', '[With Sugar, Less Sugar]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 1, 'minuman'),
(10, 'Briyani Rice With Lamb', 4.9, '[Lamb]', 129000, '[M]', '[spicy,original]', 'Briyani Rice With Lamb', 'https://img.freepik.com/free-photo/mutton-lamb-biriyani-with-basmati-rice-served-bowl-moody-background_466689-72651.jpg?w=1060&t=st=1670003363~exp=1670003963~hmac=640a2e5a5d419437740b22c860dfec25d063fd5958b13c9c73817562160ec6ba', 2, 'makanan'),
(11, 'Ice Tea', 4.8, '[Tea]', 34000, '[M]', '[Sugar,Less Sugar]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 2, 'minuman'),
(12, 'Rabli Jalebi', 4.6, '[Milk]', 69000, '[M]', '[original]', 'Rabri jalebi or imarati with rabdi made from condensing milk, famous dessert sweet from india', 'https://img.freepik.com/free-photo/rabri-jalebi-imarati-with-rabdi-made-from-condensing-milk-famous-dessert-sweet-from-india_466689-71665.jpg?w=1060&t=st=1670003564~exp=1670004164~hmac=2e6442a17676b2a55178cdccb0d8d9d22e478e78032647f719b321df71b8321e', 2, 'dessert'),
(13, 'Rabero', 4.8, '[sweet]', 89000, '[M]', '[original]', 'Traditional indian', 'https://img.freepik.com/free-photo/traditional-indian-dessert-view_23-2149312414.jpg?w=740&t=st=1670003683~exp=1670004283~hmac=fc925c60ba5a244a9aefae264e08f24427ebec715cd7bcf04698bbdf973b5ecb', 2, 'snack'),
(14, 'Penne Pasta', 4.9, '[Pasta]', 78000, '[M]', '[spicy]', 'Penne Pasta', 'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?w=1060&t=st=1670003910~exp=1670004510~hmac=98e20cb4f269a178218e2df93391e82f9593165e4248c82533fa62739416cf09', 3, 'makanan'),
(15, 'Pizza', 4.9, '[pizza]', 129000, '[M,L]', '[original]', 'Pizza', 'https://img.freepik.com/free-photo/mixed-ingredient-pizza-wooden-board_114579-9317.jpg?t=st=1670003903~exp=1670004503~hmac=ec69783a0041b0a5e2037226f06321a55fe6b7fb2e06a132ab7990485e53c910', 3, 'makanan'),
(16, 'Italian Soda', 5, '[soda]', 78000, '[M]', '[Ice]', 'Italian Soda', 'https://img.freepik.com/free-photo/colorful-italian-soda_1339-4760.jpg?w=1060&t=st=1670004037~exp=1670004637~hmac=8151143e506a91678cf768adae33c6e3fe660ce16e84f7765bfda57e49143412', 3, 'minuman'),
(17, 'Tiramisu', 4.8, '[Tiramisu]', 98000, '[m]', '[original]', 'Tiramisu with layer', 'https://img.freepik.com/free-photo/tasty-homemade-tiramisu-cake_114579-37153.jpg?w=1060&t=st=1670004116~exp=1670004716~hmac=e2074e69b57b321cabeb1606183772289c68ab0184dcbc6a6bfc9baf9dfaf3b7', 3, 'dessert'),
(18, 'Fries', 4.4, '[Fries]', 77000, '[m]', '[original]', 'Fries with sauce', 'https://img.freepik.com/free-photo/family-time-eat-french-fries-together_1150-7010.jpg?w=1060&t=st=1670004214~exp=1670004814~hmac=0d4227ff9df5300a6749dc94bc660b167efe351e4e4551fdfc84a6a0d2c76113', 3, 'snack'),
(19, 'Ice Tea', 5, '[Ice Tea]', 50000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 3, 'minuman'),
(20, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 4, 'minuman'),
(21, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 5, 'minuman'),
(22, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 6, 'minuman'),
(23, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 7, 'minuman'),
(24, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 8, 'minuman'),
(25, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 30, 'minuman'),
(26, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 25, 'minuman'),
(27, 'Ayam Bakar', 4.7, '[Ayam]', 69800, '[M]', '[spicy]', 'Ayam Bakar / roasted chicken with Sauce', 'https://img.freepik.com/free-photo/baked-chicken-wings-asian-style-tomatoes-sauce-plate_2829-10657.jpg?t=st=1670004758~exp=1670005358~hmac=b0bee362d7f31c2fb0d22c6a76972cd66f7b9567727955e2b4603a56e85895c4', 4, 'makanan'),
(28, 'Ayam Bakar', 4.7, '[Ayam]', 69800, '[M]', '[spicy]', 'Ayam Bakar / roasted chicken with Sauce', 'https://img.freepik.com/free-photo/baked-chicken-wings-asian-style-tomatoes-sauce-plate_2829-10657.jpg?t=st=1670004758~exp=1670005358~hmac=b0bee362d7f31c2fb0d22c6a76972cd66f7b9567727955e2b4603a56e85895c4', 14, 'makanan'),
(29, 'Ayam Bakar', 4.7, '[Ayam]', 69800, '[M]', '[spicy]', 'Ayam Bakar / roasted chicken with Sauce', 'https://img.freepik.com/free-photo/baked-chicken-wings-asian-style-tomatoes-sauce-plate_2829-10657.jpg?t=st=1670004758~exp=1670005358~hmac=b0bee362d7f31c2fb0d22c6a76972cd66f7b9567727955e2b4603a56e85895c4', 15, 'makanan'),
(30, 'Ayam Bakar', 4.7, '[Ayam]', 69800, '[M]', '[spicy]', 'Ayam Bakar / roasted chicken with Sauce', 'https://img.freepik.com/free-photo/baked-chicken-wings-asian-style-tomatoes-sauce-plate_2829-10657.jpg?t=st=1670004758~exp=1670005358~hmac=b0bee362d7f31c2fb0d22c6a76972cd66f7b9567727955e2b4603a56e85895c4', 18, 'makanan'),
(31, 'Sate Ayam', 5, '[Sate]', 79000, '[M]', '[original]', 'Sate Ayam with peanut sauce', 'https://img.freepik.com/free-photo/pork-satay-with-peanut-sauce-sweet-sour-sauce-thai-food_1150-45523.jpg?w=1060&t=st=1670005013~exp=1670005613~hmac=3a58c2b3cc43731f0ea27f56825476e2a8a880528ce0f00777aa1f89d8119d9b', 17, 'makanan'),
(32, 'Maranggi', 4.9, '[Maranggi]', 99000, '[M]', '[original]', 'Satay Maranggi', 'https://img.freepik.com/free-photo/skewers-with-different-types-meat_1122-1410.jpg?w=1060&t=st=1670005117~exp=1670005717~hmac=3ce3946abafb17839213f1aeb748c3179243dedcd90f4c000a9f7a9ea84bced6', 18, 'makanan'),
(33, 'Iced Lemon Tea', 5, '[Lemon]', 56000, '[M]', '[ice]', 'Lemon Tea With Ice', 'https://img.freepik.com/free-photo/iced-lemon-tea_1339-5819.jpg?w=1060&t=st=1670005200~exp=1670005800~hmac=8d9746e1ae768e9f95abba3d67bce9f196ed0c52685024638810bd0d1e8df84d', 4, 'minuman'),
(34, 'Croquettes in a bowl', 4.5, '[potato]', 98000, '[m]', '[original]', 'Potato', 'https://img.freepik.com/free-photo/delicious-food-croquettes-bowl_23-2149202673.jpg?w=1060&t=st=1670005293~exp=1670005893~hmac=9b3160e026856e258548a45e45daefdba335f5a1750e039613fb6608dcaa3b91', 4, 'snack'),
(35, 'Ice Cendol with Ice', 4.7, '[Cendol]', 68000, '[M]', '[Ice]', 'Cendol with ice', 'https://img.freepik.com/free-photo/bowls-malaysian-cendol-dessert_53876-25014.jpg?w=1060&t=st=1670005401~exp=1670006001~hmac=18e4eee83b87bcaea536691a371cb895984bdf0c1cc9661274048f7f84c906db', 4, 'dessert'),
(36, 'Chicken Hakka Noodles', 4.5, '[noodle]', 72000, '[M]', '[original,spicy]', 'Chicken hakka noodles', 'Chicken hakka noodles', 5, 'makanan'),
(37, 'Dumpling', 5, '[pork]', 88000, '[M]', '[original]', 'Pork Dumpling', 'https://img.freepik.com/free-photo/side-view-gyoza-with-soy-sauce-chopsticks-plate_141793-2688.jpg?w=740&t=st=1670082336~exp=1670082936~hmac=cd6da0c243c8efee27c9af6ba31a710f96178f20a221ebc8221dbecdf5f6afcf', 5, 'snack'),
(38, 'Moon Cake', 4.6, '[mooncake]', 55000, '[M]', '[original]', 'Fresh MoonCake', 'https://img.freepik.com/free-photo/fresh-moon-cake_1339-6664.jpg?w=996&t=st=1670082440~exp=1670083040~hmac=0adae0f2dfc3e1cbc8eda1f7ef9f264717d1bd7c7ba208139dc551f66b188ddd', 5, 'dessert'),
(39, 'Plum Pie', 4.8, '[plum]', 49000, '[S]', '[original]', 'Delicious plum pie', 'https://img.freepik.com/free-photo/delicious-plum-pie-with-chemex-coffee-ingredients-with-fabric-wooden-table-with-fabric_181624-27313.jpg?w=996&t=st=1670082606~exp=1670083206~hmac=ad5bd9d4af3e0c7350034ef57ce2786299b28ee10acb0583face3ab5d8ec58a5', 26, 'dessert'),
(40, 'Steak', 5, '[steak]', 125900, '[M]', '[sauce]', 'Grilled beef steak', 'https://img.freepik.com/free-photo/grilled-beef-steak-dark-wooden-surface_1150-44344.jpg?w=996&t=st=1670082703~exp=1670083303~hmac=89b02716e0ca8b7b7fdea5ad034c9e5f54eeee0dc19fbb8fd63d93f374df38fb', 26, 'makanan'),
(41, 'Shrimp Burger', 5, '[shrimp]', 80000, '[S]', '[original,spicy]', 'Mini Shrimp Burger', 'https://img.freepik.com/free-photo/western-food-seafood-shrimp-hamburger_1205-10207.jpg?w=996&t=st=1670082787~exp=1670083387~hmac=50a39d4d00185243073924ef580d8bb2c40b5624c75948b29b5252cec8594a59', 26, 'snack'),
(42, 'Orange Juice', 5, '[juice]', 70000, '[M]', '[Original]', 'Fresh Orange Juice', 'https://img.freepik.com/free-photo/fresh-orange-juice-glass-marble-background_1150-45566.jpg?w=996&t=st=1670082890~exp=1670083490~hmac=3d099857399388c0b416a56fe82ae3b518bde4e23aec5867278ec0367dce13e9', 26, 'minuman'),
(43, 'Steak', 5, '[steak]', 125900, '[M]', '[sauce]', 'Grilled beef steak', 'https://img.freepik.com/free-photo/grilled-beef-steak-dark-wooden-surface_1150-44344.jpg?w=996&t=st=1670082703~exp=1670083303~hmac=89b02716e0ca8b7b7fdea5ad034c9e5f54eeee0dc19fbb8fd63d93f374df38fb', 29, 'makanan'),
(44, 'Orange Juice', 5, '[juice]', 70000, '[M]', '[Original]', 'Fresh Orange Juice', 'https://img.freepik.com/free-photo/fresh-orange-juice-glass-marble-background_1150-45566.jpg?w=996&t=st=1670082890~exp=1670083490~hmac=3d099857399388c0b416a56fe82ae3b518bde4e23aec5867278ec0367dce13e9', 29, 'minuman'),
(45, 'Chicken Hakka Noodles', 4.5, '[noodle]', 72000, '[M]', '[original,spicy]', 'Chicken hakka noodles', 'Chicken hakka noodles', 7, 'makanan'),
(46, 'Ice Tea', 5, '[Tea]', 49000, '[M]', '[Ice]', 'Ice Tea', 'https://img.freepik.com/free-photo/refreshing-drink_144627-20864.jpg?w=740&t=st=1670003174~exp=1670003774~hmac=019b2b7d87392dcd50be69d2ee92d50d76e84391dcbf4c12c50c6f7ca0ac2a4c', 9, 'minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'japanese'),
(2, 'indian'),
(3, 'indonesian'),
(4, 'italian'),
(5, 'chinese'),
(6, 'western');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` int(11) NOT NULL,
  `nomor_rekening` varchar(11) NOT NULL,
  `nama_tabungan` text NOT NULL,
  `saldo` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id_rekening`, `nomor_rekening`, `nama_tabungan`, `saldo`, `user_id`) VALUES
(1, '04330100413', 'Xtra Savers', 100078500, 1),
(3, '04330100413', 'Xtra Savers', 82000, 3),
(4, '6787876690', 'Xtra Savers', 7946000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restrauran` int(11) NOT NULL,
  `name_res` text NOT NULL,
  `rating_rest` double NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(400) NOT NULL,
  `images_res` text NOT NULL,
  `latitude` int(11) NOT NULL,
  `longitude` int(11) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `filter` enum('halal','non') NOT NULL DEFAULT 'halal',
  `jarak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `restaurant`
--

INSERT INTO `restaurant` (`id_restrauran`, `name_res`, `rating_rest`, `alamat`, `no_hp`, `images_res`, `latitude`, `longitude`, `kapasitas`, `id_kategori`, `filter`, `jarak`) VALUES
(1, 'Furusato Izakaya', 4.8, 'Jakarta Selatan', '087843107171', 'https://b.zmtcdn.com/data/pictures/8/19336178/51be4bacc1ba002440f21c0a1fc06565.jpeg', 0, 0, 30, 1, 'halal', 2),
(2, 'QUEEN’S OF INDIA ', 4, 'Jakarta Barat', '087843107122', 'https://bb.trvcdn.net/uploads/galleries/506283131573737ec3cd3e_queen_s_tandoori.jpg', 0, 0, 30, 2, 'halal', 1),
(3, 'BOTTEGA RISTORANTE', 4.6, 'Jakarta Pusat', '087843107121', 'https://img.freepik.com/free-vector/detailed-barbecue-logo-template_23-2149008686.jpg?size=338&ext=jpg&ga=GA1.2.1760389070.1669119212&semt=sph', 0, 0, 40, 4, 'halal', 12),
(4, 'BATAVIA CAFFE', 5, 'Jakarta Pusat', '087843107171', 'https://www.beritanesia.id/assets/img/artikel/3703f164adfa6dfdadc24bcffcad81e1.jpg', 0, 0, 34, 3, 'halal', 14),
(5, 'Putien', 4.7, 'Jakarta', '08923123992', 'https://dwitamajayaperkasa.co.id/wp-content/uploads/2021/11/IMG20210831160202-scaled.jpg', 0, 0, 39, 5, 'non', 5),
(6, 'Paradise Dynasty', 4.6, 'Jakarta', '0823134221', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw8rfdxyvJMRsFSIMP6cJth__Q0L_8KCzngg&usqp=CAU', 0, 0, 50, 5, 'halal', 40),
(7, 'Eight Treasures', 4.5, 'Jakarta', '0897773821', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9vYYSAo5RH6O3EG76A5eef4fCGcVbubYhGfLONRTWFFlL4LYb6MJ2K6vUS9Aq7j5Sh6o&usqp=CAU', 0, 0, 23, 5, 'halal', 22),
(8, 'Sun City Restaurant ', 4.8, 'Jakarta', '0887382112', 'https://media-cdn.tripadvisor.com/media/photo-s/05/d1/44/e0/sun-city-restaurant.jpg', 0, 0, 40, 5, 'halal', 44),
(9, 'Jia Dining', 4.6, 'Jakarta', '08555468780', 'https://media1.miaminewtimes.com/mia/imager/u/original/12519521/jia_interior_rendering.jpg', 0, 0, 66, 5, 'halal', 40),
(10, 'The Royal Kitchen', 4.9, 'Jakarta', '0892312334', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr8Jj0L4WjjfLWhwpSOZ2b17dBjI01GUA_H_QuZV7HzdboPRmmOfraF405Gd3looZ4TyQ&usqp=CAU', 0, 0, 71, 2, 'halal', 22),
(11, 'Ganesha Ek Sanskriti', 4.8, 'Jakarta', '089234912', 'https://media-cdn.tripadvisor.com/media/photo-s/18/59/5c/57/restaurant-interior.jpg', 0, 0, 80, 2, 'halal', 21),
(12, 'D\' Bollywood', 4.9, 'Jakarta', '0892312391', 'https://assets-pergikuliner.com/WAdOC8TjmDuw2VSQKsiBzoP9rXc=/385x290/smart/https://assets-pergikuliner.com/uploads/image/picture/1763961/picture-1577349043.jpg', 0, 0, 20, 2, 'halal', 40),
(13, 'Accha', 4.7, 'Jakarta', '0821117780', 'https://media-cdn.tripadvisor.com/media/photo-s/25/17/5f/28/interior.jpg', 0, 0, 20, 2, 'halal', 22),
(14, 'Pagi Sore Restaurant', 5, 'BSD', '0892341223', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFPBJx6ipOmO0ABpmgiEbuZ4YdAHlqhvtZB6IbGDmPSQvbuvHx3wAVuz3IACGrhTLg33U&usqp=CAU', 0, 0, 90, 3, 'halal', 32),
(15, 'Plataran Dharmawangsa', 4.6, 'Jakarta Selatan', '0892313211', 'https://b.zmtcdn.com/data/pictures/6/7421166/2a13933039f7bc483aaa85f4d5074fe7.jpg', 0, 0, 330, 3, 'halal', 3),
(16, 'Bebek Kaleyo', 4.7, 'Jakarta Barat', '08923213911', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkN1oTBUvbdOW_94jiqE09HtBGQQwrfCTjHxCTRkICjp90ouJKg-YOWzApWqkZVL65wco&usqp=CAU', 0, 0, 200, 3, 'halal', 9),
(17, 'Tesate', 4.5, 'Jakarta Pusat', '08934423334', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYaVNbGCij3F7kALL0NbxEpIhSNAnCjgdcJZddZ3-KIH_LZ2SELt5qGq1hQohtursQfRg&usqp=CAU', 0, 0, 80, 3, 'halal', 33),
(18, 'Agneya Restaurant', 4.8, 'Jakarta Barat', '0821299300', 'https://assets-pergikuliner.com/aD2wAsiwyumM5-5URVprMv-VprM=/fit-in/1366x768/smart/filters:no_upscale()/https://assets-pergikuliner.com/uploads/image/picture/1548221/picture-1566446751.jpg', 0, 0, 70, 3, 'halal', 22),
(19, 'Osteria Gia', 5, 'Jakarta Selatan', '08922394420', 'https://manual.co.id/wp-content/uploads/2019/07/OsteriaGia-Rest_PP-17-980x719.jpg', 0, 0, 90, 4, 'halal', 33),
(20, 'Pizza Marzano', 4.7, 'Jakarta Timur', '08923243433', 'https://pizzamarzano.co.id/wp-content/uploads/2021/08/Pizza-Marzano-Semarang-1.jpg', 0, 0, 44, 4, 'halal', 30),
(21, 'Le Petit Chef', 4.8, 'Jakarta Barat', '0821232311', 'https://img.jakpost.net/c/2019/12/24/2019_12_24_83940_1577162389._large.jpg', 0, 0, 40, 4, 'halal', 44),
(22, 'Sushi Tei', 4.9, 'Jakarta Selatan', '0899944324', 'https://lippomallkemang.com/wp-content/uploads/2020/01/Sushi-Tei.jpg', 0, 0, 50, 1, 'halal', 30),
(23, 'Gyu-Kaku BBQ', 5, 'Jakarta Barat', '08221003452', 'https://resizer.otstatic.com/v2/photos/wide-huge/4/34927757.jpg', 0, 0, 30, 1, 'halal', 20),
(24, 'Ikkudo Ichi', 4.7, 'Jakarta Timur', '08922210430', 'https://ladypinem.com/wp-content/uploads/Ikkudo-1.jpg', 0, 0, 40, 1, 'halal', 20),
(25, 'Edogin Restaurant', 4.4, 'Jakarta Utara', '08999139002', 'https://media-cdn.tripadvisor.com/media/photo-s/15/a3/20/2d/photo0jpg.jpg', 0, 0, 33, 1, 'halal', 33),
(26, 'Social House', 4.9, 'Jakarta Timur', '0892232199', 'https://www.ismaya.com/storage/app/media/19.%20SOCIAL%20HOUSE/SOHO%20004.jpg', 0, 0, 44, 6, 'halal', 88),
(27, 'Maple and Oak', 4.7, 'Jakarta Utara', '082112034591', 'https://tempat.com/blog/wp-content/uploads/2019/09/Cozy-ambiance-at-Maple-and-Oak-Menteng-by-Myfunfoodiary.jpg', 0, 0, 30, 6, 'non', 8),
(28, 'Union Deli', 4.9, 'Jakarta Timur', '0892348991', 'http://surgakuliner.com/wp-content/uploads/2015/03/Union-Deli-Grand-Indonesia-Jakarta-2.jpg', 0, 0, 80, 6, 'halal', 9),
(29, 'Wolfgang Steakhouse', 5, 'Jakarta Barat', '08923489099', 'https://arsitagx-master.s3.ap-southeast-1.amazonaws.com/img-medium/40935/20795/aa-and-associates-wolfgang1626706208-m.jpeg', 0, 0, 80, 6, 'halal', 88),
(30, 'Penn', 4.8, 'Jakarta Selatan', '0899239489', 'https://images.squarespace-cdn.com/content/v1/51c8b108e4b050e44c477323/62c296ad-c29e-4013-8472-c2f890d2def9/Greysuitcase+-+Penn+Deli+Jakarta+06.jpg', 0, 0, 88, 6, 'halal', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `summary`
--

CREATE TABLE `summary` (
  `id_summary` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `summary`
--

INSERT INTO `summary` (`id_summary`, `cart_id`, `total`) VALUES
(47, 18, 30000),
(48, 19, 15000),
(49, 20, 46000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_summary` int(11) NOT NULL,
  `trans_total` double NOT NULL,
  `trans_date` date NOT NULL,
  `trans_time` time NOT NULL,
  `jumlah_orang` int(11) NOT NULL,
  `id_rekening` int(11) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_summary`, `trans_total`, `trans_date`, `trans_time`, `jumlah_orang`, `id_rekening`, `kode_unik`, `user_id`) VALUES
(36, 19, 23000, '2022-12-05', '00:29:00', 7, 1, 1789, 5),
(37, 20, 54000, '2022-12-03', '00:33:00', 3, 1, 8467, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_kembali`
--

CREATE TABLE `transaksi_kembali` (
  `id_refund` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `total` double NOT NULL,
  `kembali` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_kembali`
--

INSERT INTO `transaksi_kembali` (`id_refund`, `id_transaksi`, `total`, `kembali`) VALUES
(10, 35, 38000, 32300);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(400) NOT NULL,
  `user_email` varchar(400) NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users_table`
--

INSERT INTO `users_table` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Izaaz Azaam Syahalam', 'izaazsyahalam@gmail.com', 'ade78279ac9f7b66a1b7cbad4c9dfdb7'),
(3, 'catrinadia', 'catrinadia@gmail.com', 'ade78279ac9f7b66a1b7cbad4c9dfdb7'),
(5, 'Yovanka Puspa', 'ypa@gmail.com', '66fa241b531adeb36ac2e420895858ae');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indeks untuk tabel `cart_table_temp`
--
ALTER TABLE `cart_table_temp`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indeks untuk tabel `items_table`
--
ALTER TABLE `items_table`
  ADD PRIMARY KEY (`item_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indeks untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restrauran`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`id_summary`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi_kembali`
--
ALTER TABLE `transaksi_kembali`
  ADD PRIMARY KEY (`id_refund`);

--
-- Indeks untuk tabel `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `cart_table_temp`
--
ALTER TABLE `cart_table_temp`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `items_table`
--
ALTER TABLE `items_table`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restrauran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `summary`
--
ALTER TABLE `summary`
  MODIFY `id_summary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `transaksi_kembali`
--
ALTER TABLE `transaksi_kembali`
  MODIFY `id_refund` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
