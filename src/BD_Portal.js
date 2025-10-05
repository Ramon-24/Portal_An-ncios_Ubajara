import e from "express";
import mysql from "mysql2";

const conexao = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "portal_anuncios"
});

conexao.connect((err) => {
    if (err) {
        console.log("Erro ao conectar no banco de dados do Portal de Anúncios Ubajara: ",  err);
        return;
    }
    else {
        console.log("Conexão com o banco de dados realizada com sucesso!");
    }
});

export { conexao };