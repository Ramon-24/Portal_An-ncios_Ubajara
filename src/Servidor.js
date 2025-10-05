import cors from "cors";
import express from "express";

const app = express();

// Configuração do middleware CORS antes dos roteadores
app.use(cors({
    origin: "http://localhost:5173",
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
}));



app.use(express.json());




app.get("/", (req, res) => {
    res.send("Servidor Portal de Anúncios Ubajara, está rodando!")
})

app.listen(3333, (req, res) => {
    console.log("Servidor rodando do Portal de Anúncios Ubajara esta no ar!")
});

