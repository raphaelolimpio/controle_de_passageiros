const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();
// Definir porta para o servidor
const PORT = 3000;

// Configurar body-parser para processar JSON
app.use(bodyParser.json());

// Configurar conexão com o MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '3221',
    database: 'controleusuario'
});

// Conectar ao MySQL
db.connect((err) => {
    if (err) throw err;
    console.log('Conectado ao MySQL');
});


app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});


// Rota para criar um novo usuário
app.post('/usuarios', (req, res) => {
    const { nome, email } = req.body;
    const sql = 'INSERT INTO usuarios (nome, email) VALUES (?, ?)';
    db.query(sql, [nome, email], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.status(201).send({ id: result.insertId, nome, email });
    });
});

// Rota para listar todos os usuários
app.get('/usuarios', (req, res) => {
    const sql = 'SELECT * FROM usuarios';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send(results);
    });
});

// Rota para atualizar um usuário
app.put('/usuarios/:id', (req, res) => {
    const { id } = req.params;
    const { nome, email } = req.body;
    const sql = 'UPDATE usuarios SET nome = ?, email = ? WHERE id = ?';
    db.query(sql, [nome, email, id], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send({ id, nome, email });
    });
});

// Rota para deletar um usuário
app.delete('/usuarios/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM usuarios WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send({ message: 'Usuário deletado com sucesso!' });
    });
});

