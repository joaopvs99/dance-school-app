import { Router } from 'express';
import { criarUtilizador } from '../controllers/utilizadorController';
import { listarUtilizadores } from '../controllers/utilizadorController';

const router = Router();

// Quando o React fizer um pedido POST para esta porta, executamos criarUtilizador
router.post('/', criarUtilizador);
// Quando o React fizer um pedido GET para esta porta, executamos listarUtilizadores
router.get('/', listarUtilizadores);

export default router;