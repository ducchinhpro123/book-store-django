-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2024 at 06:23 PM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.15


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_author`
--

CREATE TABLE `author_author` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` longtext NOT NULL,
  `img_profile` varchar(100) DEFAULT NULL,
  `year_of_birth` int DEFAULT NULL,
  `year_of_death` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `author_author`
--

INSERT INTO `author_author` (`id`, `name`, `bio`, `img_profile`, `year_of_birth`, `year_of_death`) VALUES
(1, 'J.R.R. Tolkien', 'John Ronald Reuel Tolkien was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings.', 'author_images/9c794dede71da826f6f0e21ae342ec7a-1188x1536-2814825702.jpg', 1892, 1973),
(2, 'J.K. Rowling', 'Joanne Rowling, better known by her pen name J.K. Rowling, is a British author, philanthropist, film producer, television producer, and screenwriter. She is best known for writing the Harry Potter fantasy series.', 'author_images/tmp_RPn3v6_.jpg', 1965, NULL),
(3, 'Harper Lee', 'Nelle Harper Lee was an American novelist best known for her 1960 novel To Kill a Mockingbird. She has received numerous accolades for her work, including the Presidential Medal of Freedom.', 'author_images/harper-lee-ap061211013687-2972313359.jpg', 1926, 2016),
(4, 'George Orwell', 'George Orwell, real name Eric Arthur Blair, was an English novelist, essayist, and critic. He is best known for his novels Animal Farm and 1984, which are widely acclaimed as two of the greatest novels of the 20th century.', 'author_images/pg-18-orwell-ap-2085788153.jpg', 1903, 1950),
(5, 'Orson Scott Card', 'Orson Scott Card is an American writer best known for his science fiction novel Ender\'s Game.', 'author_images/Orson-Scott-Card-3725826258.jpg', 1951, NULL),
(6, 'Jane Austen', 'Jane Austen was an English novelist known primarily for her six novels, which implicitly interpret, critique, and comment upon the British landed gentry at the end of the 18th century.', 'author_images/jane-austen-89204916.jpg', 1775, 1817),
(7, 'Suzanne Collins', 'Suzanne Marie Collins is an American author and television writer. She is best known as the author of the young adult dystopian book series The Hunger Games', 'author_images/AuthorSuzanneCollins-1431049843.jpg', 1962, NULL),
(8, 'Charlotte Bronte', 'Charlotte Brontë was an English novelist and poet, the eldest of the three Brontë sisters who survived into adulthood and whose novels became classics of English literature', 'author_images/charlotte-bronte-3-834506525.jpg', 1816, 1855),
(9, 'J.D. Salinger', 'J.D. Salinger was an American writer known for his novel The Catcher in the Rye.', 'author_images/x293-715824265.jpg', 1919, 2010);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Management For Book');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 1, 37),
(3, 1, 38),
(4, 1, 39),
(1, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add author', 7, 'add_author'),
(26, 'Can change author', 7, 'change_author'),
(27, 'Can delete author', 7, 'delete_author'),
(28, 'Can view author', 7, 'view_author'),
(29, 'Can add publisher', 8, 'add_publisher'),
(30, 'Can change publisher', 8, 'change_publisher'),
(31, 'Can delete publisher', 8, 'delete_publisher'),
(32, 'Can view publisher', 8, 'view_publisher'),
(33, 'Can add genre', 9, 'add_genre'),
(34, 'Can change genre', 9, 'change_genre'),
(35, 'Can delete genre', 9, 'delete_genre'),
(36, 'Can view genre', 9, 'view_genre'),
(37, 'Can add book', 10, 'add_book'),
(38, 'Can change book', 10, 'change_book'),
(39, 'Can delete book', 10, 'delete_book'),
(40, 'Can view book', 10, 'view_book'),
(41, 'Can add review', 11, 'add_review'),
(42, 'Can change review', 11, 'change_review'),
(43, 'Can delete review', 11, 'delete_review'),
(44, 'Can view review', 11, 'view_review'),
(45, 'Can add sale', 12, 'add_sale'),
(46, 'Can change sale', 12, 'change_sale'),
(47, 'Can delete sale', 12, 'delete_sale'),
(48, 'Can view sale', 12, 'view_sale'),
(49, 'Can add customer', 13, 'add_customer'),
(50, 'Can change customer', 13, 'change_customer'),
(51, 'Can delete customer', 13, 'delete_customer'),
(52, 'Can view customer', 13, 'view_customer'),
(53, 'Can add seller', 14, 'add_seller'),
(54, 'Can change seller', 14, 'change_seller'),
(55, 'Can delete seller', 14, 'delete_seller'),
(56, 'Can view seller', 14, 'view_seller'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart'),
(61, 'Can add cart book', 16, 'add_cartbook'),
(62, 'Can change cart book', 16, 'change_cartbook'),
(63, 'Can delete cart book', 16, 'delete_cartbook'),
(64, 'Can view cart book', 16, 'view_cartbook'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add order book', 18, 'add_orderbook'),
(70, 'Can change order book', 18, 'change_orderbook'),
(71, 'Can delete order book', 18, 'delete_orderbook'),
(72, 'Can view order book', 18, 'view_orderbook'),
(73, 'Can add wishlist', 19, 'add_wishlist'),
(74, 'Can change wishlist', 19, 'change_wishlist'),
(75, 'Can delete wishlist', 19, 'delete_wishlist'),
(76, 'Can view wishlist', 19, 'view_wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$UZIG78BDEbdP07AvG5d9OG$D3B87a+W+f5QuezbvnnQLvzcGOEjlvGcCs7BCgCiYS4=', '2024-04-16 04:23:11.647857', 1, 'duchi', '', '', '', 1, 1, '2024-04-14 15:29:44.809306'),
(2, 'pbkdf2_sha256$720000$ft9lJwQXW7qnw6f9I1Nhqb$CFXQdGgBHzZnzc5l1ecIOWZDp1bxDd6QM1/KhC2Hc5M=', '2024-04-16 03:54:20.135490', 0, 'duchi1', '', '', 'duchi1@bookshop.com', 1, 1, '2024-04-15 12:52:33.000000'),
(3, 'pbkdf2_sha256$720000$VQdlFhkGHjQR0TqocgpqZx$Fycqbz/NJUWvtDIrOQc7pPA9dwwGMm3q8g5EGpLBzDE=', '2024-04-15 12:53:02.313958', 0, 'duchi2', '', '', 'duchi2@bookshop.com', 0, 1, '2024-04-15 12:53:01.980258'),
(4, 'pbkdf2_sha256$720000$0T0vGsGshV5MgJJhKnTGun$KJTaH4WRhfNkJrWrDoYjTB1Otzm98VOXHGB4RZbVGNQ=', '2024-04-15 12:53:22.751102', 0, 'duchi3', '', '', 'duchi3@bookshop.com', 0, 1, '2024-04-15 12:53:22.417354'),
(5, 'pbkdf2_sha256$720000$FNAlw8PtmgnKuucExFASLP$iRzj2hMLugjSIvEr2FX9LjXdLdp9Kv0VGI3iciXuweM=', '2024-04-16 06:22:20.607939', 0, 'duchi10', '', '', 'duchi10@bookshop.com', 0, 1, '2024-04-16 03:17:23.501350');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 56);

-- --------------------------------------------------------

--
-- Table structure for table `book_book`
--

CREATE TABLE `book_book` (
  `id` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `stock` int NOT NULL,
  `deal_of_the_week` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  `slug` varchar(50) NOT NULL,
  `seller_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_book`
--

INSERT INTO `book_book` (`id`, `title`, `image`, `price`, `stock`, `deal_of_the_week`, `description`, `slug`, `seller_id`) VALUES
(1, 'The Hobbit', 'book_images/81DdimpKAL-3786689475.jpg', '9.99', 100, 0, '<p>The Hobbit is a fantasy novel by J.R.R. Tolkien.</p>', 'the-hobbit', 1),
(2, 'The Fellowship of the Ring', 'book_images/9780008376123-2871803897.jpg', '9.99', 94, 1, '<p>The Fellowship of the Ring is a fantasy novel by J.R.R. Tolkien.</p>', 'the-fellowship-of-the-ring', 1),
(3, 'The Two Towers', 'book_images/30901758335-3854442167.jpg', '9.99', 100, 0, '<p>The Two Towers is a fantasy novel by J.R.R. Tolkien.</p>', 'the-two-towers', 3),
(4, 'The Return of the King', 'book_images/x293-715824265.jpg', '9.99', 96, 1, '<p>The Return of the King is a fantasy novel by J.R.R. Tolkien.</p>', 'the-return-of-the-king', 1),
(5, 'Harry Potter and the Philosopher\'s Stone', 'book_images/9781408855652-1583331150.jpeg', '7.99', 150, 0, '<p>Harry Potter and the Philosopher\'s Stone is the first novel in the Harry Potter series by J.K. Rowling. It follows the adventures of Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday and is whisked away to Hogwarts School of Witchcraft and Wizardry. There, he makes friends, faces a dark wizard intent on destroying him, and learns about the wizarding world.</p>', 'harry-potter-and-the-philosophers-stone', 1),
(6, 'To Kill a Mockingbird', 'book_images/ToKillaMockingbird-1109282674.jpg', '6.99', 80, 1, '<p>To Kill a Mockingbird is a classic novel by Harper Lee, published in 1960. It tells the story of a young girl named Scout Finch and her family in the fictional town of Maycomb, Alabama, during the Great Depression. The novel explores themes of racial injustice, courage, compassion, and the loss of innocence. It is widely considered one of the greatest American novels of the 20th century and has been praised for its nuanced portrayal of complex social issues.</p>', 'to-kill-a-mockingbird', 1),
(7, '1984', 'book_images/1984-485787009.jpg', '8.99', 116, 1, '<p>1984 is a dystopian novel by George Orwell, published in 1949. It depicts a totalitarian society where the government, known as Big Brother, maintains complete control over the lives of its citizens. The novel follows the story of Winston Smith, a government worker who begins to question the regime and becomes involved in a forbidden love affair. 1984 is a chilling exploration of themes such as surveillance, propaganda, and the abuse of power, and has become a classic of 20th-century literature.</p>', '1984', 1),
(8, 'Ender\'s Game', 'book_images/enders-game-childrens-book-635x1024.jpg', '8.49', 75, 0, '<p>In Earth\'s battle against an alien race, Ender Wiggin, a brilliant but troubled young boy, is sent to military training school to lead the fight.</p>', 'enders-game', 2),
(9, 'Pride and Prejudice', 'book_images/pride-and-prejudice.jpg', '7.50', 90, 0, '<p>Elizabeth Bennet, a spirited young woman, resists the charms of Mr. Darcy, a wealthy but arrogant gentleman, until she learns what lies behind his exterior.</p>', 'pride-and-prejudice', 1),
(10, 'The Hunger Games', 'book_images/TheHungerGames-2505709912.jpg', '9.25', 60, 1, '<p>In a dystopian future, Katniss Everdeen volunteers to take her younger sister\'s place in a deadly competition where teenagers must fight to the death.</p>', 'the-hunger-games', 1),
(11, 'Jane Eyre', 'book_images/9780571337095-2182509164.jpg', '6.75', 110, 0, '<p>Jane Eyre, an orphan raised in a harsh boarding school, goes on to become a governess for a mysterious and brooding man named Mr. Rochester.</p>', 'jane-eyre', 1),
(12, 'The Catcher in the Rye', 'book_images/the-catcher-in-the-rye_6utReaR.jpg', '8.99', 55, 0, '<p>Holden Caulfield, a cynical teenager, is expelled from boarding school and embarks on a journey through New York City, reflecting on life, love, and alienation.</p>', 'the-catcher-in-the-rye', 1),
(13, 'Persuasion', 'book_images/persuasion-9781625584908_hr-2561516289.jpg', '7.25', 80, 1, '<p>Eight years after being persuaded to break off her engagement with Frederick Wentworth, Anne Elliot is given a second chance at love when he returns.</p>', 'persuasion', 1),
(14, 'Tôi tự học', 'book_images/seller-view.png', '18.70', 7, 1, '<p>jlsdjflksdflsjdfldk</p>', 'toi-tu-hoc', 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_book_author`
--

CREATE TABLE `book_book_author` (
  `id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `author_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_book_author`
--

INSERT INTO `book_book_author` (`id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 3),
(7, 7, 4),
(8, 8, 5),
(9, 9, 6),
(10, 10, 7),
(11, 11, 8),
(12, 12, 9),
(13, 13, 6),
(19, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `book_book_genre`
--

CREATE TABLE `book_book_genre` (
  `id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_book_genre`
--

INSERT INTO `book_book_genre` (`id`, `book_id`, `genre_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 5, 12),
(7, 6, 3),
(8, 6, 7),
(9, 7, 2),
(10, 7, 6),
(11, 7, 17),
(13, 8, 2),
(14, 8, 6),
(15, 9, 4),
(16, 9, 7),
(17, 10, 2),
(18, 10, 24),
(19, 11, 4),
(20, 11, 7),
(21, 12, 4),
(22, 12, 6),
(23, 13, 4),
(24, 13, 7),
(25, 14, 2),
(26, 14, 3),
(27, 14, 7);

-- --------------------------------------------------------

--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_genre`
--

INSERT INTO `book_genre` (`id`, `name`) VALUES
(1, 'Fantasy'),
(2, 'Science Fiction'),
(3, 'Mystery'),
(4, 'Romance'),
(5, 'Horror'),
(6, 'Thriller'),
(7, 'Historical Fiction'),
(8, 'Non-Fiction'),
(9, 'Biography'),
(10, 'Autobiography'),
(11, 'Young Adult'),
(12, 'Children\'s Literature'),
(13, 'Poetry'),
(14, 'Drama'),
(15, 'Graphic Novel'),
(16, 'Travel'),
(17, 'Philosophy'),
(18, 'Business'),
(19, 'Self-Help'),
(20, 'Cookbooks'),
(21, 'Science Fiction Romance'),
(22, 'Cozy Mystery'),
(23, 'Historical Romance'),
(24, 'Dystopian'),
(25, 'Bildungsroman');

-- --------------------------------------------------------

--
-- Table structure for table `book_review`
--

CREATE TABLE `book_review` (
  `id` bigint NOT NULL,
  `rating` int NOT NULL,
  `book_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `review` longtext,
  `date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_review`
--

INSERT INTO `book_review` (`id`, `rating`, `book_id`, `user_id`, `review`, `date`) VALUES
(1, 5, 8, 1, NULL, '2024-04-15 14:00:18.749702'),
(2, 4, 7, 1, NULL, '2024-04-15 14:07:58.376652'),
(3, 4, 4, 1, '\r\n                                                    ksdflsdkj', '2024-04-15 14:16:03.908247'),
(4, 1, 3, 1, NULL, '2024-04-15 14:17:26.526467'),
(5, 5, 6, 2, 'It is nice, very nice\r\n\r\n                                                    ', '2024-04-15 15:30:13.006462'),
(6, 1, 6, 1, NULL, '2024-04-15 15:30:48.718531');

-- --------------------------------------------------------

--
-- Table structure for table `book_sale`
--

CREATE TABLE `book_sale` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `sale_date` datetime(6) NOT NULL,
  `book_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_sale`
--

INSERT INTO `book_sale` (`id`, `quantity`, `sale_date`, `book_id`) VALUES
(1, 1, '2024-04-15 13:34:00.819386', 7),
(2, 1, '2024-04-15 14:08:02.962689', 7),
(3, 3, '2024-04-15 14:17:41.497999', 2),
(4, 1, '2024-04-15 16:03:23.248166', 4),
(5, 1, '2024-04-16 06:21:54.220229', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cart_cart`
--

CREATE TABLE `cart_cart` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_cart`
--

INSERT INTO `cart_cart` (`id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_cartbook`
--

CREATE TABLE `cart_cartbook` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `book_id` bigint NOT NULL,
  `cart_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_cartbook`
--

INSERT INTO `cart_cartbook` (`id`, `quantity`, `book_id`, `cart_id`) VALUES
(5, 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_customer`
--

CREATE TABLE `customer_customer` (
  `id` bigint NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `img_profile` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_customer`
--

INSERT INTO `customer_customer` (`id`, `address`, `phone`, `img_profile`, `user_id`) VALUES
(1, '123 Main St, Anytown USA', '555-1234', 'customer_images/christopher-campbell-rDEOVtE7vOs-unsplash_ge9NOl3.jpg', 1),
(2, '', '', '', 2),
(3, '', '', '', 3),
(4, '', '', '', 4),
(5, '', '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer_customer_purchased_books`
--

CREATE TABLE `customer_customer_purchased_books` (
  `id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `book_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_seller`
--

CREATE TABLE `customer_seller` (
  `id` bigint NOT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `description` longtext,
  `rating` double NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `revenue` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_seller`
--

INSERT INTO `customer_seller` (`id`, `banner`, `description`, `rating`, `shop_name`, `customer_id`, `revenue`) VALUES
(1, 'seller_banner/banner-books.jpg', 'Great selection of books and fast shipping!', 4.8, 'BookWorm', 1, '57.94'),
(2, 'seller_banner/reading-book-banner.jpg', 'Forever.', 0, 'Read', 2, '100.00'),
(3, 'seller_banner/reading-book-banner_30ki006.jpg', 'Best book collection all of the time.', 0, 'Book Shop', 5, '20.00');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-15 13:41:04.496687', '7', '1984', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(2, '2024-04-15 13:41:14.460672', '6', 'To Kill a Mockingbird', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(3, '2024-04-15 13:41:36.840981', '5', 'Harry Potter and the Philosopher\'s Stone', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(4, '2024-04-15 13:41:51.335202', '4', 'The Return of the King', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(5, '2024-04-15 13:42:12.541991', '3', 'The Two Towers', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(6, '2024-04-15 13:42:40.337773', '2', 'The Fellowship of the Ring', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(7, '2024-04-15 13:42:56.724524', '1', 'The Hobbit', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(8, '2024-04-15 13:57:20.647604', '13', 'Persuasion', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(9, '2024-04-15 13:58:10.063933', '12', 'The Catcher in the Rye', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(10, '2024-04-15 13:58:44.530163', '11', 'Jane Eyre', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 10, 1),
(11, '2024-04-15 13:59:07.600037', '10', 'The Hunger Games', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(12, '2024-04-15 13:59:36.930712', '9', 'Pride and Prejudice', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(13, '2024-04-15 14:00:02.824614', '8', 'Ender\'s Game', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Text\"]}}]', 10, 1),
(14, '2024-04-15 14:08:47.835940', '11', 'Jane Eyre', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(15, '2024-04-15 14:10:32.527680', '9', 'J.D. Salinger', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(16, '2024-04-15 14:11:03.671141', '8', 'Charlotte Bronte', 2, '[{\"changed\": {\"fields\": [\"Bio\", \"Img profile\"]}}]', 7, 1),
(17, '2024-04-15 14:11:37.829770', '7', 'Suzanne Collins', 2, '[{\"changed\": {\"fields\": [\"Bio\", \"Img profile\"]}}]', 7, 1),
(18, '2024-04-15 14:12:54.550795', '6', 'Jane Austen', 2, '[{\"changed\": {\"fields\": [\"Bio\", \"Img profile\"]}}]', 7, 1),
(19, '2024-04-15 14:13:19.706030', '5', 'Orson Scott Card', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(20, '2024-04-15 14:13:47.035592', '4', 'George Orwell', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(21, '2024-04-15 14:14:14.602677', '3', 'Harper Lee', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(22, '2024-04-15 14:15:10.874386', '2', 'J.K. Rowling', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(23, '2024-04-15 14:15:49.486293', '1', 'J.R.R. Tolkien', 2, '[{\"changed\": {\"fields\": [\"Img profile\"]}}]', 7, 1),
(24, '2024-04-15 14:17:03.100153', '1', 'BookWorm', 2, '[{\"changed\": {\"fields\": [\"Banner\"]}}]', 14, 1),
(25, '2024-04-15 15:42:43.632065', '2', 'duchi1', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 1),
(26, '2024-04-15 15:46:25.327714', '8', 'Ender\'s Game', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 10, 1),
(27, '2024-04-15 16:27:48.100642', '1', 'Management For Book', 1, '[{\"added\": {}}]', 3, 1),
(28, '2024-04-15 16:28:02.474441', '2', 'duchi1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(29, '2024-04-16 03:55:03.238261', '3', 'The Two Towers', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 10, 1),
(30, '2024-04-16 04:23:32.789414', '2', 'Read', 2, '[{\"changed\": {\"fields\": [\"Revenue\"]}}]', 14, 1),
(31, '2024-04-16 04:23:38.891995', '3', 'Book Shop', 2, '[{\"changed\": {\"fields\": [\"Revenue\"]}}]', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'author', 'author'),
(10, 'book', 'book'),
(9, 'book', 'genre'),
(11, 'book', 'review'),
(12, 'book', 'sale'),
(15, 'cart', 'cart'),
(16, 'cart', 'cartbook'),
(5, 'contenttypes', 'contenttype'),
(13, 'customer', 'customer'),
(14, 'customer', 'seller'),
(17, 'order', 'order'),
(18, 'order', 'orderbook'),
(8, 'publisher', 'publisher'),
(6, 'sessions', 'session'),
(19, 'wishlist', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-14 14:43:39.111052'),
(2, 'auth', '0001_initial', '2024-04-14 14:43:39.384270'),
(3, 'admin', '0001_initial', '2024-04-14 14:43:39.468568'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-14 14:43:39.479249'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-14 14:43:39.494164'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-14 14:43:39.572653'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-14 14:43:39.609321'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-14 14:43:39.634587'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-14 14:43:39.650864'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-14 14:43:39.690937'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-14 14:43:39.692999'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-14 14:43:39.702387'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-14 14:43:39.742974'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-14 14:43:39.782667'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-14 14:43:39.801637'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-14 14:43:39.813090'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-14 14:43:39.853913'),
(18, 'author', '0001_initial', '2024-04-14 14:43:39.866988'),
(19, 'publisher', '0001_initial', '2024-04-14 14:43:39.878347'),
(20, 'book', '0001_initial', '2024-04-14 14:43:40.166731'),
(21, 'customer', '0001_initial', '2024-04-14 14:43:40.376437'),
(22, 'book', '0002_book_seller', '2024-04-14 14:43:40.442649'),
(23, 'book', '0003_review_review', '2024-04-14 14:43:40.471229'),
(24, 'book', '0004_review_date_alter_review_book_alter_review_user', '2024-04-14 14:43:40.533283'),
(25, 'book', '0005_remove_book_publisher', '2024-04-14 14:43:40.618086'),
(26, 'cart', '0001_initial', '2024-04-14 14:43:40.780889'),
(27, 'customer', '0002_seller_revenue', '2024-04-14 14:43:40.818724'),
(28, 'order', '0001_initial', '2024-04-14 14:43:40.960345'),
(29, 'sessions', '0001_initial', '2024-04-14 14:43:40.984104'),
(30, 'wishlist', '0001_initial', '2024-04-14 14:43:41.065298');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ew79mcrfrluifjreh8ukjqve5r1twdjh', '.eJxVjEEOwiAQRe_C2pACZaQu3fcMZIaZStVAUtqV8e7apAvd_vfef6mI25rj1mSJM6uL8ur0uxGmh5Qd8B3LrepUy7rMpHdFH7TpsbI8r4f7d5Cx5W9tnXiATsgi-x4M9b4j8OIpCJEzkujMw-QYLLqQBAcYEhruQwI7OaPeH-7_OF0:1rwcCy:YxYxLA--BLqFgvxSlZa7sikjzGBKzsJyAfUz35b61-c', '2024-04-30 06:22:20.610364'),
('ipek1sdupd7wrh8d2elqz41l10v2zpce', '.eJxVjDsOwjAQBe_iGll2_A0lPWewdr1rHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSJyFFqffDSE_uO2A7tBus8xzW5cJ5a7Ig3Z5nYmfl8P9O6jQ67c2EDQxOxsHpaIHZhtKcbooa7IJaIKLQISox-BV8YOKo8FifbYOwGfx_gDeOjfS:1rwLnP:VRcumPFKsI5mZHWv0Bc3K7L4Je1WNsjEP71qxSHwso8', '2024-04-29 12:50:51.911452'),
('isxdawaucwwvrrh7iy23g6vbt2vfmv01', '.eJxVjDsOwjAQBe_iGll2_A0lPWewdr1rHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSJyFFqffDSE_uO2A7tBus8xzW5cJ5a7Ig3Z5nYmfl8P9O6jQ67c2EDQxOxsHpaIHZhtKcbooa7IJaIKLQISox-BV8YOKo8FifbYOwGfx_gDeOjfS:1rwOWk:Iu8Z23E-03s4g-LU0adKIZZumWYc-gfG4t27l_uisw0', '2024-04-29 15:45:50.907822');

-- --------------------------------------------------------

--
-- Table structure for table `order_order`
--

CREATE TABLE `order_order` (
  `id` bigint NOT NULL,
  `date` datetime(6) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `customer_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_order`
--

INSERT INTO `order_order` (`id`, `date`, `total`, `customer_id`) VALUES
(1, '2024-04-15 13:34:00.804482', '8.99', 1),
(2, '2024-04-15 14:08:02.944779', '8.99', 1),
(3, '2024-04-15 14:17:41.484914', '29.97', 1),
(4, '2024-04-15 16:03:23.229964', '9.99', 1),
(5, '2024-04-16 06:21:54.209924', '9.99', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_orderbook`
--

CREATE TABLE `order_orderbook` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `book_id` bigint NOT NULL,
  `order_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_orderbook`
--

INSERT INTO `order_orderbook` (`id`, `quantity`, `book_id`, `order_id`) VALUES
(1, 1, 7, 1),
(2, 1, 7, 2),
(3, 3, 2, 3),
(4, 1, 4, 4),
(5, 1, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `publisher_publisher`
--

CREATE TABLE `publisher_publisher` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_wishlist`
--

CREATE TABLE `wishlist_wishlist` (
  `id` bigint NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `book_id` bigint NOT NULL,
  `customer_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author_author`
--
ALTER TABLE `author_author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `book_book`
--
ALTER TABLE `book_book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `book_book_seller_id_fa676dac_fk_customer_seller_id` (`seller_id`);

--
-- Indexes for table `book_book_author`
--
ALTER TABLE `book_book_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_book_author_book_id_author_id_35638b9e_uniq` (`book_id`,`author_id`),
  ADD KEY `book_book_author_author_id_d92c9564_fk_author_author_id` (`author_id`);

--
-- Indexes for table `book_book_genre`
--
ALTER TABLE `book_book_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_book_genre_book_id_genre_id_24acc622_uniq` (`book_id`,`genre_id`),
  ADD KEY `book_book_genre_genre_id_472c036d_fk_book_genre_id` (`genre_id`);

--
-- Indexes for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_review`
--
ALTER TABLE `book_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_review_book_id_71969f4f_fk_book_book_id` (`book_id`),
  ADD KEY `book_review_user_id_0899f750_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `book_sale`
--
ALTER TABLE `book_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_sale_book_id_14462f7a_fk_book_book_id` (`book_id`);

--
-- Indexes for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_cartbook`
--
ALTER TABLE `cart_cartbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cartbook_book_id_222d84b6_fk_book_book_id` (`book_id`),
  ADD KEY `cart_cartbook_cart_id_03d93669_fk_cart_cart_id` (`cart_id`);

--
-- Indexes for table `customer_customer`
--
ALTER TABLE `customer_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `customer_customer_purchased_books`
--
ALTER TABLE `customer_customer_purchased_books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_customer_purcha_customer_id_book_id_ca7407c2_uniq` (`customer_id`,`book_id`),
  ADD KEY `customer_customer_pu_book_id_c8f02107_fk_book_book` (`book_id`);

--
-- Indexes for table `customer_seller`
--
ALTER TABLE `customer_seller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `order_order`
--
ALTER TABLE `order_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_order_customer_id_5bbbd957_fk_customer_customer_id` (`customer_id`);

--
-- Indexes for table `order_orderbook`
--
ALTER TABLE `order_orderbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_orderbook_book_id_40007fcf_fk_book_book_id` (`book_id`),
  ADD KEY `order_orderbook_order_id_8652d93b_fk_order_order_id` (`order_id`);

--
-- Indexes for table `publisher_publisher`
--
ALTER TABLE `publisher_publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_wishlist`
--
ALTER TABLE `wishlist_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_wishlist_book_id_3783baf4_fk_book_book_id` (`book_id`),
  ADD KEY `wishlist_wishlist_customer_id_8a7d30ff_fk_customer_customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author_author`
--
ALTER TABLE `author_author`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book_book`
--
ALTER TABLE `book_book`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `book_book_author`
--
ALTER TABLE `book_book_author`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `book_book_genre`
--
ALTER TABLE `book_book_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `book_review`
--
ALTER TABLE `book_review`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_sale`
--
ALTER TABLE `book_sale`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_cart`
--
ALTER TABLE `cart_cart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_cartbook`
--
ALTER TABLE `cart_cartbook`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_customer`
--
ALTER TABLE `customer_customer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_customer_purchased_books`
--
ALTER TABLE `customer_customer_purchased_books`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_seller`
--
ALTER TABLE `customer_seller`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_order`
--
ALTER TABLE `order_order`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_orderbook`
--
ALTER TABLE `order_orderbook`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `publisher_publisher`
--
ALTER TABLE `publisher_publisher`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_wishlist`
--
ALTER TABLE `wishlist_wishlist`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `book_book`
--
ALTER TABLE `book_book`
  ADD CONSTRAINT `book_book_seller_id_fa676dac_fk_customer_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `customer_seller` (`id`);

--
-- Constraints for table `book_book_author`
--
ALTER TABLE `book_book_author`
  ADD CONSTRAINT `book_book_author_author_id_d92c9564_fk_author_author_id` FOREIGN KEY (`author_id`) REFERENCES `author_author` (`id`),
  ADD CONSTRAINT `book_book_author_book_id_a2a4a10d_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`);

--
-- Constraints for table `book_book_genre`
--
ALTER TABLE `book_book_genre`
  ADD CONSTRAINT `book_book_genre_book_id_1e5a3ea9_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_book_genre_genre_id_472c036d_fk_book_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `book_genre` (`id`);

--
-- Constraints for table `book_review`
--
ALTER TABLE `book_review`
  ADD CONSTRAINT `book_review_book_id_71969f4f_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_review_user_id_0899f750_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `book_sale`
--
ALTER TABLE `book_sale`
  ADD CONSTRAINT `book_sale_book_id_14462f7a_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`);

--
-- Constraints for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_user_id_9b4220b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_cartbook`
--
ALTER TABLE `cart_cartbook`
  ADD CONSTRAINT `cart_cartbook_book_id_222d84b6_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `cart_cartbook_cart_id_03d93669_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`);

--
-- Constraints for table `customer_customer`
--
ALTER TABLE `customer_customer`
  ADD CONSTRAINT `customer_customer_user_id_549f4343_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `customer_customer_purchased_books`
--
ALTER TABLE `customer_customer_purchased_books`
  ADD CONSTRAINT `customer_customer_pu_book_id_c8f02107_fk_book_book` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `customer_customer_pu_customer_id_d3b41c13_fk_customer_` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`);

--
-- Constraints for table `customer_seller`
--
ALTER TABLE `customer_seller`
  ADD CONSTRAINT `customer_seller_customer_id_82aa8401_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `order_order`
--
ALTER TABLE `order_order`
  ADD CONSTRAINT `order_order_customer_id_5bbbd957_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`);

--
-- Constraints for table `order_orderbook`
--
ALTER TABLE `order_orderbook`
  ADD CONSTRAINT `order_orderbook_book_id_40007fcf_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `order_orderbook_order_id_8652d93b_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`);

--
-- Constraints for table `wishlist_wishlist`
--
ALTER TABLE `wishlist_wishlist`
  ADD CONSTRAINT `wishlist_wishlist_book_id_3783baf4_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `wishlist_wishlist_customer_id_8a7d30ff_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
