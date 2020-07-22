DROP DATABASE IF EXISTS Booklib_test;

CREATE DATABASE Booklib_test; 

USE Booklib_test; 

/* -------- Tables creation  --------- */

CREATE TABLE `book` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `resume` VARCHAR(255),
  `cover` VARCHAR(255),
  `genre` VARCHAR(255)
);

CREATE TABLE `author` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `firstname` VARCHAR(255),
  `lastname` VARCHAR(255),
  `biography` VARCHAR(255)
);

CREATE TABLE `review` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `review` VARCHAR(255),
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