const express = require('express');
const connection = require('../conf');
const router = express.Router();

router.get('/', (req, res) => {
  connection.query('SELECT * from review', (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(200).json(results);
  });
});

router.post('/', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO review SET ?', formData, (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(201).json({ ...formData })
  });
});

module.exports = router;