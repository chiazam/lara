-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lara
CREATE DATABASE IF NOT EXISTS `lara` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lara`;

-- Dumping structure for table lara.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table lara.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.migrations: ~5 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_06_12_182258_create_news_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table lara.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `link` longtext COLLATE utf8mb4_unicode_ci,
  `imgsrc` longtext COLLATE utf8mb4_unicode_ci,
  `imgalt` longtext COLLATE utf8mb4_unicode_ci,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `tagname` longtext COLLATE utf8mb4_unicode_ci,
  `taglink` longtext COLLATE utf8mb4_unicode_ci,
  `author` longtext COLLATE utf8mb4_unicode_ci,
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `sourceid` longtext COLLATE utf8mb4_unicode_ci,
  `date` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.news: ~220 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
REPLACE INTO `news` (`id`, `title`, `link`, `imgsrc`, `imgalt`, `summary`, `tagname`, `taglink`, `author`, `source`, `sourceid`, `date`, `created_at`, `updated_at`) VALUES
	(291, 'Defiant Trump flies home after not guilty plea', 'https://www.bbc.com/news/live/world-us-canada-65883731', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/12CEE/production/_130083077_gettyimages-1258668011.jpg', 'Former President Donald Trump waves as he makes a visit to the Cuban restaurant Versailles after he appeared for his arraignmen', 'The ex-president did not speak and let his lawyer enter a plea on his behalf, says a BBC reporter in the courtroom.', 'US & Canada', 'https://www.bbc.com/news/world/us_and_canada', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(292, 'Trump supporters outside court: \'It doesn\'t matter\'', 'https://www.bbc.com/news/world-us-canada-65898826', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/4540/production/_130082771_p0ftzyr2.jpg', 'Trump supporters', 'The Pulitzer Prize-winning author has died of natural causes aged 89, his publisher says.', 'US & Canada', 'https://www.bbc.com/news/world/us_and_canada', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(293, 'Inside a Ukrainian village just freed from Russian forces', 'https://www.bbc.com/news/world-europe-65894743', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/09C1/production/_130079420_liberatedvillage004.jpg', 'A destroyed house in Neskuchne, eastern Ukraine. Photo: 13 June 2023', 'A BBC investigation uncovers the dangers faced by migrants crossing between Iran and Turkey', 'Europe', 'https://www.bbc.com/news/world/europe', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(294, 'The temple feeding 100,000 people a day', 'https://www.bbc.com/travel/article/20230612-amritsar-the-indian-city-where-no-one-goes-hungry', 'https://ichef.bbc.co.uk/wwhp/{width}/ibroadcast/images/live/p0/fr/4x/p0fr4x59.jpg', 'Golden Temple, Amritsar', 'Performer Jocelyn Chia\'s quip about the missing Malaysian Airlines plane created uproar in Malaysia.', 'Travel', 'https://www.bbc.com/travel', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(295, 'Van Gogh\'s darkest symbol', 'https://www.bbc.com/culture/article/20230612-from-the-starry-night-to-a-wheatfield-van-goghs-darkest-symbol', 'https://ichef.bbc.co.uk/wwhp/{width}/ibroadcast/images/live/p0/ft/rt/p0ftrtrr.jpg', '(Credit: MoMA, NYC)', 'World number two Jon Rahm says players are still in the dark about what the proposed PGA Tour merger with Saudi Arabia\'s Public Investment Fund will mean for them.', 'Culture', 'http://www.bbc.com/culture', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(296, 'Cormac McCarthy, author of The Road, dies', 'https://www.bbc.com/news/entertainment-arts-65898867', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/B43A/production/_130083164_gettyimages-93109279.jpg', 'Cormac McCarthy. File photo', 'Kylian Mbappe will not be short of admirers when he leaves Paris St-Germain - but where could the 24-year-old realistically end up?', 'Entertainment & Arts', 'https://www.bbc.com/news/entertainment_and_arts', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(297, 'Kidnapped and tortured on the Turkish border', 'https://www.bbc.com/news/world-asia-65749889', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/13D56/production/_130083218_mediaitem129903161.jpg', 'Group of men with chains around their necks sit by a wall on a mountain top', 'Kylian Mbappe told Paris St-Germain last July he would not extend his contract beyond 2024 as Real Madrid links persist.', 'News', 'http://www.bbc.com/news', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(298, 'Malaysia seeks New York comedian over MH370 joke', 'https://www.bbc.com/news/world-asia-65894721', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/10871/production/_130079676_gettyimages-1388529297.jpg', 'Jocelyn Chia', 'BBC Arabic\'s new radio programme has been hearing about the suffering caused by the conflict.', 'Asia', 'https://www.bbc.com/news/world/asia', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(299, 'Players feel betrayed over merger plans - Rahm', 'https://www.bbc.com/sport/golf/65886390', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/8D1F/production/_130072163_rahm.jpg', 'Jon Rahm speaking at the 2023 US Open', 'Reports suggest the passengers were returning from a wedding party in Niger state.', 'Golf', 'https://www.bbc.com/sport/golf', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(300, 'Real Madrid? Man Utd? Where could Mbappe go next?', 'https://www.bbc.com/sport/football/65887784', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/5421/production/_130073512_gettyimages-1258642518.jpg', 'Kylian Mbappe', 'Hilda Baci caused a sensation last month after cooking non-stop for four days.', 'European Football', 'https://www.bbc.com/sport/football/european', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(301, 'Mbappe told PSG last year he would not extend deal', 'https://www.bbc.com/sport/football/65882905', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/9017/production/_130078863_gettyimages-1497534575.jpg', 'Kylian Mbappe playing for Paris Saint-Germain', 'In a culinary landscape dominated by Manchego, its survival is an open question', 'European Football', 'https://www.bbc.com/sport/football/european', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(302, 'Daily life in a war zone: Sudan\'s stories of survival', 'https://www.bbc.com/news/world-africa-65845830', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/A09E/production/_130081114_gettyimages-1258264161_afp976.jpg', 'Women walk down a street carrying bags in Greater Khartoum, Sudan - May 2023', 'A new aviation frontier takes shape', 'Africa', 'https://www.bbc.com/news/world/africa', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(303, 'John Fru Ndi obituary: Cameroon\'s brave champion of democracy', 'https://www.bbc.co.uk/news/world-africa-65891543', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/5666/production/_130081122_gettyimages-71701536_afp_976_3.jpg', 'John Fru Ndi at a SDF rally in Yaoundé, Cameroon in 2004', 'One woman has created a pie to honour every US state', 'Africa', 'http://www.bbc.com/news/world/africa', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(304, 'Dozens feared dead in Nigeria boat accident', 'https://www.bbc.co.uk/news/live/world-africa-65495450?ns_mchannel=social&ns_source=twitter&ns_campaign=bbc_live&ns_linkname=6488893d37572a107394dca9%26Dozens%20feared%20dead%20in%20Nigeria%20boat%20accident%262023-06-13T15%3A28%3A10.766Z&ns_fee=0&pinned_post_locator=urn:asset:baa0cf59-6269-4de2-9080-887a5ed27e34&pinned_post_asset_id=6488893d37572a107394dca9&pinned_post_type=share', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/159B1/production/_130079488_gettyimages-1211159805.jpg', 'Niger River as it passes through Jebba', 'As a \'final Beatles record\' is announced, unseen photos from 1964 are revealed', 'Africa', 'http://www.bbc.com/news/world/africa', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(305, 'Guinness confirms Nigerian chef\'s world record', 'https://www.bbc.com/news/world-africa-65888110', 'https://ichef.bbc.co.uk/wwhp/{width}/cpsprodpb/166B9/production/_129733819_whatsappimage2023-05-15at09.12.17.jpg', 'Hilda Baci', '"A fixed hybrid schedule risks us going backwards"', 'Africa', 'https://www.bbc.com/news/world/africa', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(306, 'A rare cheese from an unforgiving land', 'https://www.bbc.com/travel/article/20230613-the-spanish-cheese-nearing-extinction', 'https://ychef.files.bbci.co.uk/width/790/p0ft90np.jpg', 'In a culinary landscape dominated by Manchego, its survival is an open question', 'John Ward, 89, spent £2m trying to find out who killed his daughter Julie in Kenya in 1988', 'Travel', 'https://www.bbc.com/travel', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(307, 'The race to conquer the stratosphere', 'https://www.bbc.com/future/article/20230613-the-planes-that-will-fly-at-the-edge-of-space', 'https://ychef.files.bbci.co.uk/width/790/p0ftwtlv.jpg', 'A new aviation frontier takes shape', 'Falling prices for eggs, petrol and furniture helped to cut inflation in the US to 4% in May', 'Future', 'http://www.bbc.com/future', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(308, 'A pie synonymous with America', 'https://www.bbc.com/travel/article/20230612-sweet-tea-peach-pie-from-georgia', 'https://ichef.bbc.co.uk/wwhp/{width}/ibroadcast/images/live/p0/fs/s4/p0fss4ml.jpg', '(Image Credit: Alanna Hale)', 'Nottinghamshire\'s police chief explains how the attacks unfolded, that lead to three people dying.', 'World\'s Table', 'https://www.bbc.com/travel/worlds-table', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(309, 'The ultimate inside view of The Beatles', 'https://www.bbc.com/culture/article/20230613-the-ultimate-insider-view-of-the-beatles-and-beatlemania', 'https://ychef.files.bbci.co.uk/width/790/p0ftyq09.jpg', 'As a \'final Beatles record\' is announced, unseen photos from 1964 are revealed', 'The star says machine learning helped lift John Lennon\'s voice from a demo and turn it into a song.', 'Culture', 'http://www.bbc.com/culture', NULL, 'BBC', 'bbc', '2023-06-13', '2023-06-13 23:18:48', NULL),
	(310, 'Hostplus shuts property and infrastructure funds as commercial real estate, office tower values drop', 'http://www.afr.com/property/commercial/hostplus-shuts-property-infrastructure-funds-as-valuations-plummet-20230609-p5dfev', 'https://static.ffx.io/images/$zoom_0.1907%2C$multiply_4%2C$ratio_1.777778%2C$width_1059%2C$x_0%2C$y_108/t_crop_custom/c_scale%2Cw_800%2Cq_88%2Cf_jpg/t_afr_no_label_no_age_social_wm/9e904213c820ec50b3319324a9e43da41035ac51', NULL, 'The $100 billion super fund’s decision comes amid a reckoning over inflated valuations of Australia’s commercial property sector and warnings from APRA.', NULL, NULL, 'Hannah Wootton', 'Australian Financial Review', 'australian-financial-review', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(311, 'Lauterbach kündigt Erhöhung der Kassenbeiträge für 2024 an', 'https://www.handelsblatt.com/politik/deutschland/bundesgesundheitsminister-lauterbach-kuendigt-erhoehung-der-kassenbeitraege-fuer-2024-an/29201350.html', 'https://www.handelsblatt.com/images/karl-lauterbach/29201360/2-format2003.jpg', NULL, 'Leistungskürzungen werde es mit ihm nicht geben, sagt Lauterbach dem RND. Auch eine Anhebung der Beitragsbemessungsgrenze schließt der Finanzminister aus.', NULL, NULL, 'Handelsblatt', 'Handelsblatt', 'handelsblatt', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(312, 'Bundesgesundheitsminister: Lauterbach kündigt Erhöhung der Kassenbeiträge für 2024 an', 'https://www.wiwo.de/politik/deutschland/bundesgesundheitsminister-lauterbach-kuendigt-erhoehung-der-kassenbeitraege-fuer-2024-an/29201366.html', 'https://www.wiwo.de/images/karl-lauterbach/29201360/2-format11240.jpg', NULL, 'Leistungskürzungen werde es mit ihm nicht geben, sagt Lauterbach dem RND. Auch eine Anhebung der Beitragsbemessungsgrenze schließt der Finanzminister aus.', NULL, NULL, 'Wirtschaftswoche', 'Wirtschafts Woche', 'wirtschafts-woche', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(313, 'IGB Eletrônica, dona da Gradiente, informa cancelamento de registro de companhia aberta "A"', 'https://www.infomoney.com.br/mercados/igb-eletronica-dona-da-gradiente-informa-cancelamento-de-registro-de-companhia-aberta-a/', 'https://www.infomoney.com.br/wp-content/uploads/2019/06/iphone-gradiente-celular-igb.jpg?quality=70', NULL, 'IGB deixará de ter valores mobiliários de sua emissão listados para negociação na B3 S.A. – Brasil, Bolsa, Balcão', NULL, NULL, 'Felipe Moreira', 'InfoMoney', 'info-money', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(314, 'Macron empfing Scholz und Duda in Paris – „werden ein noch einigeres und stärkeres Europa schaffen“', 'https://www.handelsblatt.com/politik/international/gipfeltreffen-des-weimarer-dreiecks-macron-empfing-scholz-und-duda-in-paris-werden-ein-noch-einigeres-und-staerkeres-europa-schaffen/29201324.html', 'https://www.handelsblatt.com/images/von-links-polens-praesident-andrzej-duda-der-franzoesische-praesident-emmanuel-macron-und-kanzler-olaf-scholz/29201340/2-format2003.jpg', NULL, 'Bei dem Treffen ging es um den Ukrainekrieg und den Nato-Gipfel im Juli. Uneinigkeit herrschte zu einem möglichen Nato-Beitritt der Ukraine und Immigration. Die Gespräche sollen weitergeführt werden.', NULL, NULL, 'Tanja Kuchenbecker', 'Handelsblatt', 'handelsblatt', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(315, 'Gesundheit: Lauterbach: E-Rezept kommt vom 1. Juli an', 'https://www.zeit.de/news/2023-06/13/lauterbach-e-rezept-kommt-vom-1-juli-an', NULL, NULL, NULL, NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(316, 'Gesundheitskosten: Karl Lauterbach kündigt höhere Kassenbeiträge ab 2024 an', 'https://www.zeit.de/gesundheit/2023-06/gesundheitsminister-karl-lauterbach-krankenkasse-beitraege-erhoehung-2024', NULL, NULL, 'Den gesetzlichen Krankenkassen droht ein Milliardendefizit. Leistungskürzungen lehnt der Bundesgesundheitsminister aber ab. Stattdessen sollen die Beiträge steigen.', NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(317, 'Haddad: Reunião com líderes do Senado sobre arcabouço ficou para 5ª-feira; talvez antecipem', 'https://www.infomoney.com.br/politica/haddad-reuniao-com-lideres-do-senado-sobre-arcabouco-ficou-para-5a-feira-talvez-antecipem/', 'https://www.infomoney.com.br/wp-content/uploads/2021/03/Senado0403.jpg?quality=70', NULL, 'Mais cedo, a ministra Simone Tebet também mencionou o encontro com os senadores para a discussão da nova regra fiscal', NULL, NULL, 'Equipe InfoMoney', 'InfoMoney', 'info-money', '2023-06-12', '2023-06-13 23:18:49', NULL),
	(318, 'Regierung: Bürgermeisterin von Mexiko-Stadt tritt zurück', 'https://www.zeit.de/news/2023-06/12/buergermeisterin-von-mexiko-stadt-tritt-zurueck', NULL, NULL, NULL, NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(319, 'Breakup of Google Ad-Tech Business Now on Table in Europe, Too', 'https://www.wsj.com/articles/breakup-of-google-ad-tech-business-now-on-table-in-europe-too-d74cc355?mod=hp_lead_pos2', 'https://images.wsj.net/im-798908/social', NULL, 'Expected EU antitrust case would add to U.S. Justice Department’s lawsuit', NULL, NULL, 'Sam Schechner, Kim Mackrael', 'The Wall Street Journal', 'the-wall-street-journal', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(320, 'Netflix Plans First Live-Streamed Sports Event With Celebrity Golf Tournament', 'https://www.wsj.com/articles/netflix-plans-first-live-streamed-sports-event-with-celebrity-golf-tournament-cd76c2c1?mod=hp_lead_pos4', 'https://images.wsj.net/im-799010/social', NULL, 'Tournament would feature celebrities from Formula One series ‘Drive to Survive’ and golf program ‘Full Swing’', NULL, NULL, 'Sarah Krouse, Jessica Toonkel', 'The Wall Street Journal', 'the-wall-street-journal', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(321, 'Carrefour Brasil (CRFB3) aprova distribuição de JCP no valor de R$ 179 milhões', 'https://www.infomoney.com.br/mercados/carrefour-brasil-crfb3-aprova-distribuicao-jcp/', 'https://www.infomoney.com.br/wp-content/uploads/2019/06/carrefour-5.jpg?fit=900%2C600&quality=70&strip=all', NULL, 'Pagamento será realizado até 31 de dezembro de 2023', NULL, NULL, 'Felipe Moreira', 'InfoMoney', 'info-money', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(322, 'EDP (ENBR3): Conselho recomenda aceitação de OPA por parte dos acionistas', 'https://www.infomoney.com.br/mercados/edp-enbr3-conselho-recomenda-aceitacao-de-opa-por-parte-dos-acionistas/', 'https://www.infomoney.com.br/wp-content/uploads/2019/06/edp-energia-01-hidreletrica.jpg?quality=70', NULL, 'Operação visa o cancelamento de registro de companhia aberta na categoria A e conversão para categoria B e saída do Novo Mercado da B3', NULL, NULL, 'Felipe Moreira', 'InfoMoney', 'info-money', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(323, 'ASX LIVE: Australian shares poised to open higher on strength of S&P 500, Nasdaq', 'http://www.afr.com/markets/equity-markets/asx-seen-higher-s-and-p-nasdaq-extend-rallies-20230613-p5dg1r', 'https://static.ffx.io/images/$zoom_0.482%2C$multiply_2%2C$ratio_1.777778%2C$width_1059%2C$x_0%2C$y_0/t_crop_custom/c_scale%2Cw_800%2Cq_88%2Cf_jpg/t_afr_live_no_age_social_wm/0be01846bf26589d00ff2aef1a730d3cdf36b80a', NULL, 'Australian shares are set to catch New York’s upward wave. S&P 500 rises 0.9pc, solidifying bull market move. Oil, gold, iron ore drop. Follow updates here.', NULL, NULL, 'Timothy Moore', 'Australian Financial Review', 'australian-financial-review', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(324, 'Berlin-Neukölln: Drei Männer bei Auseinandersetzung schwer verletzt', 'https://www.zeit.de/news/2023-06/12/drei-maenner-bei-auseinandersetzung-schwer-verletzt', NULL, NULL, NULL, NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(325, 'Hochtaunus: Waldbrand am Altkönig: Löscharbeiten über Nacht unterbrochen', 'https://www.zeit.de/news/2023-06/12/waldbrand-am-altkoenig-loescharbeiten-ueber-nacht-unterbrochen', NULL, NULL, NULL, NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(326, 'Ecorodovias (ECOR3) obtém decisão favorável para continuidade das operações portuárias em Santos', 'https://www.infomoney.com.br/mercados/ecorodovias-ecor3-obtem-decisao-favoravel-para-continuidade-das-operacoes-portuarias-em-santos/', 'https://www.infomoney.com.br/wp-content/uploads/2023/06/ECOPORTO-3.jpg?fit=800%2C800&quality=70&strip=all', NULL, 'A decisão vigorará pelo prazo de 180 dias, até que haja uma definição de política pública sobre a destinação da área', NULL, NULL, 'Felipe Moreira', 'InfoMoney', 'info-money', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(327, 'Dokumentenaffäre: Miami bereitet sich auf Trump-Anhörung vor', 'https://www.zeit.de/politik/ausland/2023-06/miami-sicherheitsvorkehrungen-dokumentenprozess-trump-ausschreitungen-proud-boys', NULL, NULL, 'Zum ersten Gerichtstermin des Ex-US-Präsidenten stellt sich Miami auf Zehntausende Demonstranten ein. Auch Ausschreitungen der rechtsradikalen Proud Boys sind möglich.', NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(328, 'Feuerwehreinsatz: Vier Verletzte bei Brand in Essener Klinik', 'https://www.zeit.de/news/2023-06/12/vier-verletzte-bei-brand-in-essener-klinik', NULL, NULL, NULL, NULL, NULL, NULL, 'Die Zeit', 'die-zeit', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(329, 'Federal politics LIVE UPDATES:  Government pledges at least $500m for housing, but Greens unmoved', 'http://www.afr.com/politics/federal/government-pledges-at-least-500m-for-housing-but-greens-unmoved-20230613-p5dg1q', 'https://static.ffx.io/images/$zoom_0.2126%2C$multiply_3%2C$ratio_1.777778%2C$width_1059%2C$x_0%2C$y_37/t_crop_custom/c_scale%2Cw_800%2Cq_88%2Cf_jpg/t_afr_live_no_age_social_wm/e4c77fa108f48e2f4641aa8046e42fdc8f20a917', NULL, 'The government has guaranteed to spend at least $500 million a year on social and affordable housing to secure the Greens’ support for its $10 billion housing fund. Follow updates here.', NULL, NULL, 'Lois Maskiell', 'Australian Financial Review', 'australian-financial-review', '2023-06-12', '2023-06-13 23:18:50', NULL),
	(330, 'Donald Trump heads to New Jersey after pleading not guilty to 37 counts in Miami – live', 'https://www.theguardian.com/us-news/live/2023/jun/13/trump-indictment-arraignment-miami-classified-documents-live-updates', NULL, NULL, NULL, 'US news', 'https://www.theguardian.com/us-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(331, 'Australia politics live: Liberal MP Andrew Bragg calls for inquiry into ‘tawdry’ exposure of Brittany Higgins’ private messages', 'https://www.theguardian.com/australia-news/live/2023/jun/14/auastralia-politics-live-nsw-indigenous-voice-referendum-linda-burney-anthony-albanese-peter-dutton-question-time-brittany-higgins-katy-gallagher-linda-reynolds-tanya-plibersek', NULL, NULL, NULL, 'Australia news', 'https://www.theguardian.com/australia-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(332, 'Nobel laureate Maria Ressa says research by Oxford institute can be used against reporters', 'https://www.theguardian.com/media/2023/jun/14/nobel-laureate-says-research-by-oxford-institute-can-be-used-against-reporters', NULL, NULL, NULL, 'World news', 'https://www.theguardian.com/world', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(333, 'Nottingham: suspect believed to have killed man and used van to drive at people, police say, after three die in attack – as it happened', 'https://www.theguardian.com/uk-news/live/2023/jun/13/nottingham-people-killed-major-incident-police-latest-updates', NULL, NULL, NULL, 'UK news', 'https://www.theguardian.com/uk-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(334, 'Miami catches glimpse of circus as Trump goes before judge – again', 'https://www.theguardian.com/us-news/2023/jun/13/miami-trump-circus-arraignment', NULL, NULL, NULL, 'US news', 'https://www.theguardian.com/us-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(335, 'Nottingham in shock after three die in early morning attacks', 'https://www.theguardian.com/global/2023/jun/13/nottingham-in-shock-after-three-die-in-early-morning-attacks', NULL, NULL, NULL, 'Global', 'https://www.theguardian.com/global', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(336, '‘Hidden’ Malibu beach will open to the public for the first time in 40 years', 'https://www.theguardian.com/us-news/2023/jun/13/california-escondido-beach-public-access', NULL, NULL, NULL, 'US news', 'https://www.theguardian.com/us-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(337, 'A life in quotes: Cormac McCarthy', 'https://www.theguardian.com/books/2023/jun/13/quotes-cormac-mccarthy-death', NULL, NULL, NULL, 'Books', 'https://www.theguardian.com/books', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(338, 'UK government to invest in film and TV AI special-effects research', 'https://www.theguardian.com/business/2023/jun/13/uk-government-invest-film-tv-ai-special-effects-research-economy', NULL, NULL, NULL, 'Business', 'https://www.theguardian.com/business', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(339, 'Tyrone Mings: ‘Never did I think this was it or there was no way back’ | Andy Hunter', 'https://www.theguardian.com/football/2023/jun/13/tyrone-mings-england-aston-villa-euro-2024-qualifiers', NULL, NULL, NULL, 'Football', 'https://www.theguardian.com/football', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(340, 'Africa Rising With Afua Hirsch review – 51 more episodes of this fascinating series please!', 'https://www.theguardian.com/tv-and-radio/2023/jun/13/africa-rising-with-afua-hirsch-review-51-more-episodes-of-this-fascinating-series-please', NULL, NULL, NULL, 'Television & radio', 'https://www.theguardian.com/tv-and-radio', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(341, 'US student loan interest to resume in September and payments in October', 'https://www.theguardian.com/money/2023/jun/13/when-student-loan-payments-resume-debt-ceiling-october', NULL, NULL, NULL, 'Money', 'https://www.theguardian.com/money', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(342, 'Morning Mail: Trump pleads not guilty, last asylum seekers may leave Nauru, crocodile serial killer', 'https://www.theguardian.com/australia-news/2023/jun/14/morning-mail-trump-pleads-not-guilty-last-asylum-seekers-may-leave-nauru-crocodile-serial-killer', NULL, NULL, NULL, 'Australia news', 'https://www.theguardian.com/australia-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(343, 'Trump pleads not guilty to 37 federal criminal counts in Mar-a-Lago case', 'https://www.theguardian.com/us-news/2023/jun/13/trump-arraignment-not-guilty-charges-mar-a-lago-documents-court', NULL, NULL, NULL, 'US news', 'https://www.theguardian.com/us-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(344, 'Rahm admits players feel sense of betrayal over deal with Saudi Arabia', 'https://www.theguardian.com/sport/2023/jun/13/jon-rahm-saudi-arabia-pga-tour-dp-world-tour-liv-golf', NULL, NULL, NULL, 'Sport', 'https://www.theguardian.com/sport', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(345, '‘Then we saw the blood’: residents horrified by attacks that shocked Nottingham', 'https://www.theguardian.com/uk-news/2023/jun/13/everyone-is-feeling-very-scared-how-a-horrifying-day-for-nottingham-unfolded', NULL, NULL, NULL, 'UK news', 'https://www.theguardian.com/uk-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(346, 'Rescued children pay tribute to sniffer dog still missing in Colombian jungle', 'https://www.theguardian.com/world/2023/jun/13/colombian-children-jungle-dog-wilson-missing', NULL, NULL, NULL, 'World news', 'https://www.theguardian.com/world', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(347, 'Australia to transport last asylum seekers off Nauru within weeks, refugees say', 'https://www.theguardian.com/australia-news/2023/jun/14/australia-to-transport-last-asylum-seekers-off-nauru-within-weeks-refugees-say', NULL, NULL, NULL, 'Australia news', 'https://www.theguardian.com/australia-news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(348, 'Corrections and clarifications', 'https://www.theguardian.com/news/2023/jun/13/corrections-and-clarifications', NULL, NULL, NULL, 'News', 'https://www.theguardian.com/news', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL),
	(349, 'Tales of yore will tell of the plot twists in this Mbappé to Real Madrid saga | Barney Ronay', 'https://www.theguardian.com/football/2023/jun/13/tales-of-yore-will-tell-of-the-plot-twists-in-this-mbappe-to-real-madrid-saga', NULL, NULL, NULL, 'Football', 'https://www.theguardian.com/football', NULL, 'Guardian', 'guardian', '2023-06-13', '2023-06-13 23:18:51', NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Dumping structure for table lara.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table lara.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table lara.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lara.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
