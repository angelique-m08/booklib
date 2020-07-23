DROP DATABASE IF EXISTS Booklib_test;

CREATE DATABASE Booklib_test; 

USE Booklib_test; 

/* -------- Tables creation  --------- */

CREATE TABLE `book` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `resume` VARCHAR(10000),
  `cover` VARCHAR(255),
  `genre` VARCHAR(255)
);

CREATE TABLE `author` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255),
  `biography` VARCHAR(10000), 
  `picture` VARCHAR(500)
);

CREATE TABLE `review` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `review` VARCHAR(10000) NOT NULL,
  `book_id` INT NOT NULL
);

CREATE TABLE `book_author` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL
);

/* ------------ Contraints  ------------- */

ALTER TABLE `review`
ADD CONSTRAINT `fk_book_review`
FOREIGN KEY (`book_id`)
REFERENCES `book`(`id`);

ALTER TABLE `book_author`
ADD CONSTRAINT `fk_author_id`
FOREIGN KEY (`author_id`)
REFERENCES `author`(`id`);

ALTER TABLE `book_author`
ADD CONSTRAINT `fk_book_id`
FOREIGN KEY (`book_id`)
REFERENCES `book`(`id`);


/* ------------ Insert  ------------- */

INSERT INTO book (`title`, `resume`, `cover`, `genre`) VALUES ("Deux gouttes d'eau", "Une jeune femme est retrouvée morte dans son appartement de Boulogne-Billancourt, massacrée à coups de hache. Elle s'appelle Élodie et son ami, Antoine Deloye, est identifié sur l'enregistrement d'une caméra de vidéosurveillance de la ville, sortant de chez elle, l'arme du crime à la main. Immédiatement placé en garde à vue, Antoine s'obstine à nier malgré les évidences. Il accuse son frère jumeau, Franck, d'avoir profité de leur ressemblance pour mettre au point une machination destinée à le perdre. Quand Franck Deloye arrive au commissariat central pour être entendu, le trouble est immense : il est impossible de différencier les deux hommes, qui se ressemblent, littéralement, comme deux gouttes d'eau... ", "https://images-na.ssl-images-amazon.com/images/I/51DyTj1f28L._SX210_.jpg", "Policier"), ("Le Sorceleur - Le Dernier Voeu", "Geralt de Riv est un homme inquiétant, un mutant devenu le parfait assassin grâce à la magie et à un long entraînement. En ces temps obscurs, ogres, goules et vampires pullulent, et les magiciens sont des manipulateurs experts. Contre ces menaces, il faut un tueur à gages à la hauteur, et Geralt est plus qu'un guerrier ou un mage. C'est un sorceleur. Au cours de ses aventures, il rencontrera une magicienne capricieuse aux charmes vénéneux, un troubadour paillard au grand coeur... et, au terme de sa quête, peut-être réalisera-t-il son dernier voeu: retrouver son humanité perdue.", "https://static.fnac-static.com/multimedia/Images/FR/NR/7b/ed/a1/10612091/1540-1/tsp20190117161317/Le-dernier-voeu.jpg", "Fantasy"), ("Germinal", "Fils de Gervaise Macquart et de son amant Auguste Lantier, le jeune Étienne Lantier s'est fait renvoyer de son travail pour avoir donné une gifle à son employeur. Chômeur, il part dans le Nord de la France à la recherche d’un nouvel emploi. Il se fait embaucher aux mines de Montsou et connaît des conditions de travail effroyables.", "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Gil_Blas_-_Germinal.jpg/250px-Gil_Blas_-_Germinal.jpg", "Littérature");

INSERT INTO review (`review`, `book_id`) VALUES ("Livre policier très prenant. Je l'ai dévoré !", "1"), ("J'ai adoré. Je recommande", "2"), ("Un grand classique", "3");

INSERT INTO author (`firstname`, `lastname`, `biography`, `picture`) VALUES ("Jacques", "Expert", "Jacques Expert, né en 1956 à Bordeaux, est un journaliste, dirigeant de l'audiovisuel et écrivain français.", "https://cdn-s-www.ledauphine.com/images/ABB2AF9C-90E5-459B-B694-02002361586A/NW_detail_M/title-1576680650.jpg"), ("Andrzej", "Sapkowski", "Andrzej Sapkowski, né le 21 juin 1948 à Łódź, est un écrivain polonais, auteur d'histoires fantastiques et de fantasy. Surnommé « le Tolkien polonais »1,2, il est surtout connu pour sa saga littéraire Le Sorceleur, qui a été adaptée sous forme de jeu vidéo (The Witcher) et de série (The Witcher).", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Andrzej_Sapkowski_-_Lucca_Comics_and_Games_2015_2.JPG/220px-Andrzej_Sapkowski_-_Lucca_Comics_and_Games_2015_2.JPG"), ("George R. R.", "Martin", "George R. R. Martin, né le 20 septembre 1948 à Bayonne (New Jersey), est un écrivain américain de science-fiction et de fantasy, également scénariste et producteur de télévision. Son œuvre la plus connue est la série romanesque du Trône de fer, adaptée sous forme de série télévisée par HBO sous le titre Game of Thrones. ", "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/George_R._R._Martin_by_Gage_Skidmore_2.jpg/220px-George_R._R._Martin_by_Gage_Skidmore_2.jpg"), ("Emile", "Zola", "Émile Zola est un écrivain et journaliste français, né le 2 avril 1840 à Paris et mort le 29 septembre 1902 dans la même ville. Considéré comme le chef de file du naturalisme, c'est l'un des romanciers français les plus populaires, les plus publiés, traduits et commentés au monde. Ses romans ont connu de très nombreuses adaptations au cinéma et à la télévision.", "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Emile_Zola_1902.jpg/260px-Emile_Zola_1902.jpg");

INSERT INTO book_author (`book_id`, `author_id`) VALUES ("1", "1"), ("2", "2");