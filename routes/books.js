const express = require('express');
const connection = require('../conf');
const router = express.Router();

router.get('/', (req, res) => {
  connection.query('SELECT * from book', (err, results) => {
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
  if (formData.title == "" || formData.title == null) {
    return (
      res.status(400).json({message: "Vous n'avez pas complété les champs nécessaires"})
    )
  }
  connection.query('INSERT INTO book SET ?', formData, (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(201).json({ ...formData, id: results.insertId })
  });
});

router.put('/:id', (req, res) => {
  const formData = req.body;
  const { id } = req.params;
  connection.query('UPDATE book SET ? WHERE id = ?', [formData, id], (err, results) => {
    if (err) {
      return (
        res.sendStatus(500)
      )
    }
    res.status(200).json({ ...formData })
  });
});

router.delete('/:id', (req, res) => {
  const { id } = req.params;
  connection.query('DELETE FROM book WHERE id = ?', id, err => {
    if (err) {
      return (
        res.sendStatus(500)
      )
      } else {
        res.sendStatus(200)
      }  
  });
});

module.exports = router;