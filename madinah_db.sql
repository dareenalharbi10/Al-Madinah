-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 04:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `madinah_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_ur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `name_ur`) VALUES
(1, 'Religious Sites', 'الأماكن الدينية', 'مذہبی مقامات'),
(3, 'Cafes and Restaurant', 'المقاهي و المطاعم', 'کیفے وریستوراں');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_ur` varchar(255) NOT NULL,
  `description_en` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `description_ur` text DEFAULT NULL,
  `location_link` varchar(500) DEFAULT NULL,
  `social_link` varchar(500) DEFAULT NULL,
  `image_path1` varchar(255) DEFAULT NULL,
  `image_path2` varchar(255) DEFAULT NULL,
  `image_path3` varchar(255) DEFAULT NULL,
  `image_path4` varchar(255) DEFAULT NULL,
  `image_path5` varchar(255) DEFAULT NULL,
  `image_path6` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `category_id`, `name_en`, `name_ar`, `name_ur`, `description_en`, `description_ar`, `description_ur`, `location_link`, `social_link`, `image_path1`, `image_path2`, `image_path3`, `image_path4`, `image_path5`, `image_path6`) VALUES
(9, 1, 'Al-Masjid an-Nabawi', 'الحرم النبوي الشريف', 'مسجد نبوی', 'The Prophet\'s Mosque in Madinah, the second holiest site in Islam, built by Prophet Muhammad (PBUH).', 'المسجد النبوي الشريف في المدينة المنورة، ثاني أقدس مواقع الإسلام، بناه النبي محمد صلى الله عليه وسلم.', 'مسجد نبوی مدینہ منورہ میں واقع ہے، اسلام کا دوسرا مقدس ترین مقام۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d286c2cfefa.jpeg', 'uploads/places/place_2_69d286c2d0424.jpeg', 'uploads/places/place_3_69d286c2d08cf.jpeg', 'uploads/places/place_4_69d286c2d0d0a.jpeg', 'uploads/places/place_5_69d286c2d11da.jpeg', 'uploads/places/place_6_69d286c2d18d7.jpeg'),
(10, 1, 'Masjid Quba', 'مسجد قباء', 'مسجد قبا', 'The first mosque ever built in Islam, constructed by the Prophet Muhammad (PBUH) upon his arrival to Madinah.', 'أول مسجد بُني في الإسلام، أسسه النبي محمد صلى الله عليه وسلم عند وصوله إلى المدينة المنورة.', 'اسلام کی تاریخ میں بنایا گیا پہلا مسجد، جو نبی کریم ﷺ نے مدینہ پہنچنے پر تعمیر کیا۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d288560dba9.jpeg', 'uploads/places/place_2_69d288560dfa1.jpeg', 'uploads/places/place_3_69d288560e323.jpeg', '', '', NULL),
(11, 1, 'Masjid Al-Qiblatain', 'مسجد القبلتين', 'مسجد قبلتین', 'The Mosque of the Two Qiblas, where the Quran\'s verse changing the direction of prayer from Jerusalem to Makkah was revealed.', 'مسجد القبلتين، المكان الذي نزلت فيه الآية الكريمة بتحويل القبلة من بيت المقدس إلى مكة المكرمة.', 'دو قبلوں کی مسجد، جہاں قبلہ بیت المقدس سے مکہ مکرمہ کی طرف تبدیل کرنے کی قرآنی آیت نازل ہوئی۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d2889c6c542.jpeg', 'uploads/places/place_2_69d2889c6c94b.jpeg', 'uploads/places/place_3_69d2889c6ccd8.jpeg', NULL, NULL, NULL),
(12, 1, 'Madinah City Center', 'وسط المدينة المنورة', 'مدینہ کا وسط', 'The central area of Madinah, surrounding the Prophet\'s Mosque with hotels, markets, and historical landmarks.', 'المنطقة المركزية في المدينة المنورة، المحيطة بالمسجد النبوي بفنادقها وأسواقها ومعالمها التاريخية.', 'مدینہ منورہ کا مرکزی علاقہ، جو مسجد نبوی کے گردا گرد ہوٹلوں، بازاروں اور تاریخی مقامات پر مشتمل ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d288f9339b1.jpeg', 'uploads/places/place_2_69d288f933cfe.jpeg', 'uploads/places/place_3_69d288f933fca.jpeg', 'uploads/places/place_4_69d288f93468b.jpeg', NULL, NULL),
(13, 1, 'Haram Library', 'مكتبة الحرم النبوي', 'حرم لائبریری', 'The official library of the Prophet\'s Mosque, containing rare Islamic manuscripts and books.', 'المكتبة الرسمية للمسجد النبوي الشريف، تضم مخطوطات إسلامية نادرة وكتباً قيّمة.', 'مسجد نبوی کی سرکاری لائبریری، جس میں نادر اسلامی مخطوطات اور کتابیں موجود ہیں۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d2892208c19.jpeg', 'uploads/places/place_2_69d2892208fe6.jpeg', NULL, NULL, NULL, NULL),
(14, 1, 'Mount Ayr', 'جبل عير', 'جبل عیر', 'A historically significant mountain in Madinah, mentioned in Islamic tradition as a boundary of the sacred land.', 'جبل تاريخي في المدينة المنورة، ذُكر في التراث الإسلامي باعتباره أحد حدود الأرض المقدسة.', 'مدینہ منورہ کا ایک تاریخی پہاڑ، جو اسلامی روایات میں مقدس سرزمین کی حد کے طور پر مذکور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28c0650c02.jpeg', 'uploads/places/place_2_69d28c0650fe4.jpeg', NULL, NULL, NULL, NULL),
(15, 1, 'Al-Safia Museum', 'متحف الصافية', 'الصافیہ میوزیم', 'A heritage museum in Madinah showcasing the history and culture of the city and the Hijaz region.', 'متحف تراثي في المدينة المنورة يعرض تاريخ وثقافة المدينة ومنطقة الحجاز.', 'مدینہ منورہ میں ایک ورثہ میوزیم جو شہر اور حجاز کی تاریخ اور ثقافت کو پیش کرتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28c405dde3.jpeg', 'uploads/places/place_2_69d28c405e1f1.jpeg', 'uploads/places/place_3_69d28c405e587.jpeg', 'uploads/places/place_4_69d28c405e989.jpeg', NULL, NULL),
(16, 1, 'Hejaz Railway Museum', 'متحف سكة حديد الحجاز', 'حجاز ریلوے میوزیم', 'A museum dedicated to the historical Hejaz Railway, an Ottoman-era railroad that connected Damascus to Madinah.', 'متحف مخصص لسكة حديد الحجاز التاريخية، خط السكك الحديدية العثماني الذي كان يربط دمشق بالمدينة المنورة.', 'حجاز ریلوے کو وقف ایک میوزیم، جو دمشق سے مدینہ منورہ کو جوڑنے والی عثمانی دور کی ریل سروس تھی۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28c89b8c9c.jpeg', 'uploads/places/place_2_69d28c89b9062.jpeg', 'uploads/places/place_3_69d28c89b9427.jpeg', NULL, NULL, NULL),
(17, 1, 'Al-Mattal Viewpoint', 'المطل', 'المطل ویو پوائنٹ', 'A scenic viewpoint in Madinah offering panoramic views of the city and surrounding landscape.', 'موقع إطلالة مميز في المدينة المنورة يوفر مناظر بانورامية للمدينة والمشهد المحيط بها.', 'مدینہ منورہ میں ایک خوبصورت مقام جہاں سے شہر اور اس کے گرد و نواح کا پینورامک منظر دکھائی دیتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28cb4e119c.jpeg', 'uploads/places/place_2_69d28cb4e14ee.jpeg', 'uploads/places/place_3_69d28cb4e1849.jpeg', NULL, NULL, NULL),
(18, 1, 'Central District', 'المنطقة المركزية', 'مرکزی ضلع', 'The central district of Madinah encompassing the main religious and commercial areas of the city.', 'المنطقة المركزية في المدينة المنورة التي تضم المناطق الدينية والتجارية الرئيسية.', 'مدینہ منورہ کا مرکزی ضلع جو شہر کے اہم مذہبی اور تجارتی علاقوں پر مشتمل ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28cd8b3eb5.jpeg', 'uploads/places/place_2_69d28cd8b4349.jpeg', 'uploads/places/place_3_69d28cd8b46e1.jpeg', NULL, NULL, NULL),
(19, 1, 'Bustan Al-Mustadhill', 'بستان المستظل', 'بستان المستظل', 'A scenic natural garden and rest area in Madinah known for its palm trees and serene environment.', 'حديقة طبيعية جميلة ومنطقة استراحة في المدينة المنورة تشتهر بأشجار النخيل وأجوائها الهادئة.', 'مدینہ منورہ میں ایک قدرتی باغ اور آرام کی جگہ جو کھجور کے درختوں اور پرسکون ماحول کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d28cfca5d46.jpeg', 'uploads/places/place_2_69d28cfca602d.jpeg', 'uploads/places/place_3_69d28cfca64bf.jpeg', NULL, NULL, NULL),
(20, 1, 'Maqsad Quba', 'مقصد قباء', 'مقصد قباء', 'A heritage destination near Masjid Quba combining religious tourism with cultural and historical experiences.', 'وجهة تراثية قرب مسجد قباء تجمع بين السياحة الدينية والتجارب الثقافية والتاريخية.', 'مسجد قباء کے قریب ایک ورثہ مقام جو مذہبی سیاحت کے ساتھ ثقافتی اور تاریخی تجربات کو یکجا کرتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d2928d84253.jpeg', 'uploads/places/place_2_69d2928d8464f.jpeg', 'uploads/places/place_3_69d2928d8498c.jpeg', 'uploads/places/place_4_69d2928d84d0b.jpeg', NULL, NULL),
(21, 1, 'Mount Uhud', 'جبل أحد', 'جبل احد', 'The famous mountain where the Battle of Uhud took place in 625 CE. A significant Islamic historical site.', 'الجبل الشهير الذي دارت عنده غزوة أحد عام 625م. موقع تاريخي إسلامي بالغ الأهمية.', 'وہ مشہور پہاڑ جہاں 625ء میں غزوہ احد ہوئی۔ ایک نہایت اہم اسلامی تاریخی مقام۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', NULL, 'uploads/places/place_1_69d292b8d4332.jpeg', 'uploads/places/place_2_69d292b8d4aad.jpeg', 'uploads/places/place_3_69d292b8d4f0e.jpeg', NULL, NULL, NULL),
(22, 3, 'Al-Marbad Farm Cafe', 'كافيه المربد', 'المربد کیفے', 'A charming cafe and farm experience in Madinah set amidst lush palm gardens with specialty coffee and relaxing ambiance.', 'كافيه ومزرعة ساحرة في المدينة المنورة وسط بساتين النخيل الخضراء، تقدم قهوة مختصة وأجواء مريحة.', 'مدینہ منورہ میں ایک دلکش کیفے اور فارم تجربہ، کھجور کے باغوں کے درمیان، اسپیشلٹی کافی اور پرسکون ماحول کے ساتھ۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', '', 'uploads/places/place_1_69d292f0895b0.jpeg', 'uploads/places/place_2_69d292f089981.jpeg', 'uploads/places/place_3_69d292f089ccd.jpeg', NULL, NULL, NULL),
(23, 3, 'Uncle Sadiq Restaurant', 'مطعم عم صادق', 'انکل صادق ریستوران', 'A popular traditional breakfast restaurant in Madinah known for its Egyptian and Saudi dishes in a quiet family-friendly setting.', 'مطعم فطور شعبي في المدينة المنورة يشتهر بأطباقه المصرية والسعودية في أجواء هادئة مناسبة للعائلات.', 'مدینہ منورہ میں ایک مقبول روایتی ناشتے کا ریستوران جو مصری اور سعودی کھانوں کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/sadeg.ksa/', 'uploads/places/place_1_69d29302d7f84.jpeg', 'uploads/places/place_2_69d2934e5b707.jpeg', 'uploads/places/place_3_69d2934e5baf3.jpeg', NULL, NULL, NULL),
(24, 3, 'Dopamine Cafe', 'دوبامين كافيه', 'ڈوپامین کیفے', 'A specialty coffee cafe in Madinah known for its distinctive coffee blends and modern atmosphere.', 'كافيه قهوة مختصة في المدينة المنورة يشتهر بمزيجاته المميزة من القهوة وأجوائه العصرية.', 'مدینہ منورہ میں ایک اسپیشلٹی کافی کیفے جو منفرد کافی بلینڈز اور جدید ماحول کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/dopeamine_sa/', 'uploads/places/place_1_69d2937cc45bf.jpeg', 'uploads/places/place_2_69d2937cc496d.jpeg', 'uploads/places/place_3_69d2937cc4d02.jpeg', NULL, NULL, NULL),
(25, 3, 'Feel Cafe', 'فيل كافيه', 'فیل کیفے', 'A cozy cafe in Madinah offering specialty coffee and a relaxing environment for residents and visitors.', 'كافيه دافئ في المدينة المنورة يقدم قهوة مختصة وبيئة مريحة للمقيمين والزوار.', 'مدینہ منورہ میں ایک آرام دہ کیفے جو اسپیشلٹی کافی اور پرسکون ماحول فراہم کرتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', '', 'uploads/places/place_1_69d293cdbd0e8.jpeg', 'uploads/places/place_2_69d293cdbd630.jpeg', 'uploads/places/place_3_69d293cdbd97f.jpeg', 'uploads/places/place_4_69d293cdbdcc9.jpeg', 'uploads/places/place_5_69d293cdbdff3.jpeg', 'uploads/places/place_6_69d293cdbe2c5.jpeg'),
(26, 3, 'Namq Cafe', 'نمق كافيه', 'نامق کیفے', 'A well-known specialty coffee chain with a branch in Madinah at Sultanah area, famous for its cakes and quality coffee.', 'سلسلة قهوة مختصة شهيرة لها فرع في المدينة المنورة بمنطقة سلطانة، تشتهر بكيكاتها وجودة قهوتها.', 'ایک مشہور اسپیشلٹی کافی چین جس کی مدینہ منورہ کے سلطانہ علاقے میں شاخ ہے، کیک اور معیاری کافی کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/namq_cafe/', 'uploads/places/place_1_69d293f2951fa.jpeg', 'uploads/places/place_2_69d293f29558c.jpeg', 'uploads/places/place_3_69d293f295933.jpeg', NULL, NULL, NULL),
(27, 3, 'Breehant Roastery', 'بريهانت محمصة وكافيه', 'بریہانت روسٹری', 'An African-inspired Saudi specialty coffee roastery with a branch in Madinah (Sultanah area), known for its unique single-origin beans.', 'محمصة قهوة سعودية بطابع إفريقي لها فرع في المدينة المنورة (سلطانة)، تشتهر بمحاصيلها الفريدة من مصادر مفردة.', 'افریقی الہام سے متاثر سعودی اسپیشلٹی کافی روسٹری، مدینہ منورہ (سلطانہ) میں شاخ کے ساتھ، منفرد سنگل-اوریجن بینز کے لیے مشہور۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/breehant_sa/', 'uploads/places/place_1_69d2941a588e7.jpeg', 'uploads/places/place_2_69d2941a58cd1.jpeg', 'uploads/places/place_3_69d2941a59068.jpeg', NULL, NULL, NULL),
(28, 3, 'Ecleel Bakery & Cafe', 'اكليل بيكري وكافيه', 'اکلیل بیکری اور کیفے', 'A bakery and cafe in Madinah celebrated for its artisan pastries, croissants, and specialty coffee drinks.', 'مخبز وكافيه في المدينة المنورة يُحتفى به بمعجناته الحرفية وكرواسانه وقهوته المختصة.', 'مدینہ منورہ میں ایک بیکری اور کیفے جو آرٹیزن پیسٹری، کروسان اور اسپیشلٹی کافی کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/ecleelcafe/', 'uploads/places/place_1_69d2943fd33a4.jpeg', 'uploads/places/place_2_69d2943fd3855.jpeg', 'uploads/places/place_3_69d2943fd3ce8.jpeg', NULL, NULL, NULL),
(29, 3, 'ROW Cafe', 'رو كافيه', 'رو کیفے', 'A popular specialty coffee brand with multiple branches in Madinah, known for its matcha, Spanish latte, and cozy farm branch.', 'علامة قهوة مختصة شهيرة لها عدة فروع في المدينة المنورة، تشتهر بالماتشا واللاتيه الإسباني وفرعها الريفي المميز.', 'ایک مقبول اسپیشلٹی کافی برانڈ جس کی مدینہ منورہ میں متعدد شاخیں ہیں، ماچا، اسپینش لاتے اور فارم برانچ کے لیے مشہور۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/rowcafe.sa/', 'uploads/places/place_1_69d294717aa2b.jpeg', 'uploads/places/place_2_69d294717ae4a.jpeg', 'uploads/places/place_3_69d294717b1ae.jpeg', NULL, NULL, NULL),
(30, 3, 'Aal-Raseef Cafe', 'عالرصيف كافيه', 'عال رصیف کیفے', 'An original Madinah cafe brand inspired by nostalgic street-side sitting, serving specialty coffee and traditional sweets.', 'ماركة كافيه مدينية أصيلة مستوحاة من الجلوس على الرصيف في الزمن القديم، تقدم قهوة مختصة وحلويات تراثية.', 'ایک اصیل مدنی کیفے برانڈ جو پرانے زمانے کی فٹ پاتھ پر بیٹھنے کی روایت سے متاثر ہے، اسپیشلٹی کافی اور روایتی مٹھائیاں پیش کرتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/3alraseef.sa/', 'uploads/places/place_1_69d2949ab9580.jpeg', 'uploads/places/place_2_69d2949ab9ba1.jpeg', 'uploads/places/place_3_69d2949aba4b1.jpeg', NULL, NULL, NULL),
(31, 3, 'Onde Roastery', 'اوندي محمصة وكافيه', 'اونڈی روسٹری', 'A specialty coffee roastery based in Madinah, offering freshly roasted beans and expertly brewed coffee.', 'محمصة قهوة مختصة في المدينة المنورة تقدم حبوباً محمصة طازجة وقهوة محضرة باحترافية.', 'مدینہ منورہ میں ایک اسپیشلٹی کافی روسٹری، تازہ بھنی ہوئی بینز اور ماہرانہ طریقے سے تیار کافی پیش کرتی ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/onde.sa/', 'uploads/places/place_1_69d294bab40b2.jpeg', 'uploads/places/place_2_69d294bab44d7.jpeg', 'uploads/places/place_3_69d294bab48c6.jpeg', NULL, NULL, NULL),
(32, 3, 'Faseel Cafe', 'فسيل كافيه', 'فصیل کیفے', 'A specialty coffee cafe in Madinah set in a natural environment, offering quality coffee amidst green surroundings.', 'كافيه قهوة مختصة في المدينة المنورة في بيئة طبيعية، يقدم قهوة عالية الجودة وسط أجواء خضراء مميزة.', 'مدینہ منورہ میں ایک اسپیشلٹی کافی کیفے جو قدرتی ماحول میں واقع ہے، سبز ماحول کے درمیان معیاری کافی پیش کرتا ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/faseel.cafe/', 'uploads/places/place_1_69d294e4ba404.jpeg', 'uploads/places/place_2_69d294e4ba8ff.jpeg', 'uploads/places/place_3_69d294e4bada4.jpeg', NULL, NULL, NULL),
(33, 3, 'Forty Four X Cafe', 'فورتي فور اكس كافيه', 'فورٹی فور ایکس کیفے', 'A specialty coffee cafe chain with branches in Madinah (Sultanah & Al-Salam areas), known for French toast and iced tea.', 'سلسلة كافيه قهوة مختصة لها فروع في المدينة المنورة (سلطانة والسلام)، تشتهر بالفرنش توست والآيس تي.', 'ایک اسپیشلٹی کافی چین جس کی مدینہ منورہ (سلطانہ اور السلام) میں شاخیں ہیں، فرنچ ٹوسٹ اور آئسڈ ٹی کے لیے مشہور ہے۔', 'https://maps.app.goo.gl/RRoBwkjCGuKw31Ey7', 'https://www.instagram.com/specialtycoffee44/', 'uploads/places/place_1_69d2950ede650.jpeg', 'uploads/places/place_2_69d2950edea4f.jpeg', 'uploads/places/place_3_69d2950edee14.jpeg', NULL, NULL, NULL),
(34, 3, 'Coffematics', 'كوفيماتكس كافيه', 'کوفی میٹکس کیفے', 'Your cafe as it should be — a Madinah-based specialty coffee destination with a distinct identity and quality experience.', 'كافيهك كما يجب أن يكون — وجهة قهوة مختصة من المدينة المنورة بهوية مميزة وتجربة راقية.', 'آپ کا کیفے جیسا ہونا چاہیے — مدینہ منورہ کا اسپیشلٹی کافی مقام جس کی منفرد شناخت اور معیاری تجربہ ہے۔', 'https://maps.app.goo.gl/kJj5Bga5MqMvUPE57', 'https://www.instagram.com/coffematics/', 'uploads/places/place_1_69d2955683bd1.jpeg', 'uploads/places/place_2_69d2955683f47.jpeg', 'uploads/places/place_3_69d29556842b3.jpeg', 'uploads/places/place_4_69d295568471e.jpeg', 'uploads/places/place_5_69d2955684c73.jpeg', 'uploads/places/place_6_69d2955685024.jpeg'),
(35, 3, 'Taqmera Cafe & Bakery', 'تقميرة مقهى ومخبز', 'تقمیرہ کیفے و بیکری', 'A unique Madinah heritage cafe and bakery inside an 80-year-old traditional house in Hay Al-Mughaisalah, known for Hijazi breakfast.', 'كافيه ومخبز مديني فريد داخل منزل تراثي عمره 80 عاماً في حي المغيسلة، يشتهر بالفطور الحجازي الأصيل.', 'مدینہ منورہ کا ایک انوکھا ورثہ کیفے اور بیکری، حی المغیسلہ میں 80 سال پرانے روایتی گھر میں، حجازی ناشتے کے لیے مشہور۔', 'https://maps.app.goo.gl/Z8EpQYuoaCYpVeXd6', 'https://www.instagram.com/taqmera/', 'uploads/places/place_1_69d29577984f4.jpeg', 'uploads/places/place_2_69d29577988bc.jpeg', 'uploads/places/place_3_69d2957798c6d.jpeg', NULL, NULL, NULL),
(36, 3, 'Etruh Cafe', 'عطره كافيه', 'عطرہ کیفے', 'A heritage tea and coffee cafe from the alleys of Quba Street in Madinah, serving aromatic herbal teas and traditional Madinah sweets.', 'كافيه شاي وقهوة تراثي من أزقة شارع قباء في المدينة المنورة، يقدم شاي عطري بالأعشاب وحلويات مدينية تقليدية.', 'مدینہ منورہ کے قباء اسٹریٹ کی گلیوں سے ایک ورثہ چائے اور کافی کیفے، خوشبودار جڑی بوٹی چائے اور روایتی مدنی مٹھائیاں پیش کرتا ہے۔', 'https://maps.app.goo.gl/qjJtK4E7B7rKF7uG7', 'https://www.instagram.com/etruh_cafe/', 'uploads/places/place_1_69d295a46fd05.jpeg', 'uploads/places/place_2_69d295a4700e6.jpeg', 'uploads/places/place_3_69d295a4704fd.jpeg', NULL, NULL, NULL),
(37, 3, 'Zaman Stee Cafe', 'زمان ستي كافيه', 'زمان ستی کیفے', 'A cozy nostalgic cafe in Madinah that opens from 5 PM to 3:30 AM, offering a warm traditional atmosphere.', 'كافيه دافئ ذو طابع نوستالجي في المدينة المنورة يفتح من 5 مساءً حتى 3:30 صباحاً بأجواء تراثية دافئة.', 'مدینہ منورہ میں ایک آرام دہ پرانے دور کا کیفے جو شام 5 بجے سے صبح 3:30 بجے تک کھلا رہتا ہے۔', 'https://maps.app.goo.gl/MaNb5FT3uT5nDAKG9', 'https://www.instagram.com/zaman_stee/', 'uploads/places/place_1_69d295be45753.jpeg', 'uploads/places/place_2_69d295be45d79.jpeg', NULL, NULL, NULL, NULL),
(38, 3, 'Yathrib Kitchens', 'مطابخ يثرب', 'یثرب کچنز', 'A traditional Madinah restaurant and kitchen concept serving authentic Hijazi food in a heritage setting.', 'مطبخ ومطعم مديني تراثي يقدم الطعام الحجازي الأصيل في أجواء تراثية مميزة.', 'روایتی مدنی ریستوران اور باورچی خانہ جو ورثہ ماحول میں اصیل حجازی کھانے پیش کرتا ہے۔', 'https://maps.app.goo.gl/pCZq4GWVkxuK3v4J7', 'https://www.instagram.com/yathrib.restaurant/', 'uploads/places/place_1_69d295db2ff15.jpeg', 'uploads/places/place_2_69d295db30e0f.jpeg', 'uploads/places/place_3_69d295db31288.jpeg', NULL, NULL, NULL),
(39, 3, 'To\'mah', 'طُعمة', 'طُعمہ', 'A Madinah restaurant dedicated to authentic traditional Madinah food, celebrating the culinary heritage of the city.', 'مطعم مديني متخصص في الطعام التقليدي الأصيل، يحتفي بالتراث الطهوي للمدينة المنورة.', 'مدینہ منورہ کا ایک ریستوران جو روایتی مدنی کھانوں کا جشن مناتا ہے، شہر کے پکوانی ورثے کی حفاظت کرتا ہے۔', 'https://maps.app.goo.gl/VqkHPFmWZpQTfHSF8', 'https://www.instagram.com/tomah.sa/', 'uploads/places/place_1_69d295f29c2b3.jpeg', 'uploads/places/place_2_69d295f29d0e9.jpeg', 'uploads/places/place_3_69d295f29d77e.jpeg', NULL, NULL, NULL),
(40, 3, 'Saaf Cafe', 'سعف كافيه', 'صاف کیفے', 'A specialty coffee cafe in Madinah where authenticity meets specialty coffee, offering a comfortable work and relaxation environment.', 'كافيه قهوة مختصة في المدينة المنورة حيث تلتقي الأصالة بالقهوة المختصة، في بيئة مريحة للعمل والاسترخاء.', 'مدینہ منورہ میں ایک اسپیشلٹی کافی کیفے جہاں اصالت اور اسپیشلٹی کافی ملتے ہیں، کام اور آرام کے لیے آرام دہ ماحول۔', 'https://maps.app.goo.gl/Yb1sJbK9eFcH2XKa8', 'https://www.instagram.com/saaf.cafe/', 'uploads/places/place_1_69d29605d15ac.jpeg', 'uploads/places/place_2_69d29605d1974.jpeg', 'uploads/places/place_3_69d29605d1d09.jpeg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'testuser', 'test@gmail.com', '$2y$10$Q1riW5pt9GGGNnYq6Ko/dO.QG/TR3vbe/JnQRTREx0klYqxuwLKIe', 'user', '2026-04-24 22:52:09'),
(2, 'admin', 'admin@gmail.com', '$2y$10$xpLRKOpnyp9Pb04wbpl4yOO8MWUNQ1PfT80MGh7g2N4WtOk7.0khq', 'admin', '2026-04-24 23:09:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
