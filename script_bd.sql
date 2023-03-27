-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : 172.16.1.2
-- Généré le : lun. 27 mars 2023 à 18:02
-- Version du serveur :  10.3.29-MariaDB-0+deb10u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etu_bloupiac`
--

-- --------------------------------------------------------

--
-- Structure de la table `Author`
--

CREATE TABLE `Author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Author`
--

INSERT INTO `Author` (`id`, `name`) VALUES
(0, 'Sam McBratney'),
(1, 'Tom Rath'),
(2, 'Paul Verlaine'),
(3, 'Judith L. Rapoport'),
(4, 'Janet Ahlberg'),
(5, 'Édouard Glissant'),
(6, 'Daniel J. Siegel'),
(7, 'Steven Weinberg'),
(8, 'Alexander Osterwalder'),
(9, 'Katie Chase'),
(10, 'James Clear'),
(11, 'Jean-Paul Gabilliet'),
(12, 'Matthew McConaughey'),
(13, 'Dale Carnegie'),
(14, 'Pierre Mounier'),
(15, 'Allan Ahlberg'),
(16, 'Nicoby'),
(17, 'Dalaï Lama'),
(18, 'Daniel Siegel'),
(19, 'Julia Donaldson'),
(20, 'Rémi Courgeon'),
(21, 'Meera Lee Patel'),
(22, 'Jacqueline Woodson'),
(23, 'Daniel Keyes'),
(24, 'Joub'),
(25, 'Alain Mabanckou'),
(26, 'Samuel Metzener'),
(27, 'C. Brené Brown'),
(28, 'Patrick Ness'),
(29, 'Jeffrey David Ullman'),
(30, 'Robert Kiyosaki'),
(31, 'Sharon m Draper'),
(32, 'Ram Singh Urveti'),
(33, 'Greg Bernarda'),
(34, 'Robert Greene'),
(35, 'Margaret Wise Brown'),
(36, 'Ngaio Marsh'),
(37, 'Sara Gruen'),
(38, 'Tina Payne Brison'),
(39, 'Tiffany McDaniel'),
(40, 'Colleen Hoover'),
(41, 'Kazuo Ishiguro'),
(42, 'Michel Ollendorff'),
(43, 'Desmond Tutu'),
(44, 'Lucy Maud Montgomery'),
(45, 'Bertolt Brecht'),
(46, 'Art Spiegelman'),
(47, 'Mélanie Fennell'),
(48, 'Jennifer Egan'),
(49, 'Dick King-Smith'),
(50, 'Timothy Snyder'),
(51, 'David Parkins'),
(52, 'Angela Duckworth'),
(53, 'Margaret Atwood'),
(54, 'Jane Yolen'),
(55, 'James Hilton'),
(56, 'Matt Haig'),
(57, 'Gillian Butler'),
(58, 'Collectif'),
(59, 'Jeff Kinney'),
(60, 'Sally Rooney'),
(61, 'Jason Schreier'),
(62, 'Jory John'),
(63, 'David Mitchell'),
(64, 'Keizaburō Tejima'),
(65, 'Constance Debré'),
(66, 'Dr Seuss,'),
(67, 'Axel Scheffler'),
(68, 'Donald O.. Clifton'),
(69, 'Robert Munsch'),
(70, 'Mark Manson'),
(71, 'Lucien X. Polastron'),
(72, 'Simon Mason'),
(73, 'Mathieu Gaborit'),
(74, 'Daniel Kahneman'),
(75, 'Eric Carle'),
(76, 'Pierre-Henry Gomont'),
(77, 'Andrew sean Greer'),
(78, 'Bhajju Shyam'),
(79, 'Durga Bai'),
(80, 'Denyse Beaulieu'),
(81, 'Ma Zuo'),
(82, 'Kate Pankhurst'),
(83, 'John Updike'),
(84, 'Toni Morrison'),
(85, 'Patricia Cornwell'),
(86, 'Anita Jeram'),
(87, 'Benjamin Zephaniah'),
(88, 'Ed Young'),
(89, 'Dr. Seuss'),
(90, 'Charlie Mackesy'),
(91, 'Maggie O\'FARRELL'),
(92, 'Jordan b. Peterson'),
(93, 'Celestia'),
(94, 'Beatrix Potter'),
(95, 'Nan Silver'),
(96, 'Yuval Noah Harari'),
(97, 'Eudora Welty'),
(98, 'Niviaq Korneliussen'),
(99, 'Nir Eyal'),
(100, 'Don Miguel Ruiz'),
(101, 'Solomon Northup'),
(102, 'Yves Pigneur'),
(103, 'R.J. PALACIO'),
(104, 'Sharon Begley'),
(105, 'Taylor Jenkins Reid'),
(106, 'Ovide'),
(107, 'Harper Lee'),
(108, 'Alan Smith'),
(109, 'Melvin Burgess'),
(110, 'Bernard Benoliel'),
(111, 'Holly Jackson'),
(112, 'Arthur Conan Doyle'),
(113, 'David Levithan'),
(114, 'Rémi Burrowes'),
(115, 'Brené Brown'),
(116, 'Thomas Gunzig'),
(117, 'Aisha Saeed'),
(118, 'Michael Walzer'),
(119, 'John Mordechai Gottman'),
(120, 'L. M. (Lucy Maud) Montgomery'),
(121, 'Jandy Nelson'),
(122, 'Alfred Aho'),
(123, 'Jean-Patrick Manchette'),
(124, 'Shel Silverstein'),
(125, 'John Archambault'),
(126, 'Robert Goolrick'),
(127, 'Peter Carey'),
(128, 'Martyn Lyons'),
(129, 'MONTGOMERY LUCY MAUD'),
(130, 'Marcus Buckingham'),
(131, 'Chip Kidd'),
(132, 'E. L. James'),
(133, 'Peter Handke'),
(134, 'Siddhartha Mukherjee'),
(135, 'J.K. Rowling'),
(136, 'Bill Martin'),
(137, 'Jc4004'),
(138, 'Delia Owens'),
(139, 'V. E. Schwab'),
(140, 'Edith Wharton'),
(141, 'Clement Hurd'),
(142, 'Henry T. Blackaby'),
(143, 'Padma Venkatraman'),
(144, 'Alexandre Clavel'),
(145, 'Laure Malaprade'),
(146, 'Manuele Fior'),
(147, 'John Ronald Reuel Tolkien'),
(148, 'Ravi Sethi'),
(149, 'Adam Wallace'),
(10000, 'karis et booba ');

-- --------------------------------------------------------

--
-- Structure de la table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbr_pages` int(11) NOT NULL,
  `resume` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `editor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Book`
--

INSERT INTO `Book` (`id`, `title`, `picture`, `language`, `nbr_pages`, `resume`, `year`, `category`, `editor`) VALUES
(0, 'Du sang, des larmes et des pixels', 'http://books.google.com/books/content?id=sgteDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Le premier essai des éditions Mana Books ! Destiny, Diablo III ou encore Uncharted 4 : des jeux encensés par la critique comme par les joueurs. Et pourtant, la création de chacun de ces titres tient du miracle. Des difficultés de planning de Dragon Age : Inquisition aux problèmes de financement de Pillars of Eternity, Jason Schreier (Kotaku) nous emmène dans les coulisses du développement chaotique des plus belles réussites vidéoludiques de ces dernières années.', 2018, 1, 24),
(1, 'Read/Write Book 2', 'http://books.google.com/books/content?id=oyxLEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Qu’est-ce que les humanités numériques ? Apparue en 2006, l’expression connaît depuis un véritable succès. Mais au-delà du slogan à la mode, quelle est la réalité des pratiques qu’il désigne ? Si tout le monde s’accorde sur une définition minimale à l’intersection des technologies numériques et des sciences humaines et sociales, les vues divergent lorsqu’on entre dans le vif du sujet. Les humanités numériques représentent-elles une véritable révolution des pratiques de recherche et des paradigmes intellectuels qui les fondent ou, plus simplement, une optimisation des méthodes existantes ? Constituent-elles un champ suffisamment structuré pour justifier une réforme des modes de financement de la recherche, des cursus de formation, des critères d’évaluation ? L’archive numérique offre-t-elle à la recherche suffisamment de garanties ? Quelle place la recherche « dirigée par les données » laisse-t-elle à l’interprétation ? Telles sont quelques-unes des questions abordées par ce deuxième opus de la collection « Read/Write Book ». Ces dix-huit textes essentiels, rédigés ou traduits en français par des chercheurs de différentes nationalités, proposent une introduction aux humanités numériques accessible à tous ceux qui souhaitent en savoir plus sur ce domaine de recherche en constante évolution.', 2012, 21, 54),
(2, 'L\'Art d\'Aimer', 'http://books.google.com/books/content?id=cWMxzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Dans cette oeuvre sans nulle autre pareille, Ovide nous propose une initiation à l\'Art de l\'Amour, un guide poétique et philosophique de la séduction. D\'une modernité surprenante, c\'est aussi une réflexion novatrice pour l\'époque sur les rapports amoureux. Extrait: Tandis que Vénus m\'inspire, jeunes beautés, prêtez l\'oreille à mes leçons. La pudeur et les lois vous le permettent; votre intérêt vous y invite. Songez dès à présent à la vieillesse qui viendra trop tôt, et vous ne perdrez pas un instant. Tandis que vous le pouvez, et que vous en êtes encore à vos années printanières, donnez-vous du bon temps; comme l\'eau s\'écoulent les années. Le flot qui fuit ne reviendra plus à sa source; l\'heure une fois passée est passée sans retour. Profitez du bel âge: il s\'envole si vite !', 2021, 1, 6),
(3, 'Les quatre accords toltèques', 'http://books.google.com/books/content?id=GjCHEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Découvrez ou redécouvrez Les quatre accords toltèques, et prenez comme des millions de lecteurs en France et à travers le monde, la voie de la liberté personnelle. Dans ce livre, Don Miguel révèle la source des croyances limitatrices qui nous privent de joie et créent des souffrances inutiles. Il montre en des termes très simples comment on peut se libérer du conditionnement collectif - le \'rêve de la planète\', basé sur la peur - afin de retrouver la dimension d\'amour inconditionnel qui est à notre origine et constitue le fondement des enseignements toltèques que Castenada fut le premier à faire découvrir au grand public. Don Miguel révèle ici 4 clés simples pour transformer sa vie et ses relations, tirées de la sagesse toltèque. Leur application au quotidien permet de transformer rapidement notre vie en une expérience de liberté, de vrai bonheur et d\'amour. Les quatre accords toltèques : 1 - Que ta parole soit impeccable ; 2 - Ne réagis à rien de façon personnelle ; 3 - Ne fais aucune supposition ; 4 - Fais toujours de ton mieux. Nouvelle édition tant attendue en format poche de ce best-seller ! 750\'000 exemplaires vendus en France de ce texte de référence en développement personnel. UN ÉVÉNEMENT !', 2016, 25, 60),
(4, 'Compilateurs', NULL, 'fr', 1, '...', 1998, 1, 1),
(5, 'Klara et le Soleil', 'http://books.google.com/books/content?id=7yk4EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Klara est une AA, une Amie Artifi cielle, un robot de pointe ultraperformant créé spécialement pour tenir compagnie aux enfants et aux adolescents. Klara est dotée d’un extraordinaire talent d’observation, et derrière la vitrine du magasin où elle se trouve, elle profite des rayons bienfaisants du Soleil et étudie le comportement des passants, ceux qui s’attardent pour jeter un coup d’œil depuis la rue ou qui poursuivent leur chemin sans s’arrêter. Elle nourrit l’espoir qu’un jour quelqu’un entre et vienne la choisir. Lorsque l’occasion se présente enfin, Klara est toutefois mise en garde : mieux vaut ne pas accorder trop de crédit aux promesses des humains... Après l’obtention du prix Nobel de littérature, Kazuo Ishiguro nous offre un nouveau chef-d’œuvre qui met en scène avec virtuosité la façon dont nous apprenons à aimer. Ce roman, qui nous parle d’amitié, d’éthique, d’altruisme et de ce qu’être humain signifie, pose une question à l’évidence troublante : à quel point sommes-nous irremplaçables ?', 2021, 32, 10),
(6, 'L\'art de la niaque', 'http://books.google.com/books/content?id=592gDgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Comment la passion et de la persévérance forgent les destins et comment la cultiver ? La psychologue Angela Duckworth démontre aux parents, étudiants, enseignants, sportifs et entrepreneurs – aguerris ou néophytes – que le secret d’un succès éclatant ne réside pas dans de quelconques prédispositions mais dans ce qu’elle entend par « pugnacit頻 : la passion alliée à la persévérance. Enseignante-chercheuse de renom, Angela Duckworth évoque ici ses passages successifs par l’enseignement, le conseil aux entreprises et les neurosciences pour étayer son hypothèse que le succès ne s’explique pas par le « génie » mais un dosage unique de passion et d’opiniâtreté. Au fil des pages, elle conduit le lecteur auprès de sportifs, d’artistes, de militaires, de grands hommes d’affaires, d’enseignants qui leur livrent comment ils ont développé leur pugnacité. Dénichant des pépites dans l’histoire de la psychologie, elle suggère quelles leçons tirer des travaux les plus récents sur ceux qui excellent dans leur domaine. Vous apprendrez entre autres : Pourquoi le moindre effort en vue d’atteindre votre objectif compte double. Comment s’acquiert la pugnacité indépendamment du QI ou des circonstances. Comment aider nos enfants à se concentrer durablement sur leurs activités ? Quelle part d’un entraînement optimal implique de la souffrance et quelle part mène à l’extase. Ce qui vaut mieux pour un enfant, d’un soutien inconditionnel ou d’un haut niveau d’exigence. Vous y découvrirez ce qui se passe dans votre esprit quand vous butez contre un obstacle, et que tout part de là – plutôt que du talent ou de la chance. Traduit de l’anglais par Marie Boudewyn', 2017, 25, 63),
(7, 'Sapiens', 'http://books.google.com/books/content?id=M89yCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Il y a 100 000 ans, la Terre était habitée par au moins six espèces différentes d\'hominidés. Une seule a survécu. Nous, les Homo Sapiens. Comment notre espèce a-t-elle réussi à dominer la planète ? Pourquoi nos ancêtres ont-ils uni leurs forces pour créer villes et royaumes ? Comment en sommes-nous arrivés à créer les concepts de religion, de nation, de droits de l\'homme ? À dépendre de l\'argent, des livres et des lois ? À devenir esclaves de la bureaucratie, des horaires, de la consommation de masse ? Et à quoi ressemblera notre monde dans le millénaire à venir ? Véritable phénomène d\'édition, traduit dans une trentaine de langues, Sapiens est un livre audacieux, érudit et provocateur. Professeur d\'Histoire à l\'Université hébraïque de Jérusalem, Yuval Noah Harari mêle l\'Histoire à la Science pour remettre en cause tout ce que nous pensions savoir sur l\'humanité : nos pensées, nos actes, notre héritage... et notre futur.', 2015, 17, 64),
(8, 'Le Cerveau de votre enfant', 'http://books.google.com/books/content?id=dTcBEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'La Bible de l\'éducation positive LES PARENTS ONT BESOIN D\'UN MODE D\'EMPLOI ADAPTÉ AUX ENFANTS D\'AUJOURD\'HUI Comment élever mon enfant ? Comment l\'aider à être heureux, équilibré, respectueux des autres ? Que fautil faire, ne pas faire ? Y a-t-il une méthode efficace pour gérer les peurs, les colères ? Ces questions, tous les parents se les posent. Aujourd\'hui, les découvertes sur le cerveau jettent une lumière nouvelle sur le comportement des enfants. Ce livre met à la portée des parents les éléments de base pour comprendre et agir. IL EST POSSIBLE D\'AGIR POSITIVEMENT SUR LE CERVEAU DE L\'ENFANT Le cerveau est notre organe le plus complexe : il comprend deux hémisphères, plusieurs aires – dont certaines sont dédiées au comportement moral, d\'autres aux décisions ou à la motivation –, plusieurs \' étages \' – cerveau reptilien, limbique et cortex. La clé est de les intégrer dans un même circuit, comme les différents systèmes du corps humain. Quand tous ces éléments ne fonctionnent pas ensemble surviennent les problèmes : colères, caprices, agressivité. Par notre comportement en tant que parents, nous pouvons agir sur le bon fonctionnement du cerveau de l\'enfant. UNE MERVEILLE DE PÉDAGOGIE ILLUSTRÉE Il mêle le savoir et la pratique. Chaque chapitre présente une connaissance sur le cerveau (les deux hémisphères, les deux étages du cerveau) et des techniques pour intégrer ce savoir au quotidien de l\'enfant. Ces techniques sont systématiquement illustrées par : – Des scenettes sous formes de BD pour montrer des situations familières (opposition, troubles émotionnels) et expliquer au parents comment y répondre. – D\'autres sont destinées à expliquer aux enfants le fonctionnement de leur cerveau.', 2015, 32, 18),
(9, 'La méthode Value Proposition Design', NULL, 'fr', 1, 'Suite attendue du bestseller Business Model Nouvelle Génération, ce livre est indispensable pour proposer une offre de produits et services en phase avec les attentes des clients.', 2015, 14, 45),
(10, 'Découvrez vos points forts avec le test CliftonStrengths', NULL, 'fr', 1, 'Connaissez-vous vos points forts ? Comme la majorité des individus vous êtes sûrement plus conscients de vos faiblesses. Aussi vous passez votre vie à vouloir les surmonter, alors qu\'il faudrait axer votre développement sur vos forces et bâtir votre existence autour d\'elles ; : en agissant ainsi, vos capacités de progression dans l\'entreprise, d\'épanouissement personnel et votre bonne santé mentale seront décuplées ! Gallup a mis au point un test, CliftonStrengths, qui vous permettra de découvrir vos points forts. Il se compose d\'un questionnaire en ligne de 30 minutes, durant lequel vous devrez répondre à 177 déclarations qui vous permettront de découvrir vos talents parmi 34 thèmes. Ce livre offre un accès, grâce à un code à gratter, au test CliftonStrengths reconnu mondialement. Dans cette nouvelle édition de l\'ouvrage Découvrez vos points forts, Tom Rath expose ; : dans une première partie, les raisons pour lesquelles il est important de découvrir ses points forts : Il est alors conseillé au lecteur de passer le test grâce au code inséré dans l\'ouvrage. dans une deuxième partie, comment appliquer ses points forts avec pour chacun des 34 points forts qui existent, des témoignages de personnes qui possèdent ces points forts, des idées concrètes d\'optimisation de ces talents et les clefs pour collaborer avec les personnes qui en sont dotées. Fondé sur l\'analyse de millions d\'interviews et de données, cette nouvelle version du test est encore plus précise et sûre dans ses résultats.', 2019, 1, 1),
(11, 'Les humanités numériques', 'http://books.google.com/books/content?id=AlV1DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Quel avenir faut-il prédire aux humanités ? Les signes d\'une désaffection pour la culture humaniste se sont multipliés au cours des dernières années en France et ailleurs. Dans ce contexte morose et déprimé, le développement des humanités numériques apparaît à certains comme une planche de salut pour des disciplines autrement condamnées à disparaître. Toutefois, réinventer les humanités par le numérique suppose de relever trois défis de taille : leur rapport à la technique, leur relation au politique et enfin à la science elle-même. Les humanités numériques sont très critiquées : pour certains elles relèvent de la poudre aux yeux, pour d\'autres, elles constituent une menace extraordinaire. Mais s\'il y a bien quelque chose que l\'on ne peut contester, c\'est leur capacité à poser de bonnes questions aux différentes disciplines des sciences humaines et sociales. Penser la place que les humanités doivent tenir dans notre monde implique d\'en redéfinir le contrat social et épistémique. Elles sont riches d\'opportunités de ce point de vue : à condition de ne pas dénaturer la spécificité humanistique des pratiques de recherche auxquelles elles s\'appliquent.', 2018, 21, 65),
(12, 'Les cigognes sont immortelles', 'http://books.google.com/books/content?id=qOtgDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'À Pointe-Noire, dans le quartier Voungou, la vie suit son cours. Autour de la parcelle familiale où il habite avec Maman Pauline et Papa Roger, le jeune collégien Michel a une réputation de rêveur. Mais les tracas du quotidien (argent égaré, retards et distractions, humeur variable des parents, mesquineries des voisins) vont bientôt être emportés par le vent de l\'Histoire. En ce mois de mars 1977 qui devrait marquer l\'arrivée de la petite saison des pluies, le camarade président Marien Ngouabi est brutalement assassiné à Brazzaville. Et cela ne sera pas sans conséquences pour le jeune Michel, qui fera alors, entre autres, l\'apprentissage du mensonge. Partant d\'un univers familial, Alain Mabanckou élargit vite le cercle et nous fait entrer dans la grande fresque du colonialisme, de la décolonisation et des impasses du continent africain, dont le Congo est ici la métaphore puissante et douloureuse. Mêlant l\'intimisme et la tragédie politique, il explore les nuances de l\'âme humaine à travers le regard naïf d\'un adolescent qui, d\'un coup, apprend la vie et son prix. Alain Mabanckou est né en 1966 à Pointe-Noire, au Congo-Brazzaville. Ses œuvres sont traduites dans le monde entier. Il enseigne la littérature francophone à l\'Université de Californie-Los Angeles (UCLA).', 2018, 32, 31),
(13, 'Wonder', 'http://books.google.com/books/content?id=LiNHFPlLIrIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Ne jugez pas un livre sur sa couverture. Ne jugez pas un garçon sur son apparence. \' Je m\'appelle August. Je ne me décrirai pas. Quoi que vous imaginiez, c\'est sans doute pire. \' Né avec une malformation faciale, August, dix ans, n\'est jamais allé à l\'école. Aujourd\'hui, pour la première fois, ses parents l\'envoient au collège... Pourra-t-il convaincre les élèves qu\'il est comme eux ? Dans la lignée du Bizarre incident du chien pendant la nuit, un petit bijou de sensibilité et de drôlerie. Un roman irrésistible sur le destin peu ordinaire d\'August Pullman, un enfant différent. Traduit de l\'anglais (États-Unis) par Juliette Lê', 2013, 31, 66),
(14, 'Des comics et des hommes', NULL, 'fr', 1, 'Aux Etats-Unis, les comic books sont un secteur du monde de l\'édition et un phénomène culturel. C\'est dans les années 30, au cœur de la Dépression économique, qu\'apparurent les fascicules agrafés qui prirent le nom de \' comic books \', Jean-Paul Gabilliet retrace l\'épopée éditoriale de ces parutions, avec ses pics, ses crises, ses rebondissements et ses acteurs souvent hauts en couleurs. \'auteur nous emmène dans les coulisses commerciales et économiques d\'un secteur de l\'industrie culturelle en esquissant tout d\'abord une typologie des créateurs de comic books à travers le temps: leurs origines sociales, leurs formations scolaires, leurs combats (presque toujours vains) pour faire valoir leurs droits auprès d\'éditeurs seulement soucieux de rentabilité. Puis, à partir d\'une batterie d\'enquêtes et de sondages dont les plus anciens remontent aux années 20, il répond à la question: \' Qui lit des comic books?\' Enfin, il précise la position de la bande dessinée dans la hiérarchie culturelle aux Etats-Unis : les discours de censure contre les illustrés, stridents au cœur de la guerre froide et plus insidieux aujourd\'hui. Pour les curieux et ls collectionneurs, le livre contient aussi eux bandes dessinées, l\'une fantastique, l\'autre sentimentale, reproduites en noir et blanc à partir de leurs planches originales. Des Comics et des hommes est un ouvrage grand public qui pourra s\'avérer extrêmement utile aux chercheurs francophones désireux d\'approfondir leur connaissance de ce domaine encore peu exploré de l\'histoire culturelle américaine.', 2005, 22, 1),
(15, 'Leconte fait son cinéma', 'http://books.google.com/books/content?id=FYs7EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Joub et Nicoby sont de grands admirateurs de Patrice Leconte, à qui l\'on doit Les bronzés, Tandem, Ridicule et tant d\'autres films aussi réussis que différents. Le duo de Dans l\'atelier de Fournier est donc parti à la rencontre du réalisateur, égrenant avec lui un parcours jalonné de films à succès, de rencontres avec des stars mais aussi de doutes, de critiques assassines, de malentendus et même... de BD, puisque Leconte est lui-même dessinateur ! Leconte fait son cinéma : une conversation dessinée pleine de passion et d\'émotion !', 2021, 23, 57),
(16, 'La vie nocturne des arbres', NULL, 'fr', 1, 'Entièrement fabriqué à la main, cet ouvrage - au tirage limité et dont chaque exemplaire est numéroté - reproduit en sérigraphie des oeuvres originales d\'artistes Gond (centre de l\'Inde). Un véritable hymne aux arbres où chaque image s\'accompagne d\'un texte qui emmènera les lecteurs - petits et grands - dans le riche univers imaginaire et mythique de cette tribu de la forêt.', 2013, 1, 16),
(17, 'La voleuse de fruits', 'http://books.google.com/books/content?id=ekEgEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Relu par l\'auteur', 2021, 32, 10),
(18, 'Les couples heureux ont leurs secrets', NULL, 'en', 1, 'Le docteur Gottman est l\'inventeur d\'une nouvelle science de l\'amour. De sa recherche, menée avec les moyens d\'investigation les plus modernes, il a mis au point une méthode qui permet de déterminer la qualité d\'un mariage, ses aspects positifs et négatifs, son horizon de longévité. Dans cet ouvrage écrit en collaboration avec Nan Silver, il livre ici les secrets de son expertise qui sont aussi ceux d\'une union heureuse et durable.', 2010, 1, 1),
(19, 'Je T\'aimerai Toujours', 'http://books.google.com/books/content?id=veG7xwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Booksellers have sold more than 30 million copies of Love You Forever in paperback and hardcover. Now we have a French-language board version, printed on light, crisp whiteboard and slightly reduced for child-sized hands. Yet it contains every word of the original, which is much-loved by grandparents and parents everywhere. A young mother holds her baby, and while she sings to it she rocks it back and forth. And through her life, and the stages of his life, she holds her son and rocks him back and forth as she tells him that she will love him forever. Softly she sings to him: \'I\'ll love you forever I\'ll like you for always As long as I\'m living My baby you\'ll be.\' The English-language board version is EAN 9780228101048.', 2019, 31, 49),
(20, 'Le métier de libraire', NULL, 'fr', 1, '...', 2008, 1, 1),
(21, 'Bonsoir lune', 'http://books.google.com/books/content?id=R4QGAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 1, 'Le rituel du coucher permet de retrouver le calme en disant bonsoir à tous les objets domestiques.', 1996, 31, 28),
(22, 'Comment se faire des amis', 'http://books.google.com/books/content?id=GNhmBAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Nos relations avec les autres sont déterminantes pour notre qualité de vie ! La facilité de contact est un puissant moteur de succès : être recherché pour ses qualités humaines, créer la sympathie, faire passer ses idées, savoir motiver, corriger sans gâcher une relation de travail... Cela s’apprend ! Ce livre, utile à tous les âges et dans tous les métiers, vous donnera tous les conseils pour développer des relations humaines de qualité, nécessaires à l’efficacité professionnelle et personnelle. Dale Carnegie, leader mondial de la formation continue, est spécialisé dans les entraînements à la communication, au leadership, à la vente, au management et à la prise de parole en public. C’est la source la plus crédible dans ces domaines.', 2013, 10, 61),
(23, 'Devine combien je t\'aime', 'http://books.google.com/books/content?id=gtxDPAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Je t\'aime grand comme ça, haut comme ça, jusqu\'au bout des orteils, aussi loin que... Une déclaration d\'amour pleine de charme et de jeunesse d\'un petit lièvre à un grand, d\'un fils à son père.', 1998, 26, 22),
(24, 'Ecryme', NULL, 'en', 1, '...', 2018, 1, 1),
(25, 'Un rien peut tout changer', 'http://books.google.com/books/content?id=D1yWDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Les gens pensent que pour modifier le cours de leur vie, ils doivent faire de grands changements. Dans ce livre, ils découvriront que les plus petits changements couplés à une bonne connaissance de la psychologie et des neurosciences peuvent avoir un effet révolutionnaire sur leur existence et leurs relations.', 2019, 17, 32),
(26, 'C\'est Bon de Faire des Bonds', 'http://books.google.com/books/content?id=ZgzJsgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'THE BELOVED ILLUSTRATIONS OF DR. SEUSS PLUS AN ALL-NEW FRENCH TRANSLATION Publi�e en anglais sous le titre original Hop on Pop, cette nouvelle traduction fran�aise restitue avec bonheur l\'univers des contes du Dr.Seuss, avec ses jeux jubilatoires sur les mots et les sons. C\'est Bon de faire des Bonds est un premier livre id�al pour tous ceux qui d�butent le fran�ais. Les enfants comme les parents s\'amuseront au fil des pages � d�couvrir les personnages improbables et hilarants du Dr.Seuss, ses illustrations d�sormais c�l�bres et le texte qui ne cesse de jongler avec les mots : \'Tonton sur un b�ton\', des \'poissons polissons\' ou une \'souris qui sourit\'. C\'est Bon de faire des Bonds amusera tous les jeunes �coliers qui s\'initient au fran�ais, � son vocabulaire et � sa prononciation. Une base ludique et originale pour d�marrer la lecture de cette nouvelle langue !', 2015, 31, 1),
(27, 'Comment Capturer Un Farfadet', 'http://books.google.com/books/content?id=_oOGswEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 1, '\'À petits pas, silencieusement, des enfants tentent de capturer un farfadet qui s\'est immiscé dans leur demeure. Mais la créature est futée et ne se laissera pas facilement attraper... Ni la trappe, ni le filet, ni la cage ne fonctionne. Il ne reste donc plus qu\'une solution : transformer la maison en piège géant! Un livre amusant sur les créatures imaginaires du folklore irlandais!\'--Résumé de l\'éditeur.', 2018, 3, 3),
(28, 'Chroniques oubliées : fantasy : Anathazerïn', NULL, 'en', 1, '...', 2015, 1, 1),
(29, 'Le seigneur des anneaux', 'http://books.google.com/books/content?id=qgW5PAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Avec \' Le Retour du Roi \' s\'achèvent dans un fracas d\'apocalypse les derniers combats de la guerre de l\'Anneau. Tandis que le continent se couvre de ténèbres, annonçant pour le peuple des Hobbits l\'aube d\'une ère nouvelle, Frodon poursuit son entreprise. Alors qu\'il n\'a pu franchir la Porte Noire, il se demande comment atteindre le Mont du Destin. Peut-être est-il trop tard : le Seigneur des Ténèbres mobilise ses troupes. Les Rohirrim n\'ont plus le temps d\'en finir avec le traître assiégé dans l\'imprenable tour d\'Orthanc ; ils doivent se rassembler pour faire face à l\'ennemi. Tentant une fois de plus sa chance, Frodon passe par le Haut Col, où il sera livré à l\'abominable Arachné. Survivra-t-il à son dangereux périple à travers le Pays Noir ?', 2002, 1, 46),
(30, 'Le chat chapeauté', NULL, 'fr', 1, 'Par un jour de pluie, Sally et son frère s\'ennuient, s\'ennuient... jusqu\'à l\'arrivée du Chat Chapeauté, qui sème la pagaille dans toute la maisonnée. Que faire ? Laisser le Chat Chapeauté jouer les fauteurs de trouble, ou bien le renvoyer ?', 2016, 1, 1),
(31, 'Conversations entre amis', 'http://books.google.com/books/content?id=flDqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Dublin, de nos jours. Frances et Bobbi, deux anciennes amantes devenues amies intimes, se produisent dans la jeune scène artistique irlandaise comme poètes-performeuses. Un soir, lors d\'une lecture, elles rencontrent Melissa, une photographe plus âgée qu\'elles, mariée à Nick, un acteur. Ensemble, ils discutent, refont le monde, critiquent le capitalisme comme les personnages de Joyce pouvaient, en leur temps, critiquer la religion. Ils font des photographies, ils écrivent, ils vivent. C\'est le début d\'une histoire d\'amitié, d\'une histoire de séduction menant à un \' mariage à quatre \' où la confusion des sentiments fait rage : quand Frances tombe follement amoureuse de Nick et vit avec lui une liaison torride, elle menace soudainement l\'équilibre global de leur amitié. Mais Conversations entre amis n\'est pas qu\'une banale histoire d\'adultère : c\'est avant tout le portrait attachant, empathique, des jeunes gens contemporains, ces millenials qui ne parviennent pas à trouver leur place dans le monde que leur ont laissé leurs aînés. La voix de Frances, poétique, désinvolte, parfois naïve, d\'une extraordinaire fraîcheur est, par de multiples aspects, celle de sa génération. Traduit de l\'anglais (Irlande) par Laetitia Devaux.', 2019, 20, 31),
(32, 'Tika Tika Boum Boum!', 'http://books.google.com/books/content?id=g5obvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'See below for English description. Ce classique séduit depuis plus de vingt ans les enfants partout à travers le monde. Il a été traduit à la demande générale. Les lettres de l\'alphabet se rejoignent au sommet du cocotier jusqu\'à ce que. oh non! Elles tombent toutes en bas. Une comptine rythmée et amusante avec laquelle les enfants d\'âge préscolaire pourront apprendre l\'alphabet. In this lively alphabet rhyme, all the letters of the alphabet race each other up the coconut tree. Will there be enough room? Oh, no - Tika Tika Boum! Boum! The well-known authors of Barn Dance and Knots on a Counting Rope have created a rhythmic alphabet chant that rolls along on waves of fun. Lois Ehlert\'s rainbow of bright, bold, cheerful colours makes the merry parade of letters unforgettable. Original title: Chicka Chicka Boom Boom', 2017, 16, 55),
(33, 'La fille qui court', NULL, 'fr', 1, '...', 2020, 1, 1),
(34, 'Maus', NULL, 'fr', 1, '...', 2019, 1, 1),
(35, 'Ici', NULL, 'en', 1, '...', 2020, 1, 1),
(36, 'La chenille qui fait des trous', NULL, 'fr', 1, '...', 2019, 1, 1),
(37, 'Ours brun, dis-moi ce que tu vois ?', NULL, 'fr', 1, 'Ours Brun, dis-moi ce que tu vois ? Je vois un oiseau rouge, un cheval bleu... Un imagier pour apprendre les couleurs.', 2013, 34, 1),
(38, 'Le livre du rien', NULL, 'fr', 1, '...', 2020, 1, 1),
(39, 'Gallant', NULL, 'fr', 1, '...', 2022, 1, 1),
(40, 'Système 1 / Système 2. Les deux vitesses de la pensée', 'http://books.google.com/books/content?id=xqWICwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Comment prenons-nous nos décisions ? Qu’est-ce qui guide nos préférences et nos jugements ? Quand faut-il faire confiance à notre intuition ? Tels sont les fils rouges de cet ouvrage, dans lequel Daniel Kahneman nous emmène à la rencontre étonnante des deux « personnages » qui se partagent notre esprit. Le « Système 1 » est rapide, intuitif et émotionnel ; le « Système 2 » est lent, réfléchi et logique. Via de multiples expériences auxquelles le lecteur est invité à s’essayer lui-même, Daniel Kahneman expose les ravages des partis pris et autres biais cognitifs dont nous sommes les jouets : illusion de familiarité, effet de halo, biais optimiste, effet d’ancrage... Fruit de toute une vie de recherche, Système 1 / Système 2 dessine une théorie brillante qui offre des prolongements pratiques immédiats dans la vie quotidienne et professionnelle.', 2016, 27, 17),
(41, 'Un rien peut tout changer', 'http://books.google.com/books/content?id=D1yWDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Les gens pensent que pour modifier le cours de leur vie, ils doivent faire de grands changements. Dans ce livre, ils découvriront que les plus petits changements couplés à une bonne connaissance de la psychologie et des neurosciences peuvent avoir un effet révolutionnaire sur leur existence et leurs relations.', 2019, 17, 32),
(42, 'Nos étoiles contraires', 'http://books.google.com/books/content?id=nJiUvMO1gFUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Entre rire et larmes, le destin bouleversant de deux amoureux de la vie. Hazel, 16 ans, est atteinte d\'un cancer. Son dernier traitement semble avoir arrêté l\'évolution de la maladie, mais elle se sait condamnée. Bien qu\'elle s\'y ennuie passablement, elle intègre un groupe de soutien, fréquenté par d\'autres jeunes malades. C\'est là qu\'elle rencontre Augustus, un garçon en rémission, qui partage son humour et son goût de la littérature. Entre les deux adolescents, l\'attirance est immédiate. Et malgré les réticences d\'Hazel, qui a peur de s\'impliquer dans une relation dont le temps est compté, leur histoire d\'amour commence... les entraînant vite dans un projet un peu fou, ambitieux, drôle et surtout plein de vie. . Élu \' Meilleur roman 2012 \' par le Time Magazine ! Prix de L\'Échappée Lecture 2014 de la Nièvre Prix du Jury littéraire Giennois 2014 Prix Plaisirs de lire 2014, département de l\'Yonne Prix des Embouquineurs 2014 Prix Farniente 2015 (Belgique) Prix Les goûts et les couleurs 2015 CANOPE - Académie de Rennes Prix des Incorruptibles 2015', 2013, 31, 53),
(43, 'La fille qui court', NULL, 'fr', 1, '...', 2020, 1, 1),
(44, '1984', 'http://books.google.com/books/content?id=BFZlEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Winston Smith, obscur tâcheron au ministère de la Vérité, réécrit le passé et envoie dûment dans le vide-mémoire les documents devenus obsolètes. Le Parti a toujours raison et aucun fait ne doit le contredire. Comment penser, aimer, savourer la beauté ou dire que deux et deux font quatre dans un État qui a pris le contrôle de la réalité, de votre mémoire, de votre langue même ? La meilleure dystopie du XXe siècle, dans une nouvelle traduction illustrée.', 2021, 36, 32),
(45, 'Et ils meurent tous les deux à la fin', 'http://books.google.com/books/content?id=ChZaDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, '\' Nous sommes au regret de vous informer que vous allez être frappé par une mort prématurée dans les prochaines vingt-quatre heures. Toute l\'équipe de Death-Cast est sincèrement désolée de vous perdre. Vivez pleinement cette journée, ok ? \' Le 5 septembre, un peu après minuit, Mateo et Rufus reçoivent chacun le funeste appel. Ils ne se connaissent pas, mais cherchent tous deux à se faire un nouvel ami en ce jour fi nal. Heureusement, il existe aussi une appli pour ça, Le Dernier Ami. Grâce à elle, Rufus et Mateo vont se rencontrer pour une ultime grande aventure : vivre toute une vie en une seule journée. \' Sublime et envoûtant ! \' Lauren OLIVER, auteure de Before I Fall', 2018, 31, 33),
(46, 'C\'est Bon de Faire des Bonds', 'http://books.google.com/books/content?id=ZgzJsgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'THE BELOVED ILLUSTRATIONS OF DR. SEUSS PLUS AN ALL-NEW FRENCH TRANSLATION Publi�e en anglais sous le titre original Hop on Pop, cette nouvelle traduction fran�aise restitue avec bonheur l\'univers des contes du Dr.Seuss, avec ses jeux jubilatoires sur les mots et les sons. C\'est Bon de faire des Bonds est un premier livre id�al pour tous ceux qui d�butent le fran�ais. Les enfants comme les parents s\'amuseront au fil des pages � d�couvrir les personnages improbables et hilarants du Dr.Seuss, ses illustrations d�sormais c�l�bres et le texte qui ne cesse de jongler avec les mots : \'Tonton sur un b�ton\', des \'poissons polissons\' ou une \'souris qui sourit\'. C\'est Bon de faire des Bonds amusera tous les jeunes �coliers qui s\'initient au fran�ais, � son vocabulaire et � sa prononciation. Une base ludique et originale pour d�marrer la lecture de cette nouvelle langue !', 2015, 31, 1),
(47, 'Qu\'avons-nous fait de nos rêves ?', 'http://books.google.com/books/content?id=_u7gnQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Dans la luxueuse berline qui l\'emmène à sa maison de disque, Bennie avale les paillettes d\'or censées réveiller sa libido en berne. Qu\'est devenu le jeune punk qui ne vivait que pour la musique et la scène ? Bientôt, son groupe sera de nouveau réuni. A ce tournant de leurs vies, si éloignées de leurs rêves de jeunesse, Bennie, Lou, Bosco et Marty s\'interrogent...', 2013, 32, 2),
(48, 'Comment Capturer Un Farfadet', 'http://books.google.com/books/content?id=_oOGswEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 1, '\'À petits pas, silencieusement, des enfants tentent de capturer un farfadet qui s\'est immiscé dans leur demeure. Mais la créature est futée et ne se laissera pas facilement attraper... Ni la trappe, ni le filet, ni la cage ne fonctionne. Il ne reste donc plus qu\'une solution : transformer la maison en piège géant! Un livre amusant sur les créatures imaginaires du folklore irlandais!\'--Résumé de l\'éditeur.', 2018, 3, 3),
(49, 'Conversations entre amis', 'http://books.google.com/books/content?id=flDqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Dublin, de nos jours. Frances et Bobbi, deux anciennes amantes devenues amies intimes, se produisent dans la jeune scène artistique irlandaise comme poètes-performeuses. Un soir, lors d\'une lecture, elles rencontrent Melissa, une photographe plus âgée qu\'elles, mariée à Nick, un acteur. Ensemble, ils discutent, refont le monde, critiquent le capitalisme comme les personnages de Joyce pouvaient, en leur temps, critiquer la religion. Ils font des photographies, ils écrivent, ils vivent. C\'est le début d\'une histoire d\'amitié, d\'une histoire de séduction menant à un \' mariage à quatre \' où la confusion des sentiments fait rage : quand Frances tombe follement amoureuse de Nick et vit avec lui une liaison torride, elle menace soudainement l\'équilibre global de leur amitié. Mais Conversations entre amis n\'est pas qu\'une banale histoire d\'adultère : c\'est avant tout le portrait attachant, empathique, des jeunes gens contemporains, ces millenials qui ne parviennent pas à trouver leur place dans le monde que leur ont laissé leurs aînés. La voix de Frances, poétique, désinvolte, parfois naïve, d\'une extraordinaire fraîcheur est, par de multiples aspects, celle de sa génération. Traduit de l\'anglais (Irlande) par Laetitia Devaux.', 2019, 20, 31),
(50, 'Pourquoi la guerre ?', 'http://books.google.com/books/content?id=FJQjCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Texte intégral révisé suivi des biographies d\'Albert Einstein et de Sigmund Freud. Initié en 1932 par l\'Institut International de Coopération Intellectuelle de la Société des Nations (futur Unesco) — qui diffusait alors un discours humaniste afin de lutter contre la montée des nationalismes — \'Pourquoi la guerre ?\' est un échange de lettres entre Albert Einstein et Sigmund Freud. Le théoricien de la relativité, pacifiste convaincu et militant des droits de l\'homme, y interroge le fondateur de la psychanalyse sur les racines inconscientes de la guerre. Y-a-t-il quelque chose au coeur de l\'homme qui veut la guerre ? interroge Einstein, et existe-t-il une possibilité de lutter contre les psychoses collectives de haine et de destruction, peut-on éduquer l\'humanité afin de vivre dans un monde en paix ? Freud — qui s\'était déjà intéressé à cette problématique dès 1915 à travers ses \'Considérations actuelles sur la guerre et sur la mort\' et plusieurs études cliniques sur des cas de névroses de guerre — lui répond d\'abord en termes politiques sur la relation du droit et du pouvoir, puis aborde lucidement le thème de la Pulsion de mort. Pour lui, la guerre est le lieu où la pulsion de mort rencontre la puissance comme violence. S\'il existe un espoir de paix universelle où la psychanalyse aurait un rôle à jouer c\'est, dit-il, en renforçant Eros aux dépens de Thanatos, avant de conclure que \'Tout ce qui travaille au développement de la culture travaille aussi contre la guerre.\' Ce bref mais brillant échange épistolaire, publié simultanément en allemand, anglais et français en 1933 mais censuré immédiatement par l\'Allemagne nazie, reste hélas près d\'un siècle plus tard plus que jamais d\'actualité.', 2015, 5, 67),
(51, 'Sula', 'http://books.google.com/books/content?id=7LeVDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Au cœur de l’Amérique profonde, deux petites filles noires s’inventent une autre vie, plus riche, plus drôle, plus libre surtout que la dure réalité qui les entoure. Ainsi lient-elles une amitié qu’elles veulent définitive. L’âge venant, Sula, la rebelle, part rouler sa bosse dans les grandes villes alors que Nel, la sage, accomplit sa vocation de mère et d’épouse. Quarante ans après, elles font leurs comptes, s’opposent et incarnent chacune à leur manière la farouche énergie de la femme noire face aux hommes si vulnérables. De sa voix exceptionnelle, Toni Morrison recrée l’expérience de la communauté noire avec une grâce et une authenticité inoubliables.', 2015, 32, 15),
(52, 'Tika Tika Boum Boum!', 'http://books.google.com/books/content?id=g5obvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'See below for English description. Ce classique séduit depuis plus de vingt ans les enfants partout à travers le monde. Il a été traduit à la demande générale. Les lettres de l\'alphabet se rejoignent au sommet du cocotier jusqu\'à ce que. oh non! Elles tombent toutes en bas. Une comptine rythmée et amusante avec laquelle les enfants d\'âge préscolaire pourront apprendre l\'alphabet. In this lively alphabet rhyme, all the letters of the alphabet race each other up the coconut tree. Will there be enough room? Oh, no - Tika Tika Boum! Boum! The well-known authors of Barn Dance and Knots on a Counting Rope have created a rhythmic alphabet chant that rolls along on waves of fun. Lois Ehlert\'s rainbow of bright, bold, cheerful colours makes the merry parade of letters unforgettable. Original title: Chicka Chicka Boom Boom', 2017, 16, 55),
(53, 'Je m\'appelle Lucy Barton', 'http://books.google.com/books/content?id=TPIoDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'Hospitalisée à la suite d’une opération, Lucy Barton reçoit la visite impromptue de sa mère, avec laquelle elle avait perdu tout contact. Tandis que celle-ci se perd en commérages, convoquant les fantômes du passé, Lucy se trouve plongée dans les souvenirs de son enfance dans une petite ville de l’Illinois – la pauvreté extrême, honteuse, la rudesse de son père, et finalement son départ pour New York, qui l’a définitivement isolée des siens. Peu à peu, Lucy est amenée à évoquer son propre mariage, ses deux filles, et ses débuts de romancière dans le New York des années 1980. Une vie entière se déploie à travers le récit lucide et pétri d’humanité de Lucy, tout en éclairant la relation entre une mère et sa fille, faite d’incompréhension, d’incommunicabilité, mais aussi d’une entente profonde. Salué comme un chef-d’oeuvre par la critique littéraire aux États-Unis, Je m’appelle Lucy Barton est un grand roman contemporain sur la solitude, le désir et l’amour.', 2017, 32, 68),
(54, 'Gallant', NULL, 'fr', 1, '...', 2022, 1, 1),
(55, 'Le livre du rien', NULL, 'fr', 1, '...', 2020, 1, 1),
(56, 'Le Sang des bêtes', 'http://books.google.com/books/content?id=JLhREAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, '« Même si parfois la vie est difficile pour vous, vous n’avez aucune idée de ce que c’est que la sensation terrifiante d’être un animal dans le monde des humains. » « Thomas Gunzig est un fauve littéraire aux gestes féroces et déroutants. On devine que face à lui, les mots tremblent de trouille, et ils ont bien raison. » Hervé Le Tellier – Prix Goncourt 2020 « Drôle, tendre, cruel et politique, ce roman est un cadeau. Merci Thomas Gunzig. » Adeline Dieudonné', 2022, 32, 11),
(57, 'Sugar run', 'http://books.google.com/books/content?id=raK8DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'À trente-cinq ans, Jodi McCarty a passé la moitié de sa vie en prison. Condamnée à perpétuité, elle vient d’obtenir sa liberté conditionnelle. Elle part retrouver sa famille dans les collines pourpres des Appalaches, où un bout de terrain l’attend. Elle espère enfin construire sa vie. Mais avant de se tourner vers l’avenir, Jody doit faire un détour par le passé et tenir une promesse. En route vers le Sud, elle fait la rencontre de Miranda, une jeune mère désemparée qui fuit son mari. Mues par un coup de foudre électrique, les deux femmes décident de prendre ensemble un nouveau départ. Mais Jodi ne tarde pas à se heurter à un monde dans lequel les gens refusent d’oublier ou de changer.', 2020, 32, 29),
(58, 'Des fleurs pour Algernon', 'http://books.google.com/books/content?id=QUo6AAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Algernon est une souris de laboratoire dont le traitement du Pr Nemur et du Dr Strauss vient de décupler l\'intelligence. Enhardis par cette réussite, les deux savants tentent alors, avec l\'assistance de la psychologue Alice Kinnian, d\'appliquer leur découverte à Charlie Gordon, un simple d\'esprit employé dans une boulangerie. C\'est bientôt l\'extraordinaire éveil de l\'intelligence pour le jeune homme. Il découvre un monde dont il avait toujours été exclu, et l\'amour qui naît entre Alice et lui achève de le métamorphoser. Mais un jour, les facultés supérieures d\'Algernon déclinent. Commence alors pour Charlie le drame atroce d\'un homme qui, en pleine conscience, se sent retourner à l\'état de bête...', 2001, 1, 43),
(59, 'L\'arbre généreux', 'http://books.google.com/books/content?id=ChQCAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 1, 'Par amour pour un petit garçon, un arbre lui donne au fil des années, ses fruits, ses feuilles, ses branches... jusqu\'à son tronc !', 1982, 37, 28),
(60, 'Les Aventures potagères du concombre masqué', 'http://books.google.com/books/content?id=Uk6kDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 1, 'En 1971 « Pif » publie une petite plaquette à l’italienne d’un dénommé Kalkus. Il s’agissait de la première édition des premières aventures d’un personnage né en 1965 et qui allait devenir mythique : Le Concombre masqué. Mosquito propose la réédition en fac-similé de ce monument de la bande dessinée, Mandryka a ajouté une postface dans laquelle il précise -à sa manière- la genèse du légumineux.', 2016, 15, 69),
(61, 'Un Jour, Tu Découvriras...', 'http://books.google.com/books/content?id=tJ7pvwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'See below for English description. Plusieurs raisons expliquent pourquoi certaines personnes se sentent différentes des autres. Peut-être est-ce à cause de leur apparence physique ou de leur façon de parler, de leur nourriture ou de n\'importe quel autre détail. Dans tous les cas, il n\'est pas toujours facile de faire ses premiers pas dans un environnement où l\'on ne connaît personne, et pourtant, c\'est bien nécessaire. Le texte percutant de Jacqueline Woodson et les somptueuses illustrations de Rafael López démontrent avec brio que tout le monde se sent parfois étranger et qu\'il faut du courage pour continuer son chemin malgré ce sentiment. Cet album prouve également que de bonnes choses peuvent arriver lorsque l\'on ose enfin s\'ouvrir aux autres! There are many reasons to feel different. Maybe it\'s how you look or talk, or where you\'re from; maybe it\'s what you eat, or something just as random. It\'s not easy to take those first steps into a place where nobody really knows you yet, but somehow you do it. Jacqueline Woodson\'s lyrical text and Rafael López\'s dazzling art reminds us that we all feel like outsiders sometimes - and how brave it is that we go forth anyway. And that sometimes, when we reach out and begin to share our stories, others will be happy to meet us halfway. Original title: The Day You Begin', 2019, 1, 3),
(62, 'La chenille qui fait des trous', NULL, 'fr', 1, '...', 2019, 1, 1),
(63, 'Parallèlement', 'http://books.google.com/books/content?id=M7nHtr6lAuMC&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 1, '...', 1914, 1, 1),
(64, 'Ours brun, dis-moi ce que tu vois ?', NULL, 'fr', 1, 'Ours Brun, dis-moi ce que tu vois ? Je vois un oiseau rouge, un cheval bleu... Un imagier pour apprendre les couleurs.', 2013, 34, 1),
(65, 'Votre Experience Personnelle Avec Dieu', NULL, 'en', 1, '...', 2000, 11, 34),
(66, 'La servante écarlate', NULL, 'fr', 1, 'La servante écarlate, c\'est Defred, une entreprise de salubrité publique à elle seule. En ces temps de dénatalité galopante, elle doit mettre au service de la république de Gilead, récemment fondée par des fanatiques religieux, son attribut le plus précieux : sa matrice. Vêtue d\'écarlate, à l\'exception des voiles blancs de sa cornette, elle accomplit sa tâche comme une somnambule. Doit-elle céder à la révolte, tenter de tromper le système ? Le soir, Defred regagne sa chambre à l\'austérité monacale. Elle songe au temps où les femmes avaient le droit de lire, d\'échanger des confidences, de dépenser de l\'argent, d\'avoir un travail, un nom, des amants... C\'était le temps où l\'amour était au centre de tout. L\'amour, cette chose si douce aujourd\'hui punie de mort... Œuvre majeure, La Servante écarlate n\'est pas sans rappeler 1984 d\'Orwell. Mais, au-delà de cette magistrale création d\'un monde, c\'est la question du rôle et de l\'avenir des femmes que pose, avec force, ce roman inoubliable.', 2005, 1, 5),
(67, 'Optimisez votre équipe', NULL, 'fr', 1, 'Dans Optimisez votre équipe, Patrick Lencioni transpose son intelligence pénétrante et son pouvoir de conteur dans le monde fascinant et complexe des groupes de travail. Kathryn Petersen, la PDG de DecisionTech, est confrontée à la crise suprême en matière de leadership : l\'unification d\'une équipe qui se trouve dans un tel état de détresse quelle risque de détruire l\'entreprise tout entière. Réussira-t-elle? Sera-t-elle congédiée? Une entreprise s\'effondrera-t-elle? Dans cette fable fascinante et intemporelle, Patrick Lencioni nous rappelle que le leadership exige autant de courage que d\'intuition. À travers ce récit, l\'auteur nous révèle les cinq dysfonctions qui font que les équipes, même les meilleures, se retrouvent souvent en difficulté. Il expose un modèle puissant et des étapes pratiques pour surmonter ces barrières courantes et pour constituer une équipe qui sera caractérisée par la cohésion et l\'efficacité. Patrick Lencioni a une fois de plus écrit une fable irrésistible empreinte d\'un message en apparence simple, mais néanmoins puissant, à l\'intention de tous ceux qui s\'efforcent d\'être des chefs d\'équipe exceptionnels.', 2005, 38, 70),
(68, 'Le garçon qui n\'arrêtait pas de se laver', NULL, 'en', 1, 'A quatorze ans, Charles passe chaque jour plus de trois heures sous la douche ; il lui faut deux heures de plus pour s\'habiller. Il souffre de troubles obsessionnels compulsifs. Cette maladie étrange est aussi une affection secrète : les obsessionnels compulsifs exécutent leurs rituels à l\'abri du regard des autres, ne parlent jamais de ce qu\'ils endurent et sont toujours étonnés d\'apprendre que des centaines de milliers de personnes sont atteintes de la même affection qu\'eux. En compagnie de leur médecin, le docteur Rapoport, ils prennent ici la parole et nous convient à un voyage dans leur monde intérieur, ainsi qu\'à une réflexion sur les origines possibles d\'un mai que l\'on commence seulement à pouvoir soigner.', 2001, 1, 1),
(69, 'Pierre Lapin', NULL, 'en', 1, 'Quatre petits lapins partent en promenade à travers champs. Leur maman leur a interdit d\'entrer dans le jardin du terrible Monsieur McGregor, mais Pierre Lapin a envie de désobéir... [Gallimard.fr]', 2002, 19, 10);
INSERT INTO `Book` (`id`, `title`, `picture`, `language`, `nbr_pages`, `resume`, `year`, `category`, `editor`) VALUES
(70, 'Métro Place Monge (édition gros caractères)', 'http://books.google.com/books/content?id=iA7IywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Et si le voyage dans le temps était une histoire de famille ? Il y a près de trente ans, Emma a subi un choc qui a effacé de sa mémoire les deux jours qui ont précédé l\'accident. Elle va enfin se souvenir, et bien plus encore... Ce matin, je me suis réveillée aux côtés de celui qui deviendra un peu plus tard mon premier époux. J\'ignore si je rêve, pour combien de temps je suis là ou si je dois revivre encore toutes ces vingt-huit années... Je sais aussi que le jeune homme apparemment inoffensif qui dort encore près de moi est toxique, manipulateur et violent, mais qu\'il me faudra encore plusieurs années avant d\'en prendre pleinement conscience et oser enfin le quitter. Après nous avoir fait découvrir la Suède dans son premier roman, Saga, l\'ours de Dalécarlie, l\'auteure nous emmène cette fois dans un voyage au coeur du Paris des années quatre-vingt. Au-delà de l\'intrigue, Métro Place Monge est une réflexion sur différents thèmes tels que le Grand Amour, la paternité et la vengeance.', 2019, 1, 1),
(71, 'Le signe des Quatre', 'http://books.google.com/books/content?id=n9uatAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Deuxième aventure du célèbre détective Sherlock Holmes en compagnie du docteur Watson qui devient amoureux. [SDM].', 1995, 18, 47),
(72, 'La fuite du cerveau', NULL, 'fr', 1, '...', 2020, 1, 1),
(73, 'Esclave pendant douze ans', NULL, 'fr', 1, '\'Je suis né libre et j\'ai vécu avec ma famille jusqu\'au jour où deux hommes m\'ont drogué, séquestré et vendu comme esclave. Pendant douze ans, j\'ai connu la servitude et l\'humiliation. Dormant à même le sol, affamé, fouetté, j\'ai failli sombrer dans la folie, mais je n\'ai jamais laissé la cruauté me briser. Depuis ma libération, des romans se sont intéressés à l\'esclavage, et ont connu une diffusion sans précédent. Je partage dans ces pages mon expérience personnelle. Mon objectif est d\'en faire un récit sincère et fidèle, et laisse aux autres le soin de décider ce qui, de la fiction ou de la réalité, donne l\'image de l\'injustice la plus cruelle ou de l\'aliénation la plus sévère\'.', 2014, 7, 7),
(74, 'Me-Ti, livre des retournements', NULL, 'en', 1, '...', 1968, 1, 1),
(75, 'Business Model nouvelle génération', NULL, 'en', 1, 'Comment se positionner dans un paysage extrêmement concurrentiel ? Comment transformer ses idées en modèles économiques révolutionnaires ? Un guide pour visionnaires et challengers impatients de se lancer et de concevoir les entreprises de demain. + le poster. La matrice du modèle économique clé en main pour décrire, visualiser, évaluer et transformer les modèles économiques.', 2017, 1, 1),
(76, 'Le pouvoir de la vulnérabilité', NULL, 'en', 1, 'Nous avons en horreur la vulnérabilité. Nous voulons être parfaits, puissants, sûrs de nous. Nous croyons que la distance, la froideur, l\'inaccessibilité et la maîtrise contribuent à notre prestige. Que nous serions mésestimés si nous venions à être trop ouverts. Nous adoptons l\'anxiété en tant que style de vie, la productivité en tant que valeur essentielle, et le perfectionnisme en tant qu\'idéal. Et si la vulnérabilité n\'était pas une faiblesse, mais au contraire signe de force et de courage ? Car à trop vouloir être parfaits, nous avons peur de l\'échec et éprouvons un sentiment d\'insuffisance. Nous endossons notre armure avant de pénétrer dans l\'arène de la vie, en sacrifiant des relations et des opportunités qui ne reviendront pas. Nous gaspillons un temps précieux en tournant le temps à nos dons merveilleux. Alors plutôt que de rester assis sur le banc de touche, et d\'émettre sans cesse des jugements et des conseils, mieux vaut oser se découvrir et accepter d\'être vulnérable. Vivre de manière entière, en troquant le culte du contrôle contre le lâcher-prise et l\'ouverture émotionnelle. Oser être vulnérable, c’est cela le courage.', 2014, 1, 1),
(77, 'Ces femmes incroyables qui ont changé le monde', NULL, 'fr', 1, 'De Coco Chanel à Anne Frank, en passant par Marie Curie, Frida Kahlo ou encore Jane Austen, cet ouvrage merveilleusement illustré dresse le portrait de 13 femmes qui ont marqué l\'Histoire.', 2016, 1, 1),
(78, 'Le chat chapeauté', NULL, 'fr', 1, 'Par un jour de pluie, Sally et son frère s\'ennuient, s\'ennuient... jusqu\'à l\'arrivée du Chat Chapeauté, qui sème la pagaille dans toute la maisonnée. Que faire ? Laisser le Chat Chapeauté jouer les fauteurs de trouble, ou bien le renvoyer ?', 2016, 1, 1),
(79, 'Fiction', NULL, 'fr', 1, 'Dans les histoires d\'E. Welty, on bascule tranquillement du quotidien ou du banal dans le drame, la folie ou le féerique.', 2000, 1, 1),
(80, 'Rester en vie', 'http://books.google.com/books/content?id=HanlDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 183, 'À 24 ans, souffrant d\'anxiété et de dépression, au cours d\'un séjour en Espagne, Matt Haig s\'est retrouvé au bord d\'une falaise, les pieds à moitié dans le vide, sur le point de se précipiter... Rester en vie... cela paraît si difficile à celles et ceux qui sont au fond de l\'abîme, qui ne voient poindre aucune lueur.', 2016, 8, 36),
(81, 'Journal d\'un dégonflé - tome 13 Totalement givré', 'http://books.google.com/books/content?id=aPd0DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 224, 'Toute la ville est coincée par la neige. Le collège est fermé ! Une gigantesque bataille de boules de neige se prépare. Les bandes s\'organisent. Et tous les coups sont permis ! Greg et son copain Robert parviendront-ils à rester au chaud en attendant la fin des hostilités ? Ou deviendront-ils, malgré eux, les héros de l\'hiver ?', 2018, 31, 31),
(82, 'Les tribulations d\'Arthur Mineur', 'http://books.google.com/books/content?id=mot5DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 255, 'Prix Pulitzer 2018. Arthur Mineur est en pleine crise existentielle. 50 ans, célibataire, il est l’auteur d’un roman qui l’a fait connaître, mais il n’a, depuis, publié que des livres au succès mitigé. Le jour où il reçoit un carton lui annonçant le mariage de son ex-compagnon, il décide, pour y échapper, d’accepter les invitations d’obscurs festivals de littérature dans différents pays. C’est le début d’un périple littéraire, sentimental et humain autour du monde... Un roman où les difficultés et les obstacles de la vie se changent en bulles humoristiques à l’extraordinaire et salvatrice légèreté. 200 000 exemplaires vendus aux Etats-Unis.', 2019, 20, 59),
(83, 'Votre Experience Personnelle Avec Dieu', NULL, 'en', 272, '...', 2000, 11, 34),
(84, 'La fuite du cerveau', NULL, 'fr', 192, '...', 2020, 1, 1),
(85, 'L\'art subtil de s\'en foutre', 'http://books.google.com/books/content?id=Vg4oDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 197, 'Un livre de développement personnel pour ceux qui détestent le développement personnel Le discours ambiant nous pousse sans cesse à nous améliorer. Sois plus heureux. Sois en meilleure santé. Sois plus intelligent, plus rapide, plus riche, plu', 2017, 25, 13),
(86, 'Ne tirez pas sur l\'oiseau moqueur', 'http://books.google.com/books/content?id=YKk-GQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 0, 'Dans une petite ville d\'Alabama, à l\'époque de la Grande Dépression, Atticus Finch élève seul ses deux enfants, Jem et Scout. Avocat intègre et rigoureux, il est commis d\'office pour défendre un Noir accusé d\'avoir violé une Blanche. Racontée par Scout avec beaucoup de drôlerie, cette histoire tient du conte, de la court story américaine et du roman initiatique.', 2006, 7, 23),
(87, 'Aujourd\'hui est un autre jour', 'http://books.google.com/books/content?id=XW9HDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 368, 'Aujourd’hui est un jour comme les autres pour Rhiannon. Alors pourquoi Justin, son petit ami d’ordinaire distant et lunatique, semble-t-il la voir pour la première fois ? Ensemble, ils vont vivre une journée parfaite - dont le garçon n’aura aucun souvenir le lendemain. Mais tout s’explique lorsque Rhiannon fait la rencontre d’A, qui lui raconte se réveiller chaque matin dans un corps différent et être tombé amoureux d’elle en occupant celui de Justin. Mais peut-on s’attacher à un garçon qui est chaque jour un autre ?', 2016, 31, 30),
(88, 'S\'il y a lieu je pars avec vous', NULL, 'fr', 175, '...', 2014, 1, 62),
(89, 'Le cinéma expressionniste', 'http://books.google.com/books/content?id=PzsRCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 229, 'Décors tourmentés, perspectives dépravées, expressivité des corps d’acteurs, jeux d’ombre et de lumière, sensations de fi n du monde... Pourquoi cet expressionnisme-là, celui du Cabinet du docteur Caligari, est-il resté si célèbre ? Mais pourquoi ce même expressionnisme ne peut-il établir aussi une liste immuable des films qui le composent, pourquoi doit-il toujours prouver sa validité, suspecté dès l’origine de n’exister que par abus de langage ? Cet ouvrage suppose l’inverse : non qu’une définition du phénomène soit aisée ou même possible (il existe toute une histoire, racontée ici, de cette aventure intellectuelle), mais que ce « mouvement » ou ce moment si contesté a joui d’une forme de postérité qui le prouve presque en retour. D’Orson Welles à Tim Burton, de Maya Deren à Kenneth Anger, de Blade Runner à David Lynch pour ne citer que quelques noms d’un seul continent, le cinéma expressionniste s’avère paradoxalement une des grandes virtualités accomplies du cinématographe. Depuis son origine jusqu’à aujourd’hui, il pose des questions d’esthétique, d’histoire, des questions qui dévoilent tout un pan du 7e art.', 2013, 1, 39),
(90, 'Là où chantent les écrevisses', 'http://books.google.com/books/content?id=_QrqDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 363, 'Traduit de l\'anglais (Etats-Unis) par Marc Amfreville Pendant des années, les rumeurs les plus folles ont couru sur \' la Fille des marais \' de Barkley Cove, une petite ville de Caroline du Nord. Pourtant, Kya n\'est pas cette fille sauvage et analphabète que tous imaginent et craignent. A l\'âge de dix ans, abandonnée par sa famille, elle doit apprendre à survivre seule dans le marais, devenu pour elle un refuge naturel et une protection. Sa rencontre avec Tate, un jeune homme doux et cultivé qui lui apprend à lire et à écrire, lui fait découvrir la science et la poésie, transforme la jeune fille à jamais. Mais Tate, appelé par ses études, l\'abandonne à son tour. La solitude devient si pesante que Kya ne se méfie pas assez de celui qui va bientôt croiser son chemin et lui promettre une autre vie. Lorsque l\'irréparable se produit, elle ne peut plus compter que sur elle-même... Delia Owens est née en 1949 en Géorgie, aux Etats-Unis. Diplômée en zoologie et biologie, elle a vécu plus de vingt ans en Afrique et a publié trois ouvrages consacrés à la nature et aux animaux, tous best-sellers aux USA. Là où chantent les écrevisses est son premier roman. Phénomène d\'édition, ce livre a déjà conquis des millions de lecteurs et poursuit son incroyable destinée dans le monde entier. Une adaptation au cinéma est également en cours. \' Un roman à la beauté tragique. \' The New York Times Book Review \' Une histoire déchirante, un hymne sublime à la nature et à la solitude. \' Entertainment Weekly \' Un premier roman magnifique. \' People', 2020, 20, 31),
(91, 'Cinquante nuances de grey', NULL, 'fr', 551, 'Roman érotique', 2012, 32, 63),
(92, 'Hooked : comment créer un produit ou un service qui ancre des habitudes', 'http://books.google.com/books/content?id=Rk1nDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 229, '\'Selon une étude universitaire, les gens consultent leur téléphone 34 fois par jour. Mais d\'après les spécialistes du secteur, on approcherait plutôt le chiffre sidérant de 150 consultations quotidienne. RECONNAISSONS-LE : NOUS SOMMES ACCROS !\' C\'est en ces termes que Nir Eyal touche du doigt la plus grande réussite marketing de ces dernières décennies. Au fil des pages il décrypte le mécanisme de l\'addiction à un produit ou à un service. Les neurosciences ont largement permis de comprendre le fonctionnement de notre cerveau et de jouer sur notre besoin de satisfaction. Cela se déroule en quatre étapes : 1. Déclencheurs 2. Récompense 3. Action 4. Investissement Vous êtes marketeur, créateur, entrepreneur ? Il vous dévoile le processus infaillible qui permettra de rendre votre client accro. Vous être client, utilisateur ? Vous comprendrez pourquoi vous ne pouvez plus vous passer de telle application, de tel service ou de tel produit.', 2018, 14, 13),
(93, 'Métro Place Monge (édition gros caractères)', 'http://books.google.com/books/content?id=iA7IywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 276, 'Et si le voyage dans le temps était une histoire de famille ? Il y a près de trente ans, Emma a subi un choc qui a effacé de sa mémoire les deux jours qui ont précédé l\'accident. Elle va enfin se souvenir, et bien plus encore... Ce matin, je me suis réveillée aux côtés de celui qui deviendra un peu plus tard mon premier époux. J\'ignore si je rêve, pour combien de temps je suis là ou si je dois revivre encore toutes ces vingt-huit années... Je sais aussi que le jeune homme apparemment inoffensif qui dort encore près de moi est toxique, manipulateur et violent, mais qu\'il me faudra encore plusieurs années avant d\'en prendre pleinement conscience et oser enfin le quitter. Après nous avoir fait découvrir la Suède dans son premier roman, Saga, l\'ours de Dalécarlie, l\'auteure nous emmène cette fois dans un voyage au coeur du Paris des années quatre-vingt. Au-delà de l\'intrigue, Métro Place Monge est une réflexion sur différents thèmes tels que le Grand Amour, la paternité et la vengeance.', 2019, 1, 1),
(94, 'Le garçon qui n\'arrêtait pas de se laver', NULL, 'en', 290, 'A quatorze ans, Charles passe chaque jour plus de trois heures sous la douche ; il lui faut deux heures de plus pour s\'habiller. Il souffre de troubles obsessionnels compulsifs. Cette maladie étrange est aussi une affection secrète : les obsessionnels compulsifs exécutent leurs rituels à l\'abri du regard des autres, ne parlent jamais de ce qu\'ils endurent et sont toujours étonnés d\'apprendre que des centaines de milliers de personnes sont atteintes de la même affection qu\'eux. En compagnie de leur médecin, le docteur Rapoport, ils prennent ici la parole et nous convient à un voyage dans leur monde intérieur, ainsi qu\'à une réflexion sur les origines possibles d\'un mai que l\'on commence seulement à pouvoir soigner.', 2001, 1, 1),
(95, 'Le signe des Quatre', 'http://books.google.com/books/content?id=n9uatAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 160, 'Deuxième aventure du célèbre détective Sherlock Holmes en compagnie du docteur Watson qui devient amoureux. [SDM].', 1995, 18, 47),
(96, 'Le soleil est pour toi', 'http://books.google.com/books/content?id=IV3JDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 496, 'Un livre lumineux, bouleversant, qui déborde de romantisme et de passion. Printz Medal 2015.', 2017, 31, 30),
(97, 'De l\'eau pour les éléphants', 'http://books.google.com/books/content?id=yusXPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 471, 'Ce roman pas comme les autres a une histoire exceptionnelle : en quelques mois, il a fait d’un auteur inconnu un véritable phénomène d’édition, le coup de coeur de l’Amérique. Durant la Grande Dépression, dans les années 1930, les trains des petits cirques ambulants sillonnent les États-Unis. Jacob Jankowski, orphelin sans le sou, saute à bord de celui des frères Benzini et de leur « plus grand spectacle du monde ». Embauché comme soigneur, il va découvrir l’envers sordide du décor. Tous, hommes et bêtes, sont pareillement exploités, maltraités.Sara Gruen fait revivre avec un incroyable talent cet univers de paillettes et de misère qui unit Jacob, Marlène la belle écuyère, et Rosie, l’éléphante que nul jusqu’alors n’a pu dresser, dans un improbable trio.Plus qu’un simple roman sur le cirque, De l’eau pour les éléphants est l’histoire bouleversante de deux êtres perdus dans un monde dur et violent où l’amour est un luxe.', 2009, 32, 58),
(98, 'Les sept maris d\'Evelyn Hugo', NULL, 'fr', 595, 'C\'est à vous, et à vous seule que s\'adresse cette confession... A l\'aube de ses quatre-vingts ans, Evelyn Hugo, légende du cinéma, est enfin prête à dire la vérité sur sa vie aussi glamour que scandaleuse. Mais quand cette actrice, vieillissante et solitaire, décrète qu\'elle fera ces révélations à Monique Grant, journaliste pour un obscur magazine, personne ne comprend son choix. La journaliste décide de saisir cette occasion pour lancer sa carrière. Elle écoute avec fascination l\'histoire de cette actrice mariée sept fois. Une histoire d\'ambition, d\'amitié et d\'amour défendu. A mesure qu\'elle recueille les confidences d\'Evelyn, la journaliste comprend que leurs destins sont étroitement liés... \' Un roman poignant, captivant, imprégné du glamour de la grande époque hollywoodienne. \' Buzzfeed \' Un conte envoûtant sur l\'histoire scandaleuse d\'une actrice qui ressemble à s\'y méprendre à Elizabeth Taylor. \' US Weekly \' Un livre qui fourmille d\'anecdotes savoureuses sur les années fastes d\'Hollywood. \' People \' On se laisse tenter par l\'ambiance de l\'âge d\'or d\'Hollywood et on succombe à la rencontre émouvante d\'une jeune journaliste et d\'une icône du cinéma. \' Cosmopolitan \' L\'itinéraire tumultueux de cette star solitaire s\'accompagne de rebondissements inattendus. Une lecture captivante. \' PopSugar \' Un roman envoûtant sur l\'amour, le glamour et la rançon de la gloire. \' Emily Giffin (payot.ch)', 2019, 1, 1),
(99, 'Esclave pendant douze ans', NULL, 'fr', 299, '\'Je suis né libre et j\'ai vécu avec ma famille jusqu\'au jour où deux hommes m\'ont drogué, séquestré et vendu comme esclave. Pendant douze ans, j\'ai connu la servitude et l\'humiliation. Dormant à même le sol, affamé, fouetté, j\'ai failli sombrer dans la folie, mais je n\'ai jamais laissé la cruauté me briser. Depuis ma libération, des romans se sont intéressés à l\'esclavage, et ont connu une diffusion sans précédent. Je partage dans ces pages mon expérience personnelle. Mon objectif est d\'en faire un récit sincère et fidèle, et laisse aux autres le soin de décider ce qui, de la fiction ou de la réalité, donne l\'image de l\'injustice la plus cruelle ou de l\'aliénation la plus sévère\'.', 2014, 7, 7),
(100, 'Harry Potter et le Prisonnier d\'Azkaban', 'http://books.google.com/books/content?id=vWxokFDTpy4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 493, 'Sirius Black, le dangereux criminel qui s’est échappé de la forteresse d’Azkaban, recherche Harry Potter. C’est donc sous bonne garde que l’apprenti sorcier fait sa troisième rentrée. Au programme : des cours de divination, la fabrication d’une potion de Ratatinage, le dressage des hippogriffes... Mais Harry est-il vraiment à l’abri du danger qui le menace? Le troisième tome des aventures de Harry Potter vous emportera dans un tourbillon de surprises et d’émotions. Frissons et humour garantis!', 2015, 31, 12),
(101, 'La voix du couteau', NULL, 'en', 544, '...', 2021, 1, 30),
(102, 'Le Livre de la joie. Le bonheur durable dans un monde en mouvement', 'http://books.google.com/books/content?id=C1nlDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 355, '\'Nous nous sommes retrouvés à Dharamsala pour partager ce que deux amis, venus de deux mondes très différents, ont appris au cours de leur longue existence. Nous aimerions que ce livre soit une invitation à la joie.\' La célébration des 80 ans de Sa Sainteté le Dalaï-Lama fut l’occasion de recevoir l’archevêque Desmond Tutu pour une série de rencontres historiques. Grands maîtres spirituels contemporains, ce sont aussi deux personnes dont la joie est contagieuse, et ce malgré de nombreuses épreuves personnelles. Loin d’être dépendante des circonstances extérieures, la joie est un état d’esprit et un art de vie face aux tourments du quotidien. À travers des dialogues baignés de tendresse et de rire, ces deux prix Nobel nous offrent quantité d’anecdotes personnelles et nous font partager leurs pratiques spirituelles.', 2016, 39, 17),
(103, 'La guerre du bruit', NULL, 'en', 630, 'Todd et Viola pensaient bien avoir mis un terme au conflit entre le Cercle et la Flèche et en avoir fini avec Maire Prentiss et Mrs Coyle. Mais c\'était compter sans les Spackle... Voici que leur armée, déterminée, innombrable, déferle sur New Prentissville, avec un seul objectif : anéantir tous les humains. Todd et Viola arriveront-ils, envers et contre tous, à empêcher le massacre qui s\'annonce, à arrêter l\'ultime guerre du Bruit ? La guerre du Bruit est le dernier tome de la trilogie Le Chaos en marche, une ode à la différence, à la liberté et à l\'amour puissante et bouleversante.', 2014, 1, 1),
(104, 'Me-Ti, livre des retournements', NULL, 'en', 183, '...', 1968, 1, 1),
(105, 'Power, les 48 lois du pouvoir', 'http://books.google.com/books/content?id=tt6rEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 833, 'Le pouvoir... on le désire, on le craint, on s’en protège... « Le sentiment de n’avoir aucun pouvoir sur les gens et les événements est difficilement supportable : l’impuissance rend malheureux. Personne ne réclame moins de pouvoir, tout le monde en veut davantage. » Amoral, intelligent, impitoyable et captivant, cet ouvrage colossal condense 3 000 ans d’histoire du pouvoir en 48 lois. Véritable manuel de la manipulation, il analyse la quintessence de cette sagesse millénaire, tirée de la vie des plus illustres stratèges (Sun Zi, Clausewitz), hommes d’État (Louis XIV, Bismarck, Talleyrand), courtisans (Castiglione, Gracián), séducteurs (Ninon de Lenclos, Casanova) et escrocs de l’histoire. Certaines lois reposent sur la prudence (loi no 1 : Ne surpassez jamais le maître), d’autres demandent de la dissimulation (loi no 7 : Laissez le travail aux autres, mais recueillez-en les lauriers), d’autres encore une absence totale de compassion (loi no 15 : Écrasez complètement l’ennemi). Toutes ces lois trouveront des applications dans votre vie de tous les jours... Car, soyez en certain : le monde est une immense cour où se trament toutes sortes d’intrigues. Au lieu de nier l’évidence, tâchez d’exceller dans la course au pouvoir. Des extraits, des vidéos, des interviews de Robert Greene sur son site www.robertgreene.fr', 2014, 25, 26),
(106, 'Le pouvoir de la vulnérabilité', NULL, 'en', 318, 'Nous avons en horreur la vulnérabilité. Nous voulons être parfaits, puissants, sûrs de nous. Nous croyons que la distance, la froideur, l\'inaccessibilité et la maîtrise contribuent à notre prestige. Que nous serions mésestimés si nous venions à être trop ouverts. Nous adoptons l\'anxiété en tant que style de vie, la productivité en tant que valeur essentielle, et le perfectionnisme en tant qu\'idéal. Et si la vulnérabilité n\'était pas une faiblesse, mais au contraire signe de force et de courage ? Car à trop vouloir être parfaits, nous avons peur de l\'échec et éprouvons un sentiment d\'insuffisance. Nous endossons notre armure avant de pénétrer dans l\'arène de la vie, en sacrifiant des relations et des opportunités qui ne reviendront pas. Nous gaspillons un temps précieux en tournant le temps à nos dons merveilleux. Alors plutôt que de rester assis sur le banc de touche, et d\'émettre sans cesse des jugements et des conseils, mieux vaut oser se découvrir et accepter d\'être vulnérable. Vivre de manière entière, en troquant le culte du contrôle contre le lâcher-prise et l\'ouverture émotionnelle. Oser être vulnérable, c’est cela le courage.', 2014, 1, 1),
(107, 'Business Model nouvelle génération', NULL, 'en', 282, 'Comment se positionner dans un paysage extrêmement concurrentiel ? Comment transformer ses idées en modèles économiques révolutionnaires ? Un guide pour visionnaires et challengers impatients de se lancer et de concevoir les entreprises de demain. + le poster. La matrice du modèle économique clé en main pour décrire, visualiser, évaluer et transformer les modèles économiques.', 2017, 1, 1),
(108, 'La Mauvaise Graine', 'http://books.google.com/books/content?id=H_77zQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 40, 'See below for English description. Ce livre raconte l\'histoire d\'une mauvaise graine. Une très mauvaise graine. Mais à quel point est-ce qu\'une graine peut être mauvaise? Eh bien, celle-ci a un mauvais caractère, de mauvaises manières et une mauvaise attitude. Elle a toujours été mauvaise. Elle coupe dans les files d\'attente, fixe les gens du regard et n\'écoute jamais. Mais qu\'arrive-t-il lorsque la petite graine malicieuse décide de prendre sa vie en main et d\'être... heureuse? La mauvaise graine est un récit à la fois drôle et touchant qui nous rappelle à tous la force de la volonté et de l\'acceptation de soi. Les lecteurs, jeunes et moins jeunes, adoreront cette histoire. Elle est la preuve que chacun d\'entre nous peut changer pour le mieux. This is a book about a bad seed. Really, truly bad. But how bad could a seed really be? Well, he has a bad temper, bad manners, and a bad attitude. This seed cuts in line every time, stares at everybody and never listens. But what happens when one mischievous little seed changes his mind about himself, and decides that he wants to be...happy? La mauvaise graine is a funny yet touching tale that reminds us of the remarkably transformative power of will, acceptance, and just being you. Perfect for readers young and old, La mauvaise graine proves that positive change is possible for each and every one of us. Original title: The Bad Seed', 2021, 1, 55),
(109, 'Qui a volé les tartes ?', NULL, 'fr', 62, 'La grand-maman de Jérémie Obadia Jackenory Jones a préparé de bonnes tartes à la confiture pour sa tante qui vit au-delà des grands bois. Pour les laisser refroidir, elle les pose sur le rebord de la fenêtre. Lorsque Jérémie est prêt à partir, grand-maman s\'aperçoit que les tartes ont disparu ! Qui a volé les tartes ? Est-ce le dinosaure, le Chapelier fou, les trois ours ou la Belle au Bois dormant ? Grâce à Allan et Janet Ahlberg, les personnages de vos contes favoris deviennent tous ensemble les héros d\'une histoire pleine d\'humour et de surprises.', 1990, 35, 10),
(110, 'Ces femmes incroyables qui ont changé le monde', NULL, 'fr', 32, 'De Coco Chanel à Anne Frank, en passant par Marie Curie, Frida Kahlo ou encore Jane Austen, cet ouvrage merveilleusement illustré dresse le portrait de 13 femmes qui ont marqué l\'Histoire.', 2016, 1, 1),
(111, 'Fiction', NULL, 'fr', 1006, 'Dans les histoires d\'E. Welty, on bascule tranquillement du quotidien ou du banal dans le drame, la folie ou le féerique.', 2000, 1, 1),
(112, 'Un autre visage', NULL, 'fr', 232, 'Martin avait tout pour lui : une belle gueule, un air cool, une copine \'canon\' et deux potes en admiration. Mais dans son quartier de l\'East End, à Londres, où règnent les gangs, une mauvaise rencontre fait basculer sa vie...', 2010, 1, 16),
(113, 'La grâce de l\'imperfection', NULL, 'fr', 200, 'Dans cet ouvrage, Brené Brown, une spécialiste réputée sur le sentiment de honte, l\'authenticité et le sentiment d\'appartenance, propose dix conseils sur le pouvoir d\'une vie sans réserve, ancrée dans la pleine affirmation de soi. Ce livre essentiel porte sur la quête de toute une vie, depuis le \'Que va-t-on penser de moi ?\' jusqu\'au sentiment d\'être bien tel qu\'on est. Grâce à sa capacité unique à intégrer la recherche érudite à une narration sincère, la lecture de \'La grâce de l\'imperfection\' ressemble à un édifiant et long dialogue avec un ami avisé qui offre compassion, sagesse et judicieux conseils.', 2013, 1, 1),
(114, 'Mademoiselle Pat', NULL, 'en', 375, 'Pat Gardiner restera-t-elle vieille fille? Peut-elle se satisfaire de l\'amour qu\'elle éprouve pour sa maison, Silver Bush. Un des 22 romans de la candide romancière de l\'Ile-du-Prince-Edouard. [SDM].', 1992, 1, 41),
(115, 'Facile', NULL, 'en', 21, 'Consists of 6 bifolia; 3rd and 4th form a 4-leaf gathering; last leaf is blank. A blank bifolium at beginning is not counted in collation, above.', 1935, 12, 1),
(116, 'Tout commence ici', NULL, 'fr', 128, 'Chaque reponse est en toi. Dans ce magnifique ouvrage, Meera Lee Patel nous invite a un voyage interieur, a la decouverte de soi. Elle a choisi des citations inspirantes d ecrivains, de penseurs et les a sublimees a l aquarelle en de veritables tableaux. S appuyant sur ces messages positifs et sages, elle nous aide a les mettre en pratique avec des exercices tests, listes, souvenirs. On apprend ainsi a distinguer l essentiel du superflu, a identifier nos forces et nos gouts, mais aussi ce qui est bon pour nous et ce qui est nocif afin de vivre heureux et d accomplir nos reves ! Deja traduit dans plus de 10 langues, il a rencontre un grand succes aux etats-Unis.\'', 2016, 1, 23),
(117, 'Scarpetta', NULL, 'fr', 503, 'Oscar Bane exige son admission dans le service psychiatrique de l\'hôpital Bellevue. Il redoute pour sa vie et prétend que ses blessures lui ont été infligées au cours d\'un meurtre, qu\'il nie avoir commis. Il ne se laissera examiner que par le médecin légiste expert Kay Scarpetta. Celle-ci se rend à New York et commence à enquêter mais le tueur anticipe...', 2009, 30, 21),
(118, 'Pat de Silver Bush', NULL, 'en', 396, '...', 1993, 1, 1),
(119, 'Lon Po Po', NULL, 'fr', 30, 'Une version chinoise des contes de loup, dans laquelle trois soeurs viennent à bout de la ruse du loup qui se fait passer pour leur grand-mère.', 1995, 29, 17),
(120, 'Harry Potter à L\'école des Sorciers', 'http://books.google.com/books/content?id=nvijsUyJYR4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 357, 'Le jour de ses onze ans, Harry Potter, un orphelin élevé par un oncle et une tante qui le détestent, voit son existence bouleversée. Un géant vient le chercher pour l’emmener à Poudlard, une école de sorcellerie! Voler en balai, jeter des sorts, combattre les trolls : Harry Potter se révèle un sorcier doué. Mais un mystère entoure sa naissance et l’effroyable V..., le mage dont personne n’ose prononcer le nom. Amitié, surprises, dangers, scènes comiques, Harry découvre ses pouvoirs et la vie à Poudlard. Le premier tome des aventures du jeune héros vous ensorcelle aussitôt!', 2015, 31, 12),
(121, 'Le pouvoir de la vulnérabilité', NULL, 'en', 318, 'Nous avons en horreur la vulnérabilité. Nous voulons être parfaits, puissants, sûrs de nous. Nous croyons que la distance, la froideur, l\'inaccessibilité et la maîtrise contribuent à notre prestige. Que nous serions mésestimés si nous venions à être trop ouverts. Nous adoptons l\'anxiété en tant que style de vie, la productivité en tant que valeur essentielle, et le perfectionnisme en tant qu\'idéal. Et si la vulnérabilité n\'était pas une faiblesse, mais au contraire signe de force et de courage ? Car à trop vouloir être parfaits, nous avons peur de l\'échec et éprouvons un sentiment d\'insuffisance. Nous endossons notre armure avant de pénétrer dans l\'arène de la vie, en sacrifiant des relations et des opportunités qui ne reviendront pas. Nous gaspillons un temps précieux en tournant le temps à nos dons merveilleux. Alors plutôt que de rester assis sur le banc de touche, et d\'émettre sans cesse des jugements et des conseils, mieux vaut oser se découvrir et accepter d\'être vulnérable. Vivre de manière entière, en troquant le culte du contrôle contre le lâcher-prise et l\'ouverture émotionnelle. Oser être vulnérable, c’est cela le courage.', 2014, 1, 1),
(122, 'Me-Ti, livre des retournements', NULL, 'en', 183, '...', 1968, 1, 1),
(123, 'Fille, femme, autre', 'http://books.google.com/books/content?id=fW_8DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 357, 'Amma, Dominique, Yazz, Shirley, Carole, Bummi, LaTisha, Megan devenue Morgan, Hattie, Penelope, Winsome, Grace. Il y a dans ce livre plus de femmes noires que Bernardine Evaristo n’en a vu à la télévision durant toute son enfance. La plus jeune a dix-neuf ans, la plus âgée, quatre-vingt-treize. Douze femmes puissantes, apôtres du féminisme et de la liberté, chacune à sa manière, d’un bout du siècle à l’autre, cherche un avenir, une maison, l’amour, un père perdu, une mère absente, une identité, un genre – il, elle, iel – une existence et, au passage le bonheur. Foisonnant, symphonique, écrit dans un style aussi libre et entraînant que le sont ses héroïnes, le roman de Bernardine Evaristo poursuit son titre : Fille, femme, autre... Douze récits s’entremêlent, se répondent, riment et raisonnent. Douze vies s’épaulent et s’opposent. Chacune des douze est en quête et en conquête, de place, de classe, de traces, d’elle-même, des autres, de cet autrui en elle qui a déjà traversé maintes frontières, et a le front de vouloir encore exploser celles qui restent.', 2020, 32, 51),
(124, 'Un cadavre dans la bibliothèque (Nouvelle traduction révisée)', 'http://books.google.com/books/content?id=zrpRFS5hW-UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 192, 'Le colonel Bentry a toutes les raisons d’être contrarié. On le tire de son sommeil pour lui faire constater un désagrément terrible : une femme, inconnue et vêtue de la manière la plus vulgaire qui soit, a été trouvée étranglée dans la bibliothèque de son manoir. Heureusement, la demeure des Bentry est voisine de Saint-Mary-Mead, le village de Miss Marple... Dans son autobiographie, Agatha Christie déclarait que le premier chapitre de ce roman, écrit en 1942, représentait pour elle l’aboutissement de son art. Traduit de l’anglais par Jean-Michel Alamagny', 2013, 32, 50),
(125, 'La puissance des mères', 'http://books.google.com/books/content?id=2ejuDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 141, 'Depuis la naissance de la Ve République, l\'État français mène une guerre larvée contre une partie de sa population. Les jeunes des quartiers populaires descendants de l\'immigration postcoloniale subissent une opération, quotidiennement répétée, de \' désenfantisation \' : ils ne sont pas traités comme des enfants mais comme des menaces pour la survie du système. Combien d\'entre eux sont morts à cause de cette désenfantisation ? Combien ont été tués par la police en toute impunité ? Combien de mères ont pleuré leurs enfants victimes de crimes racistes devant les tribunaux ? En s\'appuyant sur les luttes menées par les Folles de la place Vendôme, dans les années 1980, comme sur les combats du Front de mères aujourd\'hui, Fatima Ouassak montre, dans ce livre combatif et plein d\'espoir, le potentiel politique stratégique des mères. En se solidarisant systématiquement avec leurs enfants, en refusant de jouer un rôle de tampon entre eux et la violence des institutions, bref, en cessant d\'être une force d\'apaisement social et des relais du système inégalitaire, elles se feront à leur tour menaces pour l\'ordre établi. Ce livre a l\'ambition de proposer une alternative politique portée par les mères, autour d\'une parentalité en rupture alliant réussite scolaire et dignité, et d\'un projet écologiste de reconquête territoriale. Son message est proprement révolutionnaire : en brisant le pacte social de tempérance qui les lie malgré elles au système oppressif, les mères se mueront en dragons.', 2020, 17, 71),
(126, 'Business Model nouvelle génération', NULL, 'en', 282, 'Comment se positionner dans un paysage extrêmement concurrentiel ? Comment transformer ses idées en modèles économiques révolutionnaires ? Un guide pour visionnaires et challengers impatients de se lancer et de concevoir les entreprises de demain. + le poster. La matrice du modèle économique clé en main pour décrire, visualiser, évaluer et transformer les modèles économiques.', 2017, 1, 1),
(127, 'Insaisissable', 'http://books.google.com/books/content?id=mMkLIZPuMosC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 277, '\' Ne me touche pas \', je lui murmure. Je mens mais ne lui dis pas. J\'aimerais qu\'il me touche mais ne lui dirai jamais. Des choses arrivent quand on me touche. Des choses étranges. De mauvaises choses. Des choses mortelles. Juliette est enfermée depuis 264 jours dans une forteresse à cause d\'un accident. Un crime. 264 jours sans parler, ni toucher personne. Jusqu\'au moment où un gardien vient partager sa cellule. Derrière sa nouvelle apparence, elle le reconnaît : c\'est Adam, celui qu\'elle aime en secret depuis l\'enfance. Pourquoi est-il enfermé avec elle ? Pourquoi lui pose-t-il tant de questions ? Et pourquoi semble-t-il ignorer qui elle est ? Le monde de Juliette est régi par un organisme tout-puissant, le Rétablissement. Il contrôle l\'accès à la nourriture, à l\'eau et n\'hésite pas à tuer pour asservir le peuple. Avide de pouvoir absolu, le fils du leader, Warner, contrôle sa propre armée et son propre territoire. Mais ce qu\'il désire par-dessus tout, c\'est Juliette. Avant d\'en faire sa captive, il l\'a observée en cachette pendant des années. La malédiction de Juliette est pour lui une force, une arme inestimable. Mais cette dernière n\'a pas l\'intention de se laisser faire. Après une vie de paria, elle trouve pour la première fois la force de se battre et de rêver à un avenir avec celui qu\'elle croyait avoir perdu pour toujours...', 2012, 31, 7),
(128, 'Love me tender', 'http://books.google.com/books/content?id=JZ28DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 123, '« Je ne vois pas pourquoi l’amour entre une mère et un fils ne serait pas exactement comme les autres amours. Pourquoi on ne pourrait pas cesser de s’aimer. Pourquoi on ne pourrait pas rompre. Je ne vois pas pourquoi on ne pourrait pas s’en foutre, une fois pour toutes, de l’amour. » Constance Debré poursuit sa quête entamée avec Play Boy, celle du sens, de la vie juste, de la vie bonne. Après la question de l’identité se pose la question de l’autre et de l’amour sous toutes ses formes, de l’amour maternel aux variations amoureuses. Faut-il, pour être libre, accueillir tout ce qui nous arrive ? Faut-il tout embrasser, jusqu’à nos propres défaites ? Peut-on renverser le chagrin ?', 2020, 32, 17),
(129, 'Fragilité blanche', 'http://books.google.com/books/content?id=8hEBEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'fr', 185, 'Pourquoi est-il si difficile de parler de racisme quand on est blanc ? La sociologue américaine Robin DiAngelo a passé vingt ans à étudier cette question dans des ateliers sur la diversité et le multiculturalisme. Elle en a tiré un concept fondamental pour comprendre le rapport des Blancs au racisme : la fragilité blanche, un mécanisme de défense ou de déni qui permet de détourner la conversation, empêchant d\'identifier le racisme systémique qui persiste dans nos sociétés. Et donc de le combattre. Dans ce livre devenu un phénomène aux États-Unis, en tête des meilleures ventes depuis deux ans, Robin DiAngelo nous donne les clés pour être véritablement antiraciste. \' Une dénonciation méthodique, précieuse et irréfutable, un appel à l\'humilité et à la vigilance. \' THE NEW YORKER Traduit de l\'anglais (États-Unis) par Bérengère Viennot. Préface de Maxime Cervulle.', 2020, 17, 18),
(130, 'Ces femmes incroyables qui ont changé le monde', NULL, 'fr', 32, 'De Coco Chanel à Anne Frank, en passant par Marie Curie, Frida Kahlo ou encore Jane Austen, cet ouvrage merveilleusement illustré dresse le portrait de 13 femmes qui ont marqué l\'Histoire.', 2016, 1, 1),
(131, 'La Lumière difficile', 'http://books.google.com/books/content?id=6tvpDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 97, 'Retiré dans un petit village de Colombie, David, un peintre devenu presque aveugle, se remémore ses années passées à New York et à Miami, lorsqu\'il s\'efforçait de capter sur la toile l\'infinie beauté de la lumière, son amour pour sa femme et le jour où son fils Jacob a décidé de renoncer à la vie pour mettre fin aux souffrances d\'une paraplégie irréversible. Avec son frère Pablo, Jacob s\'était rendu dans l\'Oregon, seul état où l\'euthanasie est légale, tandis que la famille, respectant sa décision, était restée à New York dans l\'attente du coup de téléphone qui lui annoncerait que Jacob n\'est plus.Ce livre bouleversant, magnifique, tout en délicatesse et en concision, d\'une écriture claire et juste, est paradoxalement un hymne à la vie, à la solidarité et au respect de l\'autre. des valeurs qui permettent à la famille de Jacob de s\'élever au dessus de la toute puissance de la mort.Traduit de l\'espagnol ( Colombie) par Delphine Valentin', 2013, 32, 31),
(132, 'Fiction', NULL, 'fr', 1006, 'Dans les histoires d\'E. Welty, on bascule tranquillement du quotidien ou du banal dans le drame, la folie ou le féerique.', 2000, 1, 1),
(133, 'La Mauvaise Graine', 'http://books.google.com/books/content?id=H_77zQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'en', 40, 'See below for English description. Ce livre raconte l\'histoire d\'une mauvaise graine. Une très mauvaise graine. Mais à quel point est-ce qu\'une graine peut être mauvaise? Eh bien, celle-ci a un mauvais caractère, de mauvaises manières et une mauvaise attitude. Elle a toujours été mauvaise. Elle coupe dans les files d\'attente, fixe les gens du regard et n\'écoute jamais. Mais qu\'arrive-t-il lorsque la petite graine malicieuse décide de prendre sa vie en main et d\'être... heureuse? La mauvaise graine est un récit à la fois drôle et touchant qui nous rappelle à tous la force de la volonté et de l\'acceptation de soi. Les lecteurs, jeunes et moins jeunes, adoreront cette histoire. Elle est la preuve que chacun d\'entre nous peut changer pour le mieux. This is a book about a bad seed. Really, truly bad. But how bad could a seed really be? Well, he has a bad temper, bad manners, and a bad attitude. This seed cuts in line every time, stares at everybody and never listens. But what happens when one mischievous little seed changes his mind about himself, and decides that he wants to be...happy? La mauvaise graine is a funny yet touching tale that reminds us of the remarkably transformative power of will, acceptance, and just being you. Perfect for readers young and old, La mauvaise graine proves that positive change is possible for each and every one of us. Original title: The Bad Seed', 2021, 1, 55),
(134, 'Qui a volé les tartes ?', NULL, 'fr', 62, 'La grand-maman de Jérémie Obadia Jackenory Jones a préparé de bonnes tartes à la confiture pour sa tante qui vit au-delà des grands bois. Pour les laisser refroidir, elle les pose sur le rebord de la fenêtre. Lorsque Jérémie est prêt à partir, grand-maman s\'aperçoit que les tartes ont disparu ! Qui a volé les tartes ? Est-ce le dinosaure, le Chapelier fou, les trois ours ou la Belle au Bois dormant ? Grâce à Allan et Janet Ahlberg, les personnages de vos contes favoris deviennent tous ensemble les héros d\'une histoire pleine d\'humour et de surprises.', 1990, 35, 10),
(135, 'Mademoiselle Pat', NULL, 'en', 375, 'Pat Gardiner restera-t-elle vieille fille? Peut-elle se satisfaire de l\'amour qu\'elle éprouve pour sa maison, Silver Bush. Un des 22 romans de la candide romancière de l\'Ile-du-Prince-Edouard. [SDM].', 1992, 1, 41),
(136, 'Magnolia Table', 'http://books.google.com/books/content?id=y4btDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 336, 'NY Times Best Seller ! Le livre de cuisine Magnolia Table est imprégné de la passion de Joanna Gaines pour la cuisine qu\'elle prépare pour son mari et ses 5 enfants. Son livre de recettes comprend 125 recettes : du petit déjeuner au déjeuner et au dîner, en passant par de petites assiettes, des collations et des desserts. Johanna Gaines présente une sélection de plats traditionnels américains et de plats préférés de sa famille. Joanna éprouve également une grande passion pour son jardin, ses plats intègrent également des produits de saison. Exemple de recettes : quiche aux asperges, macaronis au fromage, tarte au citron ...', 2019, 24, 27),
(137, 'La grâce de l\'imperfection', NULL, 'fr', 200, 'Dans cet ouvrage, Brené Brown, une spécialiste réputée sur le sentiment de honte, l\'authenticité et le sentiment d\'appartenance, propose dix conseils sur le pouvoir d\'une vie sans réserve, ancrée dans la pleine affirmation de soi. Ce livre essentiel porte sur la quête de toute une vie, depuis le \'Que va-t-on penser de moi ?\' jusqu\'au sentiment d\'être bien tel qu\'on est. Grâce à sa capacité unique à intégrer la recherche érudite à une narration sincère, la lecture de \'La grâce de l\'imperfection\' ressemble à un édifiant et long dialogue avec un ami avisé qui offre compassion, sagesse et judicieux conseils.', 2013, 1, 1),
(138, 'Power, les 48 lois du pouvoir', 'http://books.google.com/books/content?id=tt6rEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 833, 'Le pouvoir... on le désire, on le craint, on s’en protège... « Le sentiment de n’avoir aucun pouvoir sur les gens et les événements est difficilement supportable : l’impuissance rend malheureux. Personne ne réclame moins de pouvoir, tout le monde en veut davantage. » Amoral, intelligent, impitoyable et captivant, cet ouvrage colossal condense 3 000 ans d’histoire du pouvoir en 48 lois. Véritable manuel de la manipulation, il analyse la quintessence de cette sagesse millénaire, tirée de la vie des plus illustres stratèges (Sun Zi, Clausewitz), hommes d’État (Louis XIV, Bismarck, Talleyrand), courtisans (Castiglione, Gracián), séducteurs (Ninon de Lenclos, Casanova) et escrocs de l’histoire. Certaines lois reposent sur la prudence (loi no 1 : Ne surpassez jamais le maître), d’autres demandent de la dissimulation (loi no 7 : Laissez le travail aux autres, mais recueillez-en les lauriers), d’autres encore une absence totale de compassion (loi no 15 : Écrasez complètement l’ennemi). Toutes ces lois trouveront des applications dans votre vie de tous les jours... Car, soyez en certain : le monde est une immense cour où se trament toutes sortes d’intrigues. Au lieu de nier l’évidence, tâchez d’exceller dans la course au pouvoir. Des extraits, des vidéos, des interviews de Robert Greene sur son site www.robertgreene.fr', 2014, 25, 26),
(139, 'Gruffalo', 'http://books.google.com/books/content?id=duOHPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 24, 'Une petite souris se promène dans la grande forêt. Sur son chemin, elle croise le renard, le hibou et le serpent qui la trouvent bien appétissante et l\'invitent à déjeuner chez eux. Mais la petite souris refuse car elle a déjà rendez-vous avec un mystérieux et terrifiant gruffalo... Une histoire malicieuse où le plus petit a raison du plus gros. Un récit à l\'humour délicat accompagné d\'illustrations espiègles.', 2002, 34, 10),
(140, 'Pat de Silver Bush', NULL, 'en', 396, '...', 1993, 1, 1),
(141, 'Un autre visage', NULL, 'fr', 232, 'Martin avait tout pour lui : une belle gueule, un air cool, une copine \'canon\' et deux potes en admiration. Mais dans son quartier de l\'East End, à Londres, où règnent les gangs, une mauvaise rencontre fait basculer sa vie...', 2010, 1, 16),
(142, 'Tout commence ici', NULL, 'fr', 128, 'Chaque reponse est en toi. Dans ce magnifique ouvrage, Meera Lee Patel nous invite a un voyage interieur, a la decouverte de soi. Elle a choisi des citations inspirantes d ecrivains, de penseurs et les a sublimees a l aquarelle en de veritables tableaux. S appuyant sur ces messages positifs et sages, elle nous aide a les mettre en pratique avec des exercices tests, listes, souvenirs. On apprend ainsi a distinguer l essentiel du superflu, a identifier nos forces et nos gouts, mais aussi ce qui est bon pour nous et ce qui est nocif afin de vivre heureux et d accomplir nos reves ! Deja traduit dans plus de 10 langues, il a rencontre un grand succes aux etats-Unis.\'', 2016, 1, 23),
(143, 'Facile', NULL, 'en', 21, 'Consists of 6 bifolia; 3rd and 4th form a 4-leaf gathering; last leaf is blank. A blank bifolium at beginning is not counted in collation, above.', 1935, 12, 1),
(144, 'Lon Po Po', NULL, 'fr', 30, 'Une version chinoise des contes de loup, dans laquelle trois soeurs viennent à bout de la ruse du loup qui se fait passer pour leur grand-mère.', 1995, 29, 17),
(145, 'La tournée d\'automne', NULL, 'fr', 190, 'Analyse : Roman d\'amour.', 1996, 1, 72),
(146, 'Emmanuel Guibert', NULL, 'en', 155, 'Publié à l\'occasion de l\'exposition rétrospective présentée au 48e Festival international de la bande dessinée d\'Angoulême, cette monographie richement illustrée est consacrée à l\'oeuvre d\'E. Guibert.', 2021, 1, 1),
(147, 'Grain de grenade', NULL, 'fr', 203, 'Ce recueil rassemble six histoires de fantômes : une morte amoureuse qui vampirise son fiancé remarié, une vivante qui joue à la morte... \' Miss Wharton, au fil des nouvelles, et de sa manière si lisse, fait rejaillir en nous cet effroi des ténèbres que nous masquons habituellement derrière un rationalisme narquois. La diabolique romancière doit aujourd\'hui se réjouir lorsque, délaissant sa tombe au crépuscule, elle vient observer sur nos visages le trouble produit par ses écrits. Celui-là même qui la traversait il y a plus d\'un siècle. La vengeance est décidément un plat qui se déguste glacé... \' Florence Sarrola Le Monde', 1994, 1, 4);
INSERT INTO `Book` (`id`, `title`, `picture`, `language`, `nbr_pages`, `resume`, `year`, `category`, `editor`) VALUES
(148, 'Daisy Jones & the Six', NULL, 'fr', 399, 'Best-seller du New York Times en cours d\'adaptation pour une web série à être diffusée sur Amazon Video, voici un roman saisissant sur la montée en flèche d\'un méga groupe rock des années 1970 - et en particulier de sa chanteuse. Tellement réaliste qu\'on oublie qu\'il s\'agit d\'une fiction... Bref, les années Woodstock comme si vous y étiez!', 2020, 1, 1),
(149, 'Le Souci de Calie', 'http://books.google.com/books/content?id=0VoEvgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 32, 'See below for English description. Calie adore être Calie. jusqu\'au jour où elle découvre un souci. Au début, ce n\'est pas un gros souci, alors tout va bien. mais il commence peu à peu à grandir. Il grandit et grandit, et maintenant, Calie se sent triste. Comment la petite fille pourra-t-elle se débarrasser de son souci et commencer à se sentir de nouveau elle-même? Cette histoire touchante, qui a l\'avantage de mettre les choses en perspective, est un incontournable pour garnir la bibliothèque des petits et les aider à gérer leurs émotions! Calie loves being Calie. Until, one day, she finds a worry. At first it\'s not such a big worry, and that\'s all right, but then it starts to grow. It gets bigger and bigger every day and it makes Calie sad. How can Calie get rid of it and feel like herself again? A perceptive and poignant story that is a must-have for all children\'s bookshelves. Original title: Ruby\'s Worry', 2019, 1, 55),
(150, 'La barque le soir', NULL, 'fr', 194, 'Dans l\'œuvre de Tarjei Vesaas, La barque le soir, publiée en 1968 et curieusement restée inédite en français, est une œuvre fondamentale, crépusculaire. Appelée \' roman \' par son auteur, il s\'agit plutôt d\'amples réminiscences poétiques semi-autobiographiques. Il révise les thèmes qui ont accompagné sa vie de créateur : l\'effroi face à l\'invisible, la condition spirituelle de l\'homme, tandis qu\'il brosse son propre portrait psychologique, de sa prise de conscience que l\'homme est seul jusqu\'à l\'acceptation finale de la mort. Mais Vesaas n\'est pas un auteur abstrait, fidèle à ses origines, il sait rendre présentes les choses les plus essentielles, les plus élémentaires : du pas d\'un cheval dans la neige jusqu\'aux variations infinies de la lumière. Plus subjectif que ses autres livres, La Barque le soir illustre avec une rare densité les talents de Vesaas, sa capacité d\'évoluer \' du rêve au réel, en passant par le symbole et l\'allégorie, sans qu\'il soit jamais possible de séparer l\'un de l\'autre \' (C.G. Bjurström).', 2003, 1, 73),
(151, 'Surmonter la faible estime de soi', NULL, 'en', 280, '...', 2021, 1, 1),
(152, 'Entraîner votre esprit Transformer votre cerveau', NULL, 'fr', 317, 'Dans ce livre fascinant et d\'une grande portée, la journaliste scientifique du magazine Newsweek retrace l\'heureux mariage de la science de pointe et de la sagesse séculaire du bouddhisme qui a donné naissance à une science selon laquelle, contrairement à l\'opinion populaire, nous avons le pouvoir de littéralement transformer notre cerveau, et ce, en transformant notre esprit. Les récentes études d\'avant-garde en neuroplasticité - la faculté du cerveau à se modifier en réponse au vécu - révèlent que le cerveau est capable d\'altérer sa structure et sa fonction, voire de générer de nouveaux neurones. Et ce pouvoir perdure jusqu\'à un âge avancé. Le cerveau peut s\'adapter, guérir, se renouveler après un traumatisme, neutraliser des invalidités, se recâbler pour vaincre la dyslexie et s\'affranchir des cycles de la dépression et du trouble obsessionnel compulsif. Et, comme le constatent les scientifiques grâce à des études sur des moines bouddhistes, il n\'y a pas que le monde extérieur qui puisse modifier le cerveau; ce dernier est également assujetti à l\'esprit et, notamment, à l\'attention concentrée par la pratique bouddhiste de \' la pleine conscience\'. Grâce à ce talent qu\'elle a de rendre la science accessible, riche de sens et attrayante, Sharon Begley jette la lumière sur une compréhension novatrice des interactions entre le cerveau et l\'esprit, et nous conduit à la pointe d\'une révolution dans la signification de ce qu\'est l\'être humain.', 2008, 1, 38),
(153, 'Découvrez vos points forts dans la vie et au travail', NULL, 'fr', 287, 'Peu de personnes savent réellement quels sont leurs points forts. Au contraire, nous sommes plutôt conscients de nos faiblesses, auxquelles nous ne cessons de vouloir remédier toute notre vie durant, alors qu\'il faudrait axer notre développement sur nos forces et bâtir notre existence autour d\'elles. Pour parvenir à ce changement radical d\'optique, la Gallup Organization a mis au point un détecteur de talents disponible sur Internet sous la forme d\'un questionnaire en ligne. Ce livre unique en son genre donne les clés pour utiliser ce détecteur et pour interpréter les résultats qu\'il révélera. La méthode des deux auteurs, fondée sur une analyse statistique des comportements humains, est radicalement innovante et ouvrira des horizons inattendus à tous ceux qui l\'utiliseront pour eux-mêmes et pour les personnes avec lesquelles ils travaillent.', 2003, 1, 1),
(154, 'Père Riche, Père Pauvre (résumé)', NULL, 'fr', 37, 'Père riche, père pauvre : l\'un des livres qui m\'a le plus fait réfléchir sur ma condition... tout ce que j\'acceptais dans ma vie et considérais comme « normal » ! Ce livre m\'a incité à reprendre ma situation financière en main. À cette époque j\'avais des économies mais je n\'en faisais rien de particulier... Je laissais bêtement les banques s\'en occuper et me donner des miettes en retour. Finalement tout ce qui me manquait, c\'était l\'intelligence financière... quelque chose qui malheureusement n\'est pas enseigné à l\'école. C\'est absurde et ce n\'est que le début d\'une longue série de révélations toutes plus dérangeantes les unes que les autres. Ce livre est inspirant mais long (plus de 300 pages), j\'ai donc décidé d\'en faire un résumé pour en présenter les idées fondatrices et vous éviter des semaines de lecture.', 2021, 1, 1),
(155, 'Surmonter la timidité et la peur des autres avec les TCC', NULL, 'fr', 240, 'La timidité et le mal être en société sont de puissants freins à l\'épanouissement personnel. Ce livre propose au lecteur un parcours d\'autothérapie fondé sur les outils des thérapies comportementales et cognitivistes (les TCC), particulièrement appropriés dans ce cas car ils agissent sur les émotions, les comportements et les pensées. Il analyse les sources possibles du problème dont souffre le lecteur, lui montre comment se prendre en main et explicite chaque point de résolution, étape par étape de façon pragmatique et applicable au quotidien. Il propose des exercices pour aider la personne à appliquer les conseils donnés et est illustré de cas encourageants et réconfortants, montrant comment d\'autres ont pu réussir avant eux.', 2014, 33, 1),
(156, 'Les lois de la médecine', NULL, 'fr', 96, 'Changer notre regard sur la médecine. Jeune interne en médecine, comme beaucoup d\'autres, Siddhartha Mukherjee croyait que la médecine était une science, dotée de lois qu\'il suffirait de suivre pour ramener chaque patient à une règle générale et à la santé. Mais tel n\'est pas le cas. C\'est quand médecins et patients auront compris que la médecine est une science du cas particulier, de l\'expérience, de l\'intuition, de l\'irrégulier, bref, de l\'humain, qu\'ils sauront trouver ensemble la voie de la guérison.', 2016, 1, 1),
(157, 'Chroniques d\'Avonlea I', NULL, 'en', 213, '...', 1995, 1, 74),
(158, 'Le visage de Sara', NULL, 'fr', 300, 'Sara veut devenir célèbre. La célébrité est son obsession. La chirurgie esthétique, son fantasme. Aussi, quand la légendaire star de rock, Jonathan Heat, propose de la prendre en main, c\'est comme si son rêve devenait réalité. Mais s\'il y avait un prix insoupçonné... Et Sara serait-elle prête à aller jusque là ? Melvin Burgess se glisse avec un talent étonnant dans la peau d\'une jeune névrosée, obsédée par son image. Un thriller psychologique décapant et provocateur qui se dévore d\'une traite.', 2008, 1, 30),
(159, 'Longue vie aux dodos', NULL, 'fr', 119, 'Maladroits et Patauds, les dodos vivent béatement sur leur île au milieu de l\'océan indien, dans un climat idéal, sans le moindre ennemi. Rien ne vient troubler leur bonheur jusqu\'au jour où débarquent sur l\'île des singes de mer, ces créatures que nous connaissons mieux sous le nom de pirates... Une aventure riche en humour et en tendresse.', 1998, 1, 1),
(160, 'L\'Eternéant', 'http://books.google.com/books/content?id=CXRlBgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Après un accident de voiture auquel ils n’ont pas survécu, les âmes de Nick et d’Allie se retrouvent bloquées à mi-chemin entre la vie et la mort, dans un univers qu’on appelle l’Éternénant. Il s’agit d’un lieu à la fois magique et dangereux où l’on croise toutes sortes d’âmes et d’objets errants. La reine autoproclamée de l\'Éternénant, Mary Tourcélèste, a réuni ses ouailles dans un des rares buildings passé dans les limbes : les Twin Towers. Or, Nick et Allie n’ont aucune envie de rester coincés dans ce monde bizarre ! Ce qu’ils veulent à tout prix, c’est retrouver leur vie d’avant. Leur quête les mènera dans les territoires inexplorés, sombres et parfois terrifiants de l’Éternénant... Mais plus le temps passe et plus l’espoir de retrouver un jour leur existence passée s’estompe. Et si tous leurs souvenirs s’évaporaient ? Il se pourrait bien alors qu’ils ne parviennent jamais à fuir ce monde étrange et inquiétant... Traduit de l’anglais (États-Unis) par Alexandre Boldrini et Anne-Judith Descombey', 2012, 31, 50),
(161, 'Le cinquième accord toltèque', 'http://books.google.com/books/content?id=KGHCBgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'fr', 1, 'Dans son best-seller mondial, Les Quatre Accords Toltèques, Don Miguel Ruiz révélait comment le processus éducatif, notre \'domestication\', nous fait oublier la sagesse inhérente avec laquelle nous venons au monde. Tout au long de notre vie, nous concluons en effet des accords qui vont à l\'encontre de ce que nous sommes et nous nous créons ainsi des souffrances inutiles. Les Quatre Accords Toltèques servent à briser ces accords qui nous limitent, pour les remplacer par d\'autres qui nous procurent la liberté, le bonheur et l\'amour. Aujourd\'hui, aidé de son fils Don José Ruiz, Don Miguel jette une nouvelle lumière sur Les Quatre Accords Toltèques, auxquels ils en ajoutent ensemble un cinquième très puissant, afin que nous puissions faire un véritable paradis personnel de notre vie. Le Cinquième Accord Toltèque nous donne accès à un niveau de conscience de la puissance du Soi encore plus puissant qu\'avant, nous restituant du même coup l\'authenticité avec laquelle nous sommes venus au monde. Dans cette suite très attendue au livre qui a déjà changé la vie de millions de personnes de par le monde, les Ruiz nous remettent en mémoire le plus grand cadeau que nous puissions nous faire : la liberté d\'être qui nous sommes vraiment. En nous donnant les outils pour y parvenir.', 2014, 40, 75),
(162, 'La parfaite épouse', NULL, 'en', 1, 'Ce sont ses \' impressions et souvenirs \' des années Ford (1974-1977) que nous livre ici Alfred Clayton, modeste professeur d\'histoire dans un collège du New Hampshire. L\'Amérique connaissait alors l\'apogée de la libération sexuelle. Clayton, tout à la rédaction de sa biographie de James Buchanan, président des Etats Unis de 1856 à 1861, dont les compromis débouchèrent sur la guerre de Sécession, rêvait d\'échapper à la pesante réalité de son mariage à la \' Reine du Désordre \' en découvrant la \' Parfaite Epouse \'. Lorsqu\'il rencontra Geneviève, brune érudite mariée à un ami du couple et mère de famille, il crut au coup de foudre... S\'efforçant dans ses travaux de magnifier le réalisme rassis du président, Clayton s\'abandonne sans frein dans sa vie à ses propres chimères. Une double chronique, sarcastique et joyeuse, de ces périodes d\'innocence heureuse d\'avant la crise.', 1996, 32, 44),
(163, 'Entraîner votre esprit Transformer votre cerveau', NULL, 'fr', 1, 'Dans ce livre fascinant et d\'une grande portée, la journaliste scientifique du magazine Newsweek retrace l\'heureux mariage de la science de pointe et de la sagesse séculaire du bouddhisme qui a donné naissance à une science selon laquelle, contrairement à l\'opinion populaire, nous avons le pouvoir de littéralement transformer notre cerveau, et ce, en transformant notre esprit. Les récentes études d\'avant-garde en neuroplasticité - la faculté du cerveau à se modifier en réponse au vécu - révèlent que le cerveau est capable d\'altérer sa structure et sa fonction, voire de générer de nouveaux neurones. Et ce pouvoir perdure jusqu\'à un âge avancé. Le cerveau peut s\'adapter, guérir, se renouveler après un traumatisme, neutraliser des invalidités, se recâbler pour vaincre la dyslexie et s\'affranchir des cycles de la dépression et du trouble obsessionnel compulsif. Et, comme le constatent les scientifiques grâce à des études sur des moines bouddhistes, il n\'y a pas que le monde extérieur qui puisse modifier le cerveau; ce dernier est également assujetti à l\'esprit et, notamment, à l\'attention concentrée par la pratique bouddhiste de \' la pleine conscience\'. Grâce à ce talent qu\'elle a de rendre la science accessible, riche de sens et attrayante, Sharon Begley jette la lumière sur une compréhension novatrice des interactions entre le cerveau et l\'esprit, et nous conduit à la pointe d\'une révolution dans la signification de ce qu\'est l\'être humain.', 2008, 1, 38),
(164, 'Le fond des forêts', NULL, 'fr', 1, '\'Superman 2 passait à la télé. Je l\'avais vu au cinéma de Malvern il y avait à peu près trois ans. Le film était assez bien mais pas au point de lui sacrifier un lac gelé rien qu\'à moi. Clark Kent renonce à ses pouvoirs tout ça pour avoir des rapports sexuels avec Lois Lane dans des draps de satin. Qui serait assez stupide pour faire un échange pareil ? Quand on peut voler ? Dévier des missiles atomiques vers l\'espace ? Remonter le temps en faisant tourner la Terre à l\'envers ?\' 1982, dans un petit village du Worcestershire. Jason Taylor, treize ans, essaie de réussir son entrée dans l\'adolescence. Et ça n\'est pas chose facile. À l\'école ou chez lui, Jason affronte l\'incompréhension et le mépris : ses camarades raillent son bégaiement, ses parents ne cessent de se disputer. Mais Jason mène une vie secrète, dans un monde à lui peuplé de visions étranges et de figures ambiguës. Portrait de famille, chronique de l\'Angleterre de Thatcher, roman d\'apprentissage à la lisière du fantastique, Le Fond des forêts est avant tout une suite de variations éblouissantes sur l\'adolescence et ses multiples facettes. Après Écrits fantômes et Cartographie des nuages, deux romans qui traversaient l\'espace et le temps, David Mitchell nous offre un texte plus personnel, d\'une puissance poétique exceptionnelle.', 2009, 1, 76),
(165, 'Découvrez vos points forts dans la vie et au travail', NULL, 'fr', 1, 'Peu de personnes savent réellement quels sont leurs points forts. Au contraire, nous sommes plutôt conscients de nos faiblesses, auxquelles nous ne cessons de vouloir remédier toute notre vie durant, alors qu\'il faudrait axer notre développement sur nos forces et bâtir notre existence autour d\'elles. Pour parvenir à ce changement radical d\'optique, la Gallup Organization a mis au point un détecteur de talents disponible sur Internet sous la forme d\'un questionnaire en ligne. Ce livre unique en son genre donne les clés pour utiliser ce détecteur et pour interpréter les résultats qu\'il révélera. La méthode des deux auteurs, fondée sur une analyse statistique des comportements humains, est radicalement innovante et ouvrira des horizons inattendus à tous ceux qui l\'utiliseront pour eux-mêmes et pour les personnes avec lesquelles ils travaillent.', 2003, 1, 1),
(166, 'Les trois premières minutes de l\'univers', NULL, 'fr', 1, 'Ecrit de façon simple mais rigoureuse, ce livre porte sur le commencemen de l\'univers, \'et en particulier sur la conception nouvelle de l\'univers primitif à laquelle a donné naissance la découverte du fond cosmique de rayonnement millimétrique en 1965\'. Le dernier chapitre tente de répondre à la question: que va devenir l\'univers maintenant? Notes mathématiques du niveau d\'un premier cycle universitaire de mathématiques ou de sciences physiques, p. 195-206. Les suggestions bibliographiques reproduisent la bibliographie donnée dans l\'édition américaine en y ajoutant quelques livres ou articles disponibles en français.', 1978, 1, 1),
(167, 'Le livre', NULL, 'fr', 1, 'Depuis deux mille cinq cents ans, les livres servent à gouverner, consigner, vénérer, éduquer et distraire. Cet ouvrage aux illustrations luxueuses explore l\'une des technologies les plus extraordinaires, essentielles et durables jamais inventées. Le livre : une histoire vivante retrace l\'évolution et l\'influence du livre partout sur notre planète, des tablettes cunéiformes de la civilisation sumérienne jusqu\'à l\'essor du livre mobile et la révolution des moyens d\'information modernes. Parmi les illustrations, sélectionnées avec soin, figurent des manuscrits mayas, des rouleaux de papyrus égyptiens, des enluminures médiévales, des chefs- d\'oeuvre de l\'imprimerie de Gutenberg et Aldo Manuce, les atlas des Grandes Découvertes, des alphabets et des livres pour enfants, des romans à trois sous et des mangas japonais, ainsi que des oeuvres de fiction allant de Don Quichotte à Level 26, le premier \'roman numérique\' au monde. Un régal pour les amoureux du livre traditionnel, ainsi qu\'une source d\'inspiration pour les passionnés des nouvelles technologies électroniques : cet ouvrage magnifique célèbre le pouvoir et la magie éternels du livre.', 2011, 2, 1),
(168, 'Surmonter la timidité et la peur des autres avec les TCC', NULL, 'fr', 1, 'La timidité et le mal être en société sont de puissants freins à l\'épanouissement personnel. Ce livre propose au lecteur un parcours d\'autothérapie fondé sur les outils des thérapies comportementales et cognitivistes (les TCC), particulièrement appropriés dans ce cas car ils agissent sur les émotions, les comportements et les pensées. Il analyse les sources possibles du problème dont souffre le lecteur, lui montre comment se prendre en main et explicite chaque point de résolution, étape par étape de façon pragmatique et applicable au quotidien. Il propose des exercices pour aider la personne à appliquer les conseils donnés et est illustré de cas encourageants et réconfortants, montrant comment d\'autres ont pu réussir avant eux.', 2014, 33, 1),
(169, 'Guerres justes et injustes', NULL, 'fr', 1, 'Dans l\'enfer de la guerre, tout n\'est pas égal. Blocus, bombardements de civils, représailles, dommages collatéraux traversent tous les conflits. Mais la guerre juste existe, qui peut à chaque instant basculer dans l\'injustice. Déterminer l\'inacceptable comme l\'Inévitable est un jugement auquel nul ne peut se dérober. En quête du juste équilibre, Walzer n\'ignore ni les droits de l\'homme, ni la nécessité. Le philosophe qui milita contre la guerre au Vietnam montre qu\'une guerre, quand même elle servirait les intérêts d\'une grande puissance, peut être aussi une guerre juste. Il revendique un empirisme moral, et développe une argumentation à partir d\'exemples historiques. Rien de moins abstrait que cette réflexion. Notre monde n\'a pas su écarter l\'enfer de la guerre, mais il progresse chaque jour dans son exigence d\'un droit international pour juger des guerres et des crimes qui y sont commis. Un \' après-propos \' inédit, rédigé à la lumière de la guerre d\'Irak, ouvre la perspective d\'un usage juste et préventif de la force qui écarterait les risques de guerres injustes.', 2006, 41, 44),
(170, 'Père Riche, Père Pauvre (résumé)', NULL, 'fr', 1, 'Père riche, père pauvre : l\'un des livres qui m\'a le plus fait réfléchir sur ma condition... tout ce que j\'acceptais dans ma vie et considérais comme « normal » ! Ce livre m\'a incité à reprendre ma situation financière en main. À cette époque j\'avais des économies mais je n\'en faisais rien de particulier... Je laissais bêtement les banques s\'en occuper et me donner des miettes en retour. Finalement tout ce qui me manquait, c\'était l\'intelligence financière... quelque chose qui malheureusement n\'est pas enseigné à l\'école. C\'est absurde et ce n\'est que le début d\'une longue série de révélations toutes plus dérangeantes les unes que les autres. Ce livre est inspirant mais long (plus de 300 pages), j\'ai donc décidé d\'en faire un résumé pour en présenter les idées fondatrices et vous éviter des semaines de lecture.', 2021, 1, 1),
(171, 'CHRONIQUES D AVONLEA T 1 ANNE', NULL, 'en', 1, '...', 2006, 1, 1),
(172, 'Longue vie aux dodos', NULL, 'fr', 1, 'Maladroits et Patauds, les dodos vivent béatement sur leur île au milieu de l\'océan indien, dans un climat idéal, sans le moindre ennemi. Rien ne vient troubler leur bonheur jusqu\'au jour où débarquent sur l\'île des singes de mer, ces créatures que nous connaissons mieux sous le nom de pirates... Une aventure riche en humour et en tendresse.', 1998, 1, 1),
(173, 'Les lois de la médecine', NULL, 'fr', 1, 'Changer notre regard sur la médecine. Jeune interne en médecine, comme beaucoup d\'autres, Siddhartha Mukherjee croyait que la médecine était une science, dotée de lois qu\'il suffirait de suivre pour ramener chaque patient à une règle générale et à la santé. Mais tel n\'est pas le cas. C\'est quand médecins et patients auront compris que la médecine est une science du cas particulier, de l\'expérience, de l\'intuition, de l\'irrégulier, bref, de l\'humain, qu\'ils sauront trouver ensemble la voie de la guérison.', 2016, 1, 1),
(174, 'Le visage de Sara', NULL, 'fr', 1, 'Sara veut devenir célèbre. La célébrité est son obsession. La chirurgie esthétique, son fantasme. Aussi, quand la légendaire star de rock, Jonathan Heat, propose de la prendre en main, c\'est comme si son rêve devenait réalité. Mais s\'il y avait un prix insoupçonné... Et Sara serait-elle prête à aller jusque là ? Melvin Burgess se glisse avec un talent étonnant dans la peau d\'une jeune névrosée, obsédée par son image. Un thriller psychologique décapant et provocateur qui se dévore d\'une traite.', 2008, 1, 30),
(175, 'La mort n\'est pas une fin', NULL, 'fr', 1, 'En présentant à ses enfants Nofret, sa jeune et étrange concubine, Imhotep ne se doutait pas qu\'il allait déclencher une série de drames dans sa propre maison. 2 000 ans avant Jésus-Christ, alors que les pyramides resplendissent et que les tombeaux fleurissent en Egypte, un esprit maléfique sème les cadavres, et tous s\'interrogent : Quelle sera la prochaine victime ? Qui est l\'assassin ?', 1999, 1, 1),
(176, 'Le rêve du renard', NULL, 'fr', 1, 'Littérature jeunesse: album', 1988, 36, 28),
(177, 'Bus de nuit', NULL, 'fr', 1, '...', 2020, 1, 1),
(178, 'Journal d\'un dégonflé', NULL, 'en', 1, '...', 2011, 1, 1),
(179, 'L\'empereur et le cerf-volant', NULL, 'fr', 1, 'Quatrième fille de l’empereur, la princesse Djeow Seow est si petite que nul à la cour ne fait attention à elle. Elle vit seule, elle mange seule, elle joue seule, avec un cerf-volant. Mais un jour l’empereur est arrêté et fait prisonnier. Comment la toute petite Djeow Seow pourrait-elle, seule, libérer son père ?', 2011, 13, 1),
(180, 'La première impression', NULL, 'fr', 1, 'Comment font les designer et les publicitaires pour influencer nos choix ? Que nous le voulions ou non, dès que nous voyons un objet, une affiche, ou tout support de communication visuelle, la façon dont nous allons le juger se détermine en un quart de seconde. On aime, on n\'aime pas, on comprend, on ne comprend pas, on fait attention (ou on se détourne) on désire (ou pas), on achète (ou pas)...Et ce qui détermine cette première impression, ce n\'est pas un choix rationnel, mais des critères immédiats, donc visuels. Ce livre nous dévoile les secrets du designer le plus influent du moment, qui nous explique, par l\'exemple, comment une image, soit par sa clarté, soit par son mystère, réussit à faire passer un message et à nous convaincre avant même que nous ayons eu te temps de nous en rendre compte !', 2016, 1, 1),
(10000, 'la fin des tampes', NULL, 'fr', 1, '...', 1990, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Borrow`
--

CREATE TABLE `Borrow` (
  `id` int(11) NOT NULL,
  `date_borrow` date DEFAULT NULL,
  `date_return` date DEFAULT NULL CHECK (`date_borrow` < `date_return`),
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Borrow`
--

INSERT INTO `Borrow` (`id`, `date_borrow`, `date_return`, `id_book`, `id_reader`) VALUES
(0, '2003-07-04', '2020-12-16', 0, 0),
(1, '1970-11-28', '1982-11-12', 116, 12),
(2, '1999-08-14', '2018-07-13', 91, 24),
(3, '1975-12-17', '2020-10-23', 50, 10),
(4, '1970-08-03', '1978-11-18', 119, 10),
(5, '1975-03-09', '2012-02-29', 38, 26),
(6, '1984-02-25', NULL, 124, 46),
(7, '1976-01-13', NULL, 46, 36),
(8, '1972-06-17', '2017-01-11', 28, 9),
(9, '1972-01-21', NULL, 82, 50),
(10, '1997-01-19', NULL, 93, 40),
(11, '2010-04-23', NULL, 21, 30),
(12, '1996-01-16', NULL, 140, 46),
(13, '1998-07-25', NULL, 135, 40),
(14, '1982-08-09', '2005-11-22', 71, 4),
(15, '1973-08-14', '1993-01-21', 105, 3),
(16, '2004-07-28', NULL, 10, 34),
(17, '2020-11-05', '2022-10-01', 57, 3),
(18, '1970-03-15', NULL, 110, 41),
(19, '1989-02-20', '2012-09-23', 24, 10),
(20, '2009-02-02', '2013-04-24', 104, 21),
(21, '2014-07-24', '2020-11-07', 136, 28),
(22, '1972-04-22', NULL, 142, 37),
(23, '2016-01-02', NULL, 99, 30),
(24, '1979-08-08', '1999-08-04', 13, 7),
(25, '1991-02-01', NULL, 29, 45),
(26, '1980-03-31', NULL, 67, 40),
(27, '1999-01-21', NULL, 89, 36),
(28, '1987-06-25', '1991-02-09', 143, 19),
(29, '2016-04-17', NULL, 113, 31),
(30, '1976-10-15', NULL, 125, 32),
(31, '1984-07-30', '2019-11-30', 1, 3),
(32, '1991-07-27', NULL, 56, 34),
(33, '1993-01-22', '2004-05-27', 120, 15),
(34, '1979-01-13', '2003-08-12', 90, 22),
(35, '1973-01-22', '1982-04-15', 75, 1),
(36, '1981-12-23', '2013-05-04', 27, 2),
(37, '2010-01-14', NULL, 135, 38),
(38, '2020-01-13', NULL, 125, 34),
(39, '1981-02-08', '2010-11-22', 35, 14),
(40, '2019-10-18', NULL, 85, 40),
(41, '2001-06-05', NULL, 34, 37),
(42, '1974-07-08', '1990-08-09', 97, 22),
(43, '2002-01-16', '2020-03-05', 44, 26),
(44, '1972-02-19', '1979-02-28', 52, 3),
(45, '1973-10-01', NULL, 97, 37),
(46, '2010-07-09', NULL, 98, 39),
(47, '1970-09-27', '1983-02-02', 97, 4),
(48, '1979-02-17', '2023-03-16', 120, 7),
(49, '1974-01-20', '1989-07-01', 68, 22),
(50, '1976-12-09', NULL, 75, 31),
(51, '2000-11-06', NULL, 21, 38),
(52, '2014-01-21', NULL, 147, 30),
(53, '1999-09-30', NULL, 87, 43),
(54, '1980-08-25', '2001-04-11', 38, 22),
(55, '1999-04-24', NULL, 146, 31),
(56, '2011-10-20', NULL, 101, 39),
(57, '2017-04-25', NULL, 87, 37),
(58, '2004-04-28', NULL, 127, 31),
(59, '2012-07-08', '2016-04-07', 77, 14),
(60, '1980-11-22', '2010-11-21', 68, 12),
(61, '1994-01-23', '1995-10-15', 86, 27),
(62, '2013-05-02', NULL, 49, 30),
(63, '1981-02-23', '1991-01-23', 133, 0),
(64, '1994-01-14', '2012-05-17', 80, 19),
(65, '2004-03-25', NULL, 146, 39),
(66, '2016-01-19', NULL, 19, 36),
(67, '1996-06-08', NULL, 14, 44),
(68, '1997-10-04', NULL, 41, 46),
(69, '1980-12-02', NULL, 101, 43),
(70, '2003-11-17', NULL, 59, 45),
(71, '1977-04-20', '1982-06-10', 114, 19),
(72, '1970-08-05', NULL, 112, 45),
(73, '2012-12-19', NULL, 146, 47),
(74, '1980-08-26', NULL, 44, 36),
(75, '1987-04-02', '1987-11-27', 60, 19),
(76, '1989-05-09', '1995-10-14', 150, 15),
(77, '1994-05-19', NULL, 57, 49),
(78, '1978-06-26', '2003-07-21', 24, 27),
(79, '1999-11-16', NULL, 149, 47),
(80, '1994-07-02', NULL, 43, 44),
(81, '2011-02-03', NULL, 103, 44),
(82, '1976-07-15', '2006-01-23', 10, 0),
(83, '1983-02-24', NULL, 35, 48),
(84, '2014-07-05', NULL, 38, 43),
(85, '1972-07-05', NULL, 112, 32),
(86, '2016-10-05', NULL, 66, 44),
(87, '1983-06-21', NULL, 92, 31),
(88, '1972-11-21', NULL, 20, 38),
(89, '2002-03-18', NULL, 88, 33),
(90, '2014-01-20', NULL, 148, 36),
(91, '2010-05-14', NULL, 36, 39),
(92, '2010-06-15', NULL, 66, 42),
(93, '2002-03-27', NULL, 4, 50),
(94, '1972-02-02', NULL, 34, 41),
(95, '2013-11-23', '2020-02-20', 150, 20),
(96, '1997-01-29', '2012-01-18', 32, 17),
(97, '2021-10-27', NULL, 145, 42),
(98, '1973-09-25', '2007-06-17', 25, 10),
(99, '1973-04-14', '1993-10-02', 23, 18),
(100, '2008-05-26', NULL, 26, 41),
(101, '1983-11-05', NULL, 46, 39),
(102, '2022-11-28', NULL, 73, 36),
(103, '1978-06-16', NULL, 148, 36),
(104, '2013-03-09', NULL, 89, 46),
(105, '2010-05-06', NULL, 55, 41),
(106, '1973-11-22', '2007-10-20', 110, 15),
(107, '2006-12-11', NULL, 58, 35),
(108, '2014-01-22', NULL, 4, 40),
(109, '2012-03-02', NULL, 45, 47),
(110, '1991-08-16', '1993-07-14', 21, 21),
(111, '2010-02-25', '2018-08-11', 123, 13),
(112, '2006-03-06', '2008-12-19', 25, 9),
(113, '1982-06-24', NULL, 10, 47),
(114, '1991-10-26', NULL, 65, 33),
(115, '2023-02-05', NULL, 55, 41),
(116, '1975-04-11', '1981-12-18', 60, 3),
(117, '1971-12-11', NULL, 0, 49),
(118, '1975-10-07', NULL, 24, 31),
(119, '2012-04-19', NULL, 141, 41),
(120, '2021-07-16', NULL, 138, 36),
(121, '1992-09-16', NULL, 61, 49),
(122, '1978-11-09', '1981-08-02', 46, 24),
(123, '1995-05-26', '2017-06-14', 121, 12),
(124, '1998-06-15', '2017-03-04', 13, 24),
(125, '2009-04-04', NULL, 18, 40),
(126, '2002-07-03', '2022-06-07', 148, 19),
(127, '1983-07-20', '1988-02-15', 69, 28),
(128, '2015-04-18', NULL, 54, 42);

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(37, 'Abuse of plants'),
(7, 'African Americans'),
(16, 'Alphabet'),
(34, 'Animals'),
(33, 'Anxiety'),
(79, 'Art'),
(6, 'Bibliothèques - Prévision'),
(8, 'Biography & Autobiography'),
(40, 'Body, Mind & Spirit'),
(2, 'Books'),
(14, 'Business & Economics'),
(4, 'Castles'),
(19, 'Children\'s stories, French'),
(11, 'Christian life'),
(22, 'Comic books, strips, etc'),
(23, 'Comics & Graphic Novels'),
(24, 'Cooking'),
(10, 'Family & Relationships'),
(13, 'Fathers and daughters'),
(12, 'Female nude in art'),
(32, 'Fiction'),
(29, 'Folklore'),
(30, 'Forensic pathologists'),
(36, 'Foxes'),
(9, 'Health & Fitness'),
(15, 'Humor'),
(31, 'Juvenile Fiction'),
(26, 'Juvenile Nonfiction'),
(21, 'Language Arts & Disciplines'),
(38, 'Leadership'),
(3, 'Leprechauns'),
(20, 'Literary Collections'),
(41, 'Literary Criticism'),
(10000, 'mystère et boule de gum'),
(35, 'Pastry'),
(1, 'Performing Arts'),
(39, 'Philosophy'),
(5, 'Political Science'),
(27, 'Psychology'),
(28, 'Religion'),
(0, 'Science'),
(25, 'Self-Help'),
(17, 'Social Science'),
(18, 'Young Adult Fiction');

-- --------------------------------------------------------

--
-- Structure de la table `Editor`
--

CREATE TABLE `Editor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Editor`
--

INSERT INTO `Editor` (`id`, `name`) VALUES
(41, '[montréal] : éditions flammarion'),
(72, '[montréal] : leméac'),
(4, '10/18'),
(66, '12 21'),
(16, 'actes sud junior'),
(64, 'albin michel'),
(26, 'alisio'),
(38, 'ariane éditions'),
(11, 'au diable vauvert'),
(42, 'bayard jeunesse'),
(9, 'belfond'),
(10000, 'Benjamin Loupiac'),
(35, 'bod   books on demand'),
(34, 'casa bautista de publicaciones'),
(15, 'christian bourgois éditeur'),
(40, 'collection xix'),
(62, 'companyédition éditions xavier barral/le bal'),
(2, 'contemporary french fiction'),
(57, 'dupuis'),
(25, 'école des loisirs'),
(59, 'éditions actes sud'),
(56, 'éditions anne carrière'),
(22, 'éditions de l\'école'),
(76, 'éditions de l\'olivier'),
(65, 'éditions de la maison des sciences de l’homme'),
(21, 'éditions des deux terres'),
(0, 'éditions du seuil jeunesse'),
(13, 'éditions éyrolles'),
(10, 'éditions gallimard'),
(29, 'éditions gallmeister'),
(51, 'éditions globe'),
(60, 'éditions jouvence'),
(69, 'éditions mosquito'),
(68, 'fayard'),
(49, 'firefly books'),
(17, 'flammarion'),
(6, 'fv éditions'),
(44, 'gallimard éducation'),
(30, 'gallimard jeunesse'),
(52, 'guy saint jean éditeur'),
(75, 'guy trédaniel'),
(27, 'hachette pratique'),
(48, 'hugo roman'),
(43, 'j\'ai lu'),
(99, 'jc lattès'),
(63, 'jean claude lattès'),
(73, 'josé corti éditions'),
(28, 'l\'école des loisirs'),
(71, 'la découverte'),
(20, 'la peuplade'),
(32, 'larousse'),
(47, 'ldp policiers'),
(61, 'le livre de poche'),
(50, 'le masque'),
(18, 'les arènes'),
(3, 'les editions scholastic'),
(58, 'lgf/le livre de poche'),
(37, 'libris éditions'),
(23, 'livre de poche'),
(8, 'lucien x. polastron'),
(24, 'mana books'),
(31, 'média diffusion'),
(7, 'michel lafon'),
(74, 'montréal : québec/amérique'),
(53, 'nathan'),
(54, 'openédition press'),
(19, 'paulsen'),
(45, 'pearson'),
(36, 'philippe rey'),
(46, 'pocket'),
(12, 'pottermore publishing'),
(39, 'presses universitaires de rennes'),
(33, 'r jeunes adultes'),
(67, 'république des lettres'),
(5, 'robert laffont'),
(70, 'saint hubert, québec : un monde différent'),
(55, 'scholastic'),
(14, 'seuil'),
(1, 'ulysses press');

-- --------------------------------------------------------

--
-- Structure de la table `Follow`
--

CREATE TABLE `Follow` (
  `id` int(11) NOT NULL,
  `id_follow` int(11) NOT NULL,
  `id_is_followed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Follow`
--

INSERT INTO `Follow` (`id`, `id_follow`, `id_is_followed`) VALUES
(50, 0, 1),
(35, 0, 20),
(1, 0, 50),
(26, 2, 12),
(13, 2, 16),
(10, 2, 32),
(27, 3, 16),
(20, 5, 12),
(21, 5, 30),
(38, 10, 39),
(12, 11, 10),
(6, 11, 26),
(28, 13, 38),
(17, 14, 10),
(5, 15, 5),
(22, 16, 23),
(0, 16, 26),
(44, 18, 35),
(11, 20, 33),
(42, 21, 4),
(47, 22, 15),
(34, 24, 22),
(15, 25, 4),
(48, 25, 15),
(32, 26, 6),
(18, 26, 16),
(36, 30, 29),
(19, 31, 28),
(37, 32, 20),
(31, 32, 49),
(46, 33, 16),
(43, 33, 25),
(9, 33, 30),
(4, 33, 37),
(49, 33, 46),
(3, 34, 32),
(16, 34, 45),
(8, 35, 5),
(24, 35, 10),
(45, 35, 22),
(14, 39, 14),
(39, 40, 49),
(40, 41, 18),
(25, 41, 46),
(41, 42, 1),
(2, 42, 33),
(30, 44, 5),
(29, 45, 24),
(7, 45, 47),
(33, 47, 26),
(23, 50, 28);

-- --------------------------------------------------------

--
-- Structure de la table `Reader`
--

CREATE TABLE `Reader` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Reader`
--

INSERT INTO `Reader` (`id`, `first_name`, `last_name`, `email`, `picture`, `password`, `token`) VALUES
(0, 'admin', 'admin', 'admin@admin', NULL, 'admin', NULL),
(1, 'Antoine', 'Lelièvre', 'Antoine@Lelièvre', NULL, 'Antoine', 'XnQyBlqzIKFngzKPbzlK'),
(2, 'Élise', 'Renaud', 'Élise@Renaud', NULL, 'Élise', 'GIdGgcesBHWhNltTBnJN'),
(3, 'Joséphine', 'Marchal-Georges', 'Joséphine@Marchal-Georges', NULL, 'Joséphine', 'jTOuaJIYwLPGTNhnrZcV'),
(4, 'Sébastien', 'Lombard', 'Sébastien@Lombard', NULL, 'Sébastien', NULL),
(5, 'Françoise', 'Jean', 'Françoise@Jean', NULL, 'Françoise', NULL),
(6, 'Alexandre', 'Vaillant', 'Alexandre@Vaillant', NULL, 'Alexandre', NULL),
(7, 'Lucas-Stéphane', 'Rossi', 'Lucas-Stéphane@Rossi', NULL, 'Lucas-Stéphane', NULL),
(8, 'Margot', 'Leclerc', 'Margot@Leclerc', NULL, 'Margot', NULL),
(9, 'Christophe', 'Georges', 'Christophe@Georges', NULL, 'Christophe', NULL),
(10, 'Émile', 'Allard-Vallet', 'Émile@Allard-Vallet', NULL, 'Émile', NULL),
(11, 'Sylvie', 'Michel', 'Sylvie@Michel', NULL, 'Sylvie', NULL),
(12, 'Grégoire', 'Laporte', 'Grégoire@Laporte', NULL, 'Grégoire', NULL),
(13, 'Victor', 'Guillon', 'Victor@Guillon', NULL, 'Victor', NULL),
(14, 'Inès', 'du', 'Inès@du', NULL, 'Inès', NULL),
(15, 'Nicolas', 'Marques-Leblanc', 'Nicolas@Marques-Leblanc', NULL, 'Nicolas', NULL),
(16, 'Bernard', 'Merle-Marchand', 'Bernard@Merle-Marchand', NULL, 'Bernard', NULL),
(17, 'Chantal', 'Noël', 'Chantal@Noël', NULL, 'Chantal', NULL),
(18, 'Arthur', 'Leroy', 'Arthur@Leroy', NULL, 'Arthur', NULL),
(19, 'Joseph', 'Weber', 'Joseph@Weber', NULL, 'Joseph', NULL),
(20, 'Julie', 'Leleu', 'Julie@Leleu', NULL, 'Julie', NULL),
(21, 'Benjamin', 'Monnier', 'Benjamin@Monnier', NULL, 'Benjamin', NULL),
(22, 'Michelle', 'Arnaud', 'Michelle@Arnaud', NULL, 'Michelle', NULL),
(23, 'Emmanuel', 'Bonnet', 'Emmanuel@Bonnet', NULL, 'Emmanuel', NULL),
(24, 'Aurore-Christine', 'Baudry', 'Aurore-Christine@Baudry', NULL, 'Aurore-Christine', NULL),
(25, 'Anouk', 'Guyon-Thibault', 'Anouk@Guyon-Thibault', NULL, 'Anouk', NULL),
(26, 'Alice-Aurore', 'Marion', 'Alice-Aurore@Marion', NULL, 'Alice-Aurore', NULL),
(27, 'Aimé', 'Gaillard', 'Aimé@Gaillard', NULL, 'Aimé', NULL),
(28, 'Benoît', 'Gilles', 'Benoît@Gilles', NULL, 'Benoît', NULL),
(29, 'Sylvie', 'Dumas-Perret', 'Sylvie@Dumas-Perret', NULL, 'Sylvie', NULL),
(30, 'Luc', 'Gautier', 'Luc@Gautier', NULL, 'Luc', NULL),
(31, 'Daniel', 'du', 'Daniel@du', NULL, 'Daniel', NULL),
(32, 'Laure', 'Cohen', 'Laure@Cohen', NULL, 'Laure', NULL),
(33, 'Henri', 'Bazin', 'Henri@Bazin', NULL, 'Henri', NULL),
(34, 'Emmanuel', 'Thierry', 'Emmanuel@Thierry', NULL, 'Emmanuel', NULL),
(35, 'Marcel', 'Robin', 'Marcel@Robin', NULL, 'Marcel', NULL),
(36, 'Alexandrie', 'Petit', 'Alexandrie@Petit', NULL, 'Alexandrie', NULL),
(37, 'Aimée', 'Ribeiro', 'Aimée@Ribeiro', NULL, 'Aimée', NULL),
(38, 'Michelle', 'Jacquet', 'Michelle@Jacquet', NULL, 'Michelle', 'NJjWDEWPJgtsOBcawrCh'),
(39, 'Dominique', 'Renault', 'Dominique@Renault', NULL, 'Dominique', 'OySfTwkVIGMBFwmNPBXn'),
(40, 'Édith', 'Mathieu', 'Édith@Mathieu', NULL, 'Édith', 'AxKICTXeEQmXRyQrmwgr'),
(41, 'Hugues', 'Lebreton', 'Hugues@Lebreton', NULL, 'Hugues', 'JzOlvPKmXvYMTwytUinA'),
(42, 'Lucas', 'Pineau', 'Lucas@Pineau', NULL, 'Lucas', 'FiCfzHgiodYHOePpeUfN'),
(43, 'Patrick', 'Leleu', 'Patrick@Leleu', NULL, 'Patrick', 'WZFGzouXhlFORgjmizVM'),
(44, 'Frédéric', 'Clerc', 'Frédéric@Clerc', NULL, 'Frédéric', 'PtLGfaXejnNKcnHIFFEc'),
(45, 'Jacques', 'du', 'Jacques@du', NULL, 'Jacques', 'BptQZoZOfbHRKbVMcwbv'),
(46, 'Zacharie', 'Pires', 'Zacharie@Pires', NULL, 'Zacharie', 'EWPqrEiUcdtcrAqSJETH'),
(47, 'Nathalie', 'Rossi', 'Nathalie@Rossi', NULL, 'Nathalie', 'KWiYuGUJKoynoDkEUZor'),
(48, 'Juliette', 'Delattre-Gimenez', 'Juliette@Delattre-Gimenez', NULL, 'Juliette', 'ymuJPQCCctmbbBePvRjC'),
(49, 'Caroline', 'Alexandre', 'Caroline@Alexandre', NULL, 'Caroline', 'hYjLCXOIAioLXTrANlhS'),
(50, 'Claudine', 'Le', 'Claudine@Le', NULL, 'Claudine', 'iwGxymUlswDDJAHqBjyl');

-- --------------------------------------------------------

--
-- Structure de la table `Write_`
--

CREATE TABLE `Write_` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `editor` (`editor`);

--
-- Index pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Category_category_name` (`name`);

--
-- Index pour la table `Editor`
--
ALTER TABLE `Editor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Editor_name` (`name`);

--
-- Index pour la table `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Follow_id_follow_id_is_followed` (`id_follow`,`id_is_followed`),
  ADD KEY `id_follow` (`id_follow`),
  ADD KEY `id_is_followed` (`id_is_followed`);

--
-- Index pour la table `Reader`
--
ALTER TABLE `Reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Reader_email` (`email`);

--
-- Index pour la table `Write_`
--
ALTER TABLE `Write_`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Write_id_author_id_book` (`id_author`,`id_book`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_author`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`category`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `Editor` (`id`);

--
-- Contraintes pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD CONSTRAINT `Borrow_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Borrow_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `Reader` (`id`);

--
-- Contraintes pour la table `Follow`
--
ALTER TABLE `Follow`
  ADD CONSTRAINT `Follow_ibfk_1` FOREIGN KEY (`id_follow`) REFERENCES `Reader` (`id`),
  ADD CONSTRAINT `Follow_ibfk_2` FOREIGN KEY (`id_is_followed`) REFERENCES `Reader` (`id`);

--
-- Contraintes pour la table `Write_`
--
ALTER TABLE `Write_`
  ADD CONSTRAINT `Write__ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Write__ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `Author` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
