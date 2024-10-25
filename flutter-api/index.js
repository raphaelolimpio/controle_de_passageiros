const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json()); // Para processar requisições JSON

// Configuração de conexão ao MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'seu_usuario',   // Altere para seu usuário do MySQL
  password: 'sua_senha', // Altere para sua senha do MySQL
  database: 'seu_banco_de_dados' // Altere para seu banco de dados
});

// Conectando ao banco de dados
db.connect(err => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conectado ao banco de dados MySQL');
});

// Rotas de exemplo
app.get('/', (req, res) => {
  res.send('API está funcionando!');
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
