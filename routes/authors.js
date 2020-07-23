const express = require('express');
const connection = require('../conf');
const router = express.Router();

router.get('/', (req, res) => {
  connection.query('SELECT * from author', (err, results) => {
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
  if (formData.firstname == "" || formData.firstname == null) {
    return (
      res.status(400).json({message: "Vous n'avez pas complété les champs nécessaires"})
    )
  }
  connection.query('INSERT INTO author SET ?', formData, (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(201).json({ ...formData, id: results.insertId })
  });
});

module.exports = router;