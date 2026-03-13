import { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

// Ligar o Prisma (a ponte para a base de dados)
const prisma = new PrismaClient();

// Função para criar um novo utilizador
export const criarUtilizador = async (req: Request, res: Response) => {
  try {
    // 1. Receber os dados que vêm do Frontend (React)
    const { nome, email, password } = req.body;

    // 2. Mandar o Prisma guardar no Neon
    const novoUtilizador = await prisma.utilizador.create({
      data: {
        nome,
        email,
        password, // Nota: Mais à frente vamos encriptar esta password por segurança!
      },
    });

    // 3. Devolver uma resposta de sucesso ao Frontend
    res.status(201).json({ 
      mensagem: "Utilizador criado com sucesso!", 
      utilizador: novoUtilizador 
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ erro: "Erro ao criar utilizador. O email já pode existir." });
  }
};