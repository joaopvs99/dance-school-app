-- CreateEnum
CREATE TYPE "Role" AS ENUM ('DIRECAO', 'PROFESSOR', 'ENCARREGADO');

-- CreateEnum
CREATE TYPE "EstadoSessao" AS ENUM ('AGENDADA', 'CONCLUIDA', 'CANCELADA');

-- CreateEnum
CREATE TYPE "EstadoArtigo" AS ENUM ('DISPONIVEL', 'TROCADO', 'REMOVIDO', 'MANUTENCAO');

-- CreateTable
CREATE TABLE "Utilizador" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ENCARREGADO',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Utilizador_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Aluno" (
    "id" SERIAL NOT NULL,
    "numAluno" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "dataNascimento" TIMESTAMP(3) NOT NULL,
    "utilizadorId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessaoCoaching" (
    "id" SERIAL NOT NULL,
    "dataHora" TIMESTAMP(3) NOT NULL,
    "estado" "EstadoSessao" NOT NULL DEFAULT 'AGENDADA',
    "alunoId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SessaoCoaching_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtigoTroca" (
    "id" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT,
    "tamanho" TEXT NOT NULL,
    "fotoUrl" TEXT NOT NULL,
    "estado" "EstadoArtigo" NOT NULL DEFAULT 'DISPONIVEL',
    "utilizadorId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ArtigoTroca_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Utilizador_email_key" ON "Utilizador"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_numAluno_key" ON "Aluno"("numAluno");

-- AddForeignKey
ALTER TABLE "Aluno" ADD CONSTRAINT "Aluno_utilizadorId_fkey" FOREIGN KEY ("utilizadorId") REFERENCES "Utilizador"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SessaoCoaching" ADD CONSTRAINT "SessaoCoaching_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "Aluno"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtigoTroca" ADD CONSTRAINT "ArtigoTroca_utilizadorId_fkey" FOREIGN KEY ("utilizadorId") REFERENCES "Utilizador"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
