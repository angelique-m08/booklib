const express = require('express');

const book = require('./books');
const review = require('./reviews');
const author = require('./authors');

const router = express.Router();

router.use('/books', book);
router.use('/reviews', review);
router.use('/authors', author);

module.exports = router;