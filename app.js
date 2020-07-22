require('dotenv').config();
const express = require('express');
const app = express();
const indexRouter = require('./routes');

app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));

app.use('/', indexRouter);

app.get('/', (req, res) => {
  res.status(200).json({message: 'Bienvenue sur Booklib'} );
});

module.exports = app; 