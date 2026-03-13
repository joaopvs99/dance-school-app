import dotenv from 'dotenv';
import express, { Express, Request, Response } from 'express';
import cors from 'cors';
import utilizadorRoutes from './routes/utilizadorRoutes';

dotenv.config();

const app: Express = express();

app.use(cors({
  origin: [
    'http://localhost:5173',                   // Permite o teu React local
    'https://dance-school-app-steel.vercel.app' // Permite o teu site oficial no Vercel
  ],
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));
app.use(express.json());

// ==========================================
// AS NOSSAS ROTAS DA API
// ==========================================
app.use('/api/utilizadores', utilizadorRoutes);
// Rota de Teste original
app.get('/', (req: Request, res: Response) => {
  res.json({ mensagem: "Bem-vindo à API da Escola de Dança" });
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Servidor TS a correr com sucesso na porta ${PORT}`);
});