import { Router } from 'express';
import { criarUtilizador } from '../controllers/utilizadorController';

const router = Router();

// Quando o React fizer um pedido POST para esta porta, executamos o cérebro (criarUtilizador)
router.post('/', criarUtilizador);

export default router;