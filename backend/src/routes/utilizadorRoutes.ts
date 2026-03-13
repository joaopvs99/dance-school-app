import { Router } from 'express';
import { criarUtilizador } from '../controllers/utilizadorController';
import { listarUtilizadores } from '../controllers/utilizadorController';

const router = Router();

// Quando o React fizer um pedido POST para esta porta, executamos o cérebro (criarUtilizador)
router.post('/', criarUtilizador);

router.get('/', listarUtilizadores);

export default router;