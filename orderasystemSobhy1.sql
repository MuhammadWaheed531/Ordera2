-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 08:20 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orderasystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) DEFAULT NULL,
  `Password` varchar(40) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `Password`, `PhoneNumber`) VALUES
('Mohamed Waheed', '1234', 1014584099),
('Mohamed Sobhy', '7946', 1060927266),
('Hossam Bhi', '3214', 1099086281),
('Bahaa Eldeen', '9874', 1099626370),
('Kareem Mohamed', '3246', 1119661002),
('Mohamed Waheed', '1234', 1014584099),
('Mohamed Sobhy', '7946', 1060927266),
('Hossam Bhi', '3214', 1099086281),
('Bahaa Eldeen', '9874', 1099626370),
('Kareem Mohamed', '3246', 1119661002);

-- --------------------------------------------------------

--
-- Table structure for table `captain`
--

CREATE TABLE `captain` (
  `delivery_id` int(11) NOT NULL,
  `First_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `Scooter` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `online_status` int(11) DEFAULT NULL,
  `transportation_state` int(11) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL,
  `pan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `captain`
--

INSERT INTO `captain` (`delivery_id`, `First_name`, `last_name`, `password`, `email`, `Scooter`, `location`, `online_status`, `transportation_state`, `PhoneNumber`, `latitude`, `longtude`, `pan`) VALUES
(1, 'Mohamed ', 'Waheed', '4521', '73820@must.edu.eg', 'abc123', '2th District, 6 October,Giza , Egypt', 789654123, 1234, 1099086281, NULL, NULL, NULL),
(2, 'Mohamed ', 'Sobhy', '8745', '73782@must.edu.eg', 'abs 547', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Hossam', 'Bhi', '6254', '73807@must.edu.eg', 'abg 541', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Bahaa', 'Eldeen', '2378', '73687@must.edu.eg', 'abd 587', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Kareem', 'Mohamed', '4297', '73265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `captain_trans`
--

CREATE TABLE `captain_trans` (
  `delivery` int(11) DEFAULT NULL,
  `From_location` varchar(100) DEFAULT NULL,
  `to_location` varchar(100) DEFAULT NULL,
  `distance` varchar(15) DEFAULT NULL,
  `duration` varchar(15) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `captain_trans`
--

INSERT INTO `captain_trans` (`delivery`, `From_location`, `to_location`, `distance`, `duration`, `latitude`, `longtude`) VALUES
(1, 'Misr University for Science & Technology,6 October ,Giza,Egypt', '2th District, 6 October , Giza ,Egypt', '10 km', '20 min', NULL, NULL),
(1, 'Misr University for Science & Technology,6 October ,Giza,Egypt', '2th District, 6 October , Giza ,Egypt', '10 km', '20 min', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user_id` int(11) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `user_location` varchar(100) DEFAULT NULL,
  `product_location` varchar(100) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `restaurants_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`restaurants_id`, `item_id`, `name`, `description`, `price`, `image`) VALUES
(5, 1, 'Half Charcoal Grilled Chicken\r\n', 'Chicken, Rice, Bread, Potatoes, Salad ', 60, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/97676405-c935-4735-9bfa-42c702b69985.jpg'),
(1, 2, 'Big Mac', 'Two beef patties, that unbeatably tasty Big Mac sauce, melting signature cheese, crisp shredded lettuce, onions, pickles and a bun in the middle all between a toasted sesame seed bun', 42, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/298f37b4-f9f7-44ea-a297-02cda66bd50b.jpg'),
(3, 3, 'Big Zack', '2 layers of fried chicken, turkey, 2 cheddar cheese slices, lettuce, tomato, pickled cucumber, cheddar sauce, onion rings, BBQ sauce and mayonnaise sauce', 75, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/f61484c0-5d0f-40c2-bc92-d26c0ce5653c.jpg'),
(6, 4, 'Crunchy Bacon Mountain', 'Fries, beef bacon, cheese sauce', 29, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/3a3ce071-24aa-4249-8dd8-80c3e3c2dde0.jpg'),
(4, 5, 'Double Whopper', 'Bun 5 inch, 2 pcs whopper patties, tomatoes, lettuce, onion, pickles, ketchup and mayonnaise', 68, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/f9461a33-2ff9-4990-a88e-4d432e93c133.jpg'),
(2, 6, 'Chicken Shawerma Sandwich', '1 piece of chicken shawerma ,fries, pepsi', 32, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/eaf0483b-75b0-4342-820f-d24823b25320.jpg'),
(14, 7, '9 Pieces Bucket', '9 pieces chicken, served with family fries, large coleslaw, 4 bun and 1 liter soft drink', 188, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/6c072c74-aeae-4a2f-8d91-b737d5f97983.jpg'),
(9, 8, 'Shrimp', 'Pasta, shrimp, dill, seafood powder, white sauce and shrimp sauce', 64, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/ca388345-d53b-453b-a208-f9ff06e0ffb0.jpg'),
(12, 9, 'Smoky Cheese Pizza', 'Smoked veal, smoked cheese, cheddar, gouda, onion with creamy sauce', 65, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/da1b6eb8-0710-4bd2-9ebd-31d53f93be44.jpg'),
(10, 10, 'Chicken Meal', '1/2 Chicken', 55, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/521f6a87-b26a-41d0-a11c-b56b5df952a5.jpg'),
(8, 11, 'Shrimp with Butter and Lemon', '10 jumbo shrimp pieces, butter and lemon sauce and Balad El Ghareb rice', 86, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/db18faff-73e2-4424-8faa-aa3a1c82bcc8.jpg'),
(11, 12, 'Black Forest', 'Chocolate sponge cake with fresh cream and cherry jam', 330, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/a9a50284-8e77-410a-a739-fba18ab00f68.jpg'),
(5, 13, 'Arabian Double Shawerma Meal', 'Fries, garlic dip, pickles\r\n\r\n', 65, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/27437d70-d7eb-4458-b38f-60ce01f62d77.jpg'),
(5, 14, 'Arabian Shawerma Meal', 'Fries, garlic dip, pickles\r\n\r\n', 40, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/e8d21597-0118-4852-a7a7-f9ace5c98bc4.jpg'),
(5, 15, 'French Arabian Meal', 'Fries, garlic dip, pickles\r\n\r\n', 43, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/696850ad-4f90-478e-a017-1281b8d992ac.jpg'),
(5, 16, 'Double Grilled Thigh Meal', 'Garlic dip, rice, pickles, fries, bread', 60, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/c71a5c0c-e700-4aa5-9f16-cfc06588b921.jpg'),
(5, 17, 'Cheese Beef Burger', 'Burger, Cheese, Salad', 32, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/7a88bffe-2ac7-4152-9ec7-2630e783fa33.jpg'),
(1, 18, 'McFalafel', 'Three pieces of falafel garnished with tomatoes, lettuce, onion, pickles and topped with Tehina sauce, all wrapped inside a freshly backed tortilla wrap', 30, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/8bbbb9b4-f3fc-4fda-a738-5c85dfa98b22.jpg'),
(1, 19, 'Hash Browns', 'Deliciously tasty hash browns. Fluffy on the inside, crispy and toasty on the outside', 9, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/9181802b-fab1-4e85-8ad7-c8e39a28c39d.jpg'),
(1, 20, 'Fillet-O-Fish\r\n', 'Delicious breaded fish filet with tartar sauce and melty cheese served in a steamed bun', 34, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/acb1585d-5dd3-4d63-b463-b643fd657956.jpg'),
(1, 21, 'Big Mac Fillet-O-Fish\r\n', '2 Pure white fish breaded patties covered with tasty tartar sauce and a layer of cheese all wrapped in fresh bread', 62, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/808a1102-5a02-440d-8c15-f5c7eb195673.jpg'),
(1, 22, 'Barbecue Sauce\r\n', 'Sizzling smokey flavor. Give your meals a zesty edge\r\n\r\n', 5, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/14b0c79f-2ce0-40ed-ad03-1b436e7319c3.jpg'),
(3, 23, 'Mozzarella Madness', 'Lettuce, tomato, pickled cucumber, mayonnaise, fried chicken breasts covered with mozzarella and mozzarella sticks', 60, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/d125f3f7-9e15-4e72-ac4f-fdbe83bb0320.jpg'),
(3, 24, 'The Rancher\r\n', 'Fried chicken breasts, lettuce, tomato, pickled cucumber, ranch sauce, mayonnaise sauce', 55, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/abaf9c3d-f5d8-4310-8b78-0640bd1cf08b.jpg'),
(3, 25, 'Tender Supreme\r\n', '3 boneless chicken tenders, served with fries and coleslaw\r\n\r\n', 39, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/d58dd398-f135-4069-8858-3f8ec75af9f8.jpg'),
(3, 26, 'Kids Meal\r\n', 'Chicken sandwich with fries, juice and toy\r\n\r\n', 28, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/572e2cb9-0898-4ed3-99f5-e13428f5bfdd.jpg'),
(3, 27, 'BBQ Sauce\r\n', 'Extra BBQ Sauce\r\n', 10, 'BBQ Sauce\r\n'),
(6, 28, 'Tortilla Chicken Popcorn\r\n', 'Tortilla bread, iceberg lettuce, fried chicken popcorn, cheese sauce and crunchy beef bacon', 48, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/bb41a4b2-705b-4e14-9f00-8b950b8cfcd3.jpg'),
(6, 29, 'Daddy\'s Mix Box\r\n', 'Potato wedges, fried mozzarella sticks, onion rings and 2 dip sauces\r\n\r\n', 39, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/f4f998ae-6084-401e-9b33-caf717a7561b.jpg'),
(6, 30, 'Classic Cheese Burger\r\n', 'Beef burger patty, American cheese, mayonnaise, pickled cucumber\r\n\r\n', 32, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/b6293c7e-e6cb-4f4e-87d3-188e7e83272b.jpg'),
(6, 31, 'Classic Beef Burger\r\n', 'Beef Burger Sandwich', 55, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/02232df8-ea6b-41e4-a1c8-7ecf8faa099a.jpg'),
(6, 32, 'Lotus Rolls\r\n', 'Deserts', 40, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/fecce658-f0cb-437f-911d-731404d2b871.jpg'),
(4, 33, 'Triple Whopper\r\n', 'Bun 5 inch, 3 pcs whopper patties, tomatoes, lettuce, onion, pickles, ketchup and mayonnaise', 83, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/a288aff5-777a-4264-830a-b7d6967488d9.jpg'),
(4, 34, 'BBQ Cheese Burger\r\n', 'Bun 4 inch, burger patty, BBQ sauce, American cheese\r\n\r\n', 33, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/e95b35c8-ab45-4dc3-b082-3b1ca473097f.jpg'),
(4, 35, 'Big King Single\r\n', 'Bun 5 inch, whopper patty, big king sauce, lettuce, onion, 2 pcs American cheese, pickles', 56, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/b1c6fe2c-2d82-41ce-a222-98bc82030d4b.jpg'),
(4, 36, 'BBQ Packet\r\n', 'Heinze BBQ Packet\r\n', 2, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/9a7de998-9bd2-4822-a637-51cebc80f5d2.jpg'),
(4, 37, 'Coca Cola Can\r\n', 'Drincks', 18, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/92d97445-7f57-4ed1-9b75-8b004353914f.jpg'),
(2, 38, 'Mix Grill Plate\r\n', '3 kebab or quarter chicken, 3 kofta, 3 shish tawook, served with bread and salad\r\n\r\n', 110, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/e811afbf-ec8a-46c3-9416-31208a405139.jpg'),
(2, 39, 'Grilled Kofta Plate\r\n', 'Kofta', 65, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/bbe460cc-74fe-44e2-a557-47c353146879.jpg'),
(2, 40, 'Kofta\r\n', 'Kofta Sandwich', 36, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/64f6316e-b799-4e42-bf98-6e31fe24c69b.jpg'),
(2, 41, 'Chicken Shawerma Sandwich\r\n', 'Shawerma Sandwich', 32, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/eaf0483b-75b0-4342-820f-d24823b25320.jpg'),
(2, 42, 'Fanta Orange\r\n', 'Drinks', 7, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/9d7e2eec-2669-440e-9c42-207c4ad931d9.jpg'),
(14, 43, 'Dinner Combo\r\n', '3 pieces chicken, served with medium fries, coleslaw, bun and medium soft drink\r\n\r\n', 80, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/820d9ffd-d9d5-4997-9603-0070a8df2207.jpg'),
(14, 44, 'Snack Box\r\n', '2 spicy or original chicken pieces, fries and bun\r\n\r\n', 41, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/187480c4-389f-4ae2-8f10-3682815e3f1c.jpg'),
(14, 45, '15 Pieces Bucket\r\n', '15 pieces chicken, served with family fries, large coleslaw, 6 buns and 1 liter soft drink', 268, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/35e6c4eb-ce3d-4b28-8674-a5639aaccfc6.jpg'),
(14, 46, 'Zinger Fries\r\n', 'Potatoes', 22, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/5020e19f-874b-4f4b-8618-9f3b5cc2e2a1.jpg'),
(14, 47, 'Rice \r\n', 'Rice without Chicken\r\n', 16, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/fb388853-3ccd-4209-a57d-aa3a394f85a1.jpg'),
(14, 48, 'Soft Drinks\r\n', 'Pepsi', 22, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/a2a6ca03-fdf9-409e-999b-8252593b12e9.jpg'),
(9, 49, 'Dawood Basha\r\n', 'Pasta, dawood basha, green sauce and red sauce\r\n\r\n', 39, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/e71fb399-631d-4729-8b9e-0d72db29fde6.jpg'),
(9, 50, 'Chicken', 'Pasta with chicken and white sauce\r\n\r\n', 54, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/ea6c078b-90b4-444c-bbcb-ae89e5a1ea79.jpg'),
(9, 51, 'Sauteed Mediterranean Shrimp\r\n', 'Tortilla bread, shrimp, dill,shrimp sauce, green pepper, onion, tomato, sriracha sauce and mayonnaise', 53, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/cbe2550a-79ca-4bbd-b68a-09ba9024804c.jpg'),
(9, 52, 'Mushroom\r\n', 'Pasta, mushroom, mozzarella cheese and white sauce\r\n\r\n', 50, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/4c3cbc48-0b1c-4cab-abda-5c92aa9705f1.jpg'),
(9, 53, 'Lo2met EL Borio\r\n', 'Deserts', 25, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/bda76e6d-58f0-4dea-8a3c-0481200f3071.jpg'),
(12, 54, 'Chicken BBQ\r\n', 'Grilled chicken, onion, fresh mushroom and BBQ sauce drizzled on top\r\n\r\n', 60, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/ad6e5e55-7fa3-45ef-88ce-2ebd53ecf8fe.jpg'),
(12, 55, 'CHA CHA\r\n', 'Grilled chicken, chicken sausage, onion and green pepper\r\n\r\n', 65, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/c5b75836-dcdd-45c8-93cd-683ea7237321.jpg'),
(12, 56, 'Smoky Cheese\r\n', 'Smoked veal, smoked cheese, cheddar, gouda, onion with creamy sauce\r\n\r\n', 126, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/5fa49c75-54bd-4864-be02-b1a39a06bcd1.jpg'),
(12, 57, 'Chocolate Pie\r\n', 'Deserts', 46, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/a6f2165a-6329-463a-b3ac-0b11674d9fa6.jpg'),
(12, 58, 'Ranch Sauce\r\n', 'Sauce', 7, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/156c4d3b-ab55-47ff-bb61-f7e13baeda4d.jpg'),
(8, 59, 'Shrimp with Butter and Lemon\r\n', '10 jumbo shrimp pieces, butter and lemon sauce and Balad El Ghareb rice\r\n\r\n', 86, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/db18faff-73e2-4424-8faa-aa3a1c82bcc8.jpg'),
(8, 60, 'Chili Mustard\r\n', 'Crispy shrimp, mustard sauce, smoked turkey and jalapeno\r\n\r\n', 64, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/261615f2-4c9a-48e8-97de-93a5fc449683.jpg'),
(8, 61, 'Quattro Formaggi Mix Seafood\r\n', 'Penne pasta, cheddar, blue cheese and mozzarella\r\n\r\n', 86, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/694f2587-2974-4c7d-b226-29af0828f8be.jpg'),
(8, 62, 'Grilled Shrimp Rizo\r\n', 'Shrimp', 45, 'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/75be76ea-deb6-4105-bbf7-cc60e0b3cee7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `supermarket_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groceries`
--

INSERT INTO `groceries` (`supermarket_id`, `item_id`, `name`, `description`, `price`, `image`) VALUES
(4, 1, 'Milk', 'Almarai Full Cream Milk', 15, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBIUFBgUFBUYGBgaFBoaGRgaGBoaGxoYGBgaGxoaGBkbIS0kGx0qIRgaJTclKi4xNDQ0GiM6PzoyPi0zNDEBCwsLEA8QHxISHzkqJCszMzMzNDU1MzMzNTMzMzMzMTQzNTMzPDMzMzMzM'),
(2, 2, 'Pasta', 'El Malaka Stripy Penne Pasta', 6, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTEhMVFRUWGBcVFRcYFxcXFRgVFxUWFxcYFxcYHSggGB0lGxcXITEhJSktLi4uGB8zODMtNygtLisBCgoKDg0OGxAQGy0lICUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tL'),
(3, 3, 'Vegetables, Fruits', 'Potatoes, Watermelon, Tomatoes, Carrots ', 62, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXRKe_k1KZHHkFAw_UgDAXN6dkz9u1cfdICQ&usqp=CAU'),
(1, 4, 'Tuna', 'Fish Salamon (Sun Shine)', 12, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhIZGRgZGhoaGhocHBgaHBoZGBgaGhgaGBwfIS4lHB4rIxgaJjgnKy8xNTU1GiQ7QDszPy40NTQBDAwMEA8QGBISHzQrJCE0NDQ0NDU0NDQ0NzQ0ND80PzQ0NDQ0NDE0ND09N'),
(2, 5, 'Pepsi Can', 'Soft Drinks', 5, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPEhUSEBAQEBAVFQ8QEA8PEA8SDw8QFRIXFxUVFRYYHSggGBolGxUVITEhJSkrLi4uFx82ODMsNygtOisBCgoKDg0OGhAQGy0lICYuLy0vLS0tLS8uLS0tLS0tLS0tLS0tLS0tLS0tL'),
(4, 1, 'Milk', 'Almarai Full Cream Milk', 15, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBIUFBgUFBUYGBgaFBoaGRgaGBoaGxoYGBgaGxoaGBkbIS0kGx0qIRgaJTclKi4xNDQ0GiM6PzoyPi0zNDEBCwsLEA8QHxISHzkqJCszMzMzNDU1MzMzNTMzMzMzMTQzNTMzPDMzMzMzM'),
(2, 2, 'Pasta', 'El Malaka Stripy Penne Pasta', 6, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTEhMVFRUWGBcVFRcYFxcXFRgVFxUWFxcYFxcYHSggGB0lGxcXITEhJSktLi4uGB8zODMtNygtLisBCgoKDg0OGxAQGy0lICUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tL'),
(3, 3, 'Vegetables, Fruits', 'Potatoes, Watermelon, Tomatoes, Carrots ', 62, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXRKe_k1KZHHkFAw_UgDAXN6dkz9u1cfdICQ&usqp=CAU'),
(1, 4, 'Tuna', 'Fish Salamon (Sun Shine)', 12, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhIZGRgZGhoaGhocHBgaHBoZGBgaGhgaGBwfIS4lHB4rIxgaJjgnKy8xNTU1GiQ7QDszPy40NTQBDAwMEA8QGBISHzQrJCE0NDQ0NDU0NDQ0NzQ0ND80PzQ0NDQ0NDE0ND09N'),
(2, 5, 'Pepsi Can', 'Soft Drinks', 5, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPEhUSEBAQEBAVFQ8QEA8PEA8SDw8QFRIXFxUVFRYYHSggGBolGxUVITEhJSkrLi4uFx82ODMsNygtOisBCgoKDg0OGhAQGy0lICYuLy0vLS0tLS8uLS0tLS0tLS0tLS0tLS0tLS0tL');

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `library_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `image` varchar(990) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`library_id`, `name`, `description`, `location`, `image`, `latitude`, `longtude`) VALUES
(1, 'Samir & Ali \r\n            ', 'Office supplies - Stationery - Scientific equipment', '11 Ali Ibn Abi Talib, First 6th of October, Giza Governorate', 'https://i.ibb.co/Wf96nnD/samir-ali.jpg', NULL, NULL),
(2, 'Bernasos \r\n            \r\n', 'Office supplies - engineering supplies - printing inks', '833 Sabry El-Rashidy, First 6th of October, Giza Governorate', 'https://i.ibb.co/1KcKkQF/Bernasos.jpg', NULL, NULL),
(3, 'Almanar', 'Office supplies -Writing Tools - Toys & Gifts - stationery', '427 Al Mehwar Al Markazi, First 6th of October, Giza Governorate', 'https://i.ibb.co/68GnqwS/Almanar.jpg', NULL, NULL),
(4, 'Elshrouq \r\n           ', 'Arabic & English books - Children\'s books - Blogs', '6 Al Hay Al Thalith, First 6th of October, Giza Governorate', 'https://i.ibb.co/PrpNNC9/Elshrouq.png', NULL, NULL),
(5, 'Alsham Elhaditha\r\n', 'Printing inks - stationery - Office supplies', '12 Divided from Halab, First 6th of October, Giza Governorate', 'https://i.ibb.co/SX0mTgm/Alsham-Elhaditha.jpg', NULL, NULL),
(6, 'Alwan \r\n           ', 'Office supplies - engineering supplies - printing inks - stationery', 'eyelash clinic, First 6th of October, Giza Governorate', 'https://i.ibb.co/0tVXbNt/Alwann.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurants_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location` varchar(999) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurants_id`, `name`, `description`, `location`, `image`, `latitude`, `longtude`) VALUES
(1, 'mac', 'Fast Food Restaurant', 'Al motamayez District,6 October, Giza, Egypt', 'https://i.ibb.co/RpWFhGY/Mc-Donalds.png', NULL, NULL),
(2, 'GAD', 'Foul and Falafel, Sandwiches, Oriental', 'Al Doctor Ahmed Monib, Qism Banha, Banha, Al Qalyubia Governorate', 'https://i.ibb.co/nCPNknK/Gad.jpg', NULL, NULL),
(3, 'Zack\'s', 'Fast Food Restaurant', 'Emirates NBD، City Star October Mall, Giza, Egypt ', 'https://1.bp.blogspot.com/-ohZ7ie5iBaA/Xudr_63-wbI/AAAAAAAABBo/6oBnRVxnA7s-Pzri4zKJgXbtI5vEmUa4wCLcBGAsYHQ/s1600/PicsArt_06-15-02.37.37.jpg', NULL, NULL),
(4, 'Burger King', 'Fast Food Restaurant', 'Haram, Giza, Egypt', 'https://i.ibb.co/cXMZgBr/Burger-King.png', NULL, NULL),
(5, 'Rosto', 'Fast Food Restaurant', 'El hosary,6 October, Giza,Egypt', 'https://i.ibb.co/2ZxdypX/Rostoo.jpg', NULL, NULL),
(6, 'Daddy\'s Burger', 'Burgers, Sandwiches', 'Diamond Mall, First 6th of October, Giza Governorate', 'https://i.ibb.co/h2By8r3/Daddy-s-Burgerr.png', NULL, NULL),
(7, 'Al-Baroon', 'Seafood', '1275 Rich Bake, First 6th of October, Giza Governorate', 'https://i.ibb.co/547Xydr/AlBaroon.png', NULL, NULL),
(8, 'Balad El Gharieb', 'Seafood, Sandwiches', 'Al Mehwar Al Markazi Road, La-cite mall, Al Housary sq, Giza Governorate', 'https://i.ibb.co/4fMtYyf/Balad-El-Gharieb.jpg', NULL, NULL),
(9, 'Pastaweesy', 'Pasta, Sandwiches, Fast Food', '435 Al Mehwar Al Markazi, First 6th of October, Giza Governorate', '\\nhttps://i.ibb.co/q7PwR14/Pastaweesy.jpg', NULL, NULL),
(10, 'Hadramawot', 'Oriental, Grills', 'Al Mehwar Al Markazi, 1st District, 6th of October, Egypt', 'https://i.ibb.co/2cHn5TC/Hadramawot.png', NULL, NULL),
(11, 'La Poire', 'Desserts, Oriental, Bakery and Cakes', 'Al Batea- Moazi Llmehwar Al Markazi, First 6th of October, Giza Governorate', 'https://i.ibb.co/cNJrnSL/La-Poire.jpg', NULL, NULL),
(12, 'Papa John\'s Pizza', 'Pizza, Salads', 'Mall of Arabia, 26th of July Corridor, Giza Governorate', 'https://i.ibb.co/d2C7k5m/Papa-John-s.jpg', NULL, NULL),
(13, 'ElSharkawy', 'Grills, Sandwiches, Kebda, Mokh', '44 Awlad Al Mohr, First 6th of October, Giza Governorate', 'https://i.ibb.co/KW3fKxc/Elsharqawy.png', NULL, NULL),
(14, 'KFC', 'Fast Food, Sandwiches, International', '40 Al Mehwar Al Markazi Al Nassr St, First 6th of October, Giza Governorate', 'https://i.ibb.co/TY5mTGZ/KFC.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supermarket`
--

CREATE TABLE `supermarket` (
  `supermarket_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `image` varchar(990) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supermarket`
--

INSERT INTO `supermarket` (`supermarket_id`, `name`, `description`, `location`, `image`, `latitude`, `longtude`) VALUES
(1, 'Syria Market ', 'Super Market', '2th District , 6 October, Giza,Egypt', 'https://i.ibb.co/dgCn81y/Sorya.jpg', NULL, NULL),
(2, 'Bim', 'Hyper Market', 'Plot 202 ,2nd District, 6 october, Giza, Egypt ', 'https://www.bim.eg/templates/page/bimtr/css/images/logo.fw.png', NULL, NULL),
(3, 'Zone Hyper', 'Hyper Market ', 'Almotamayez District,6 October, Giza ,Egypt', 'https://i.ibb.co/9gH7Pzb/zone-hyper.jpg', NULL, NULL),
(4, 'Shana Nature House Market', 'Super Market', 'Almotamayez District,6 October, Giza, Egypt', 'https://i.ibb.co/k2R8k2G/Shana-Nature-House.jpg', NULL, NULL),
(5, 'Ragab Elattar', 'Grocery', '12 Sub Central AXS, First 6th of October, Giza Governorate', 'https://i.ibb.co/wdKzLXq/ragab-alattar.png', NULL, NULL),
(6, 'Lebanese Roastery', 'Nuts, Grocery', '945 El-Hag Housny Abou El-Khair, First 6th of October, Giza Governorate', 'https://i.ibb.co/ngkNndj/Lebanese-Roasteryy.png', NULL, NULL),
(7, 'The Kushk', 'Grocery, Convenience Store', '1264 Omar Ibn El-Khattab, First 6th of October, Giza Governorate', 'https://i.ibb.co/SJNBzX2/Kushk.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `library_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`library_id`, `item_id`, `name`, `description`, `price`, `image`) VALUES
(3, 1, 'Calculator', 'Casio Scientific Calculator', 450, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgREhIYEhgYGBgaGRkYGBgaHxkYGBgaHBgaGhwcIy4nHR4sHxkfJzgnKy8xNTU1HCQ7QDszPy40NTEBDAwMEA8QHhISGjQjISE0NDQ0NDQxNDQ0ND80NDE0NDQ0NDQ0NDQ0NDQ0N'),
(2, 2, 'Line Marker', 'Marker', 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTM_OTAkWV3flhKxeIBixLc2C9dBA5SL2ogA&usqp=CAU'),
(5, 3, 'NoteBook', 'Ntebook Rhodia', 90, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxAQERAQERAQEBAQEBAQEBAQEBAQEBAQFhIYGBYSFhYaHysiGhwoHxYWI0EjKCwuMjExGSE6PDo8OyswMS4BCwsLDw4PFhERGTAfHx8wMDAwLjAwMC4wLjMwNjAwLi4wLjAuMC4wLjAwL'),
(3, 1, 'Calculator', 'Casio Scientific Calculator', 450, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgREhIYEhgYGBgaGRkYGBgaHxkYGBgaHBgaGhwcIy4nHR4sHxkfJzgnKy8xNTU1HCQ7QDszPy40NTEBDAwMEA8QHhISGjQjISE0NDQ0NDQxNDQ0ND80NDE0NDQ0NDQ0NDQ0NDQ0N'),
(2, 2, 'Line Marker', 'Marker', 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTM_OTAkWV3flhKxeIBixLc2C9dBA5SL2ogA&usqp=CAU'),
(5, 3, 'NoteBook', 'Ntebook Rhodia', 90, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxAQERAQERAQEBAQEBAQEBAQEBAQEBAQFhIYGBYSFhYaHysiGhwoHxYWI0EjKCwuMjExGSE6PDo8OyswMS4BCwsLDw4PFhERGTAfHx8wMDAwLjAwMC4wLjMwNjAwLi4wLjAuMC4wLjAwL');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `id` int(11) NOT NULL,
  `First_name` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Scooter` varchar(10) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `_user`
--

CREATE TABLE `_user` (
  `user_id` int(11) NOT NULL,
  `First_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longtude` varchar(30) DEFAULT NULL,
  `pan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `_user`
--

INSERT INTO `_user` (`user_id`, `First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`, `latitude`, `longtude`, `pan`) VALUES
(1, 'Mohamed ', 'Sobhy', '1234', '73782@must.edu.eg', 'Elmotamayez Dictrict, 6 october,Giza, Egypt', 1060927266, NULL, NULL, NULL),
(2, 'Mohamed', 'Waheed', '5214', '73780@must.edu.eg', 'El hossary , 6 October , Giza, Egypt', 1144338618, NULL, NULL, NULL),
(3, 'Bahaa', 'Eldeen', '2378', '73687@must.edu.eg', '2th District, 6 October , Giza, Egypt', 1099626370, NULL, NULL, NULL),
(4, 'Hossam', 'Bhi', '4297', '73807@must.edu.eg', '7th District, 6 October, Giza , Egypt', 1099086281, NULL, NULL, NULL),
(5, 'Kareem', 'Mohamed', '8501', '73625@must.edu.eg', 'El hossary ,6 October, Giza, Egypt', 1119661002, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captain`
--
ALTER TABLE `captain`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD KEY `fk_groceries` (`supermarket_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurants_id`);

--
-- Indexes for table `supermarket`
--
ALTER TABLE `supermarket`
  ADD PRIMARY KEY (`supermarket_id`);

--
-- Indexes for table `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captain`
--
ALTER TABLE `captain`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurants_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supermarket`
--
ALTER TABLE `supermarket`
  MODIFY `supermarket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `_user`
--
ALTER TABLE `_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `fk_groceries` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarket` (`supermarket_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
