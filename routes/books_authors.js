const express = require('express');
const connection = require('../conf');
const router = express.Router();

router.get('/', (req, res) => {
  connection.query('SELECT * from book_author', (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(200).json(results);
  });
});

router.get('/:authorId/books', (req, res) => {
  const { authorId } = req.params;
  connection.query('SELECT * FROM book_author ba JOIN author a ON ba.author_id=a.id JOIN book b ON ba.book_id=b.id WHERE author_id = ?', authorId, (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(200).json(results);
  });
});

router.get('/:bookId/authors', (req, res) => {
  const { bookId } = req.params;
  connection.query('SELECT * FROM book_author ba JOIN author a ON ba.author_id=a.id JOIN book b ON ba.book_id=b.id WHERE book_id = ?', bookId, (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(200).json(results);
  });
});

module.exports = router;