const express = require('express');

const book = require('./books');
const review = require('./reviews');
const author = require('./authors');
const book_author = require('./books_authors');

const router = express.Router();

router.use('/books', book);
router.use('/reviews', review);
router.use('/authors', author);
router.use('/books-authors', book_author);

module.exports = router;