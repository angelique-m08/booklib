const express = require('express');

const book = require('./books');

const router = express.Router();

router.use('/books', book);

module.exports = router;