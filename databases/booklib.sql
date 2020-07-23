DROP DATABASE IF EXISTS Booklib;

CREATE DATABASE Booklib; 

USE Booklib; 

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
  `firstname` VARCHAR(255),
  `lastname` VARCHAR(255),
  `biography` VARCHAR(10000)
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

INSERT INTO book (`title`, `resume`, `cover`, `genre`) VALUES ("Deux gouttes d'eau", "Une jeune femme est retrouvée morte dans son appartement de Boulogne-Billancourt, massacrée à coups de hache. Elle s'appelle Élodie et son ami, Antoine Deloye, est identifié sur l'enregistrement d'une caméra de vidéosurveillance de la ville, sortant de chez elle, l'arme du crime à la main. Immédiatement placé en garde à vue, Antoine s'obstine à nier malgré les évidences. Il accuse son frère jumeau, Franck, d'avoir profité de leur ressemblance pour mettre au point une machination destinée à le perdre. Quand Franck Deloye arrive au commissariat central pour être entendu, le trouble est immense : il est impossible de différencier les deux hommes, qui se ressemblent, littéralement, comme deux gouttes d'eau... ", "https://images-na.ssl-images-amazon.com/images/I/51DyTj1f28L._SX210_.jpg", "Policier"), ("Le Sorceleur - Le Dernier Voeu", "Geralt de Riv est un homme inquiétant, un mutant devenu le parfait assassin grâce à la magie et à un long entraînement. En ces temps obscurs, ogres, goules et vampires pullulent, et les magiciens sont des manipulateurs experts. Contre ces menaces, il faut un tueur à gages à la hauteur, et Geralt est plus qu'un guerrier ou un mage. C'est un sorceleur. Au cours de ses aventures, il rencontrera une magicienne capricieuse aux charmes vénéneux, un troubadour paillard au grand coeur... et, au terme de sa quête, peut-être réalisera-t-il son dernier voeu: retrouver son humanité perdue.", "https://static.fnac-static.com/multimedia/Images/FR/NR/7b/ed/a1/10612091/1540-1/tsp20190117161317/Le-dernier-voeu.jpg", "Fantasy");

INSERT INTO review (`review`, `book_id`) VALUES ("Livre policier très prenant. Je l'ai dévoré !", "1"), ("J'ai adoré. Je recommande", "2");