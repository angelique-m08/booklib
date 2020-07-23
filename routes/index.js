const express = require('express');

const book = require('./books');
const review = require('./reviews');

const router = express.Router();

router.use('/books', book);
router.use('/reviews', review);

module.exports = router;