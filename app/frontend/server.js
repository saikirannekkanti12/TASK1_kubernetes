const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const port = process.env.PORT || 80;
const apiUrl = process.env.API_URL || 'http://localhost:5000';

app.use('/static', express.static(path.join(__dirname, 'public')));

app.get('/healthz', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('*', (req, res) => {
  const htmlPath = path.join(__dirname, 'public', 'index.html');
  const html = fs.readFileSync(htmlPath, 'utf8').replace('__API_URL__', apiUrl);
  res.send(html);
});

app.listen(port, () => {
  console.log(`Frontend server running on port ${port}`);
});
