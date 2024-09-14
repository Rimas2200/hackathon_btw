const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const path = require('path');
const fs = require('fs');
const http = require('http');

const app = express();
const port = 3000;

// Настройка CORS
app.use(cors());

// Для парсинга JSON запросов
app.use(express.json());

// Настройка пула соединений с MySQL
const pool = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  database: 'xak_2024',
  password: '',
});

// Проверка соединения с базой данных
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Ошибка подключения к базе данных:', err);
    return;
  }
  console.log('Соединение с базой данных успешно установлено');

  // Освобождаем соединение после проверки
  connection.release();
});

// Простой GET-запрос для проверки работы сервера
app.get('/', (req, res) => {
  res.send('Сервер работает!');
});

app.get('/check-db', (req, res) => {
  pool.query('SELECT 1 + 1 AS result', (err, results) => {
    if (err) {
      console.error('Ошибка выполнения запроса:', err);
      res.status(500).send('Ошибка подключения к базе данных');
      return;
    }
    res.json({ message: 'Соединение с базой данных успешно!', result: results[0].result });
  });
});

// Запуск сервера
app.listen(port, () => {
  console.log(`Сервер запущен на порту ${port}`);
});
