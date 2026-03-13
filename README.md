# Dance School Management System

A Fullstack web application designed for managing students, classes, and schedules for a Dance School. Built as part of the PDS (Projeto de Desenvolcimento de Software) course.

## Project Architecture

The project follows a **Monorepo** structure to keep the codebase organized:

- **/frontend**: React interface built with Vite, TypeScript, and Tailwind CSS.
- **/backend**: REST API built with Node.js, Express, TypeScript, and Prisma ORM.

## Tech Stack

| Layer          | Technology                                   |
| :------------- | :------------------------------------------- |
| **Frontend**   | React 19, TypeScript, Vite 6, Tailwind CSS 4 |
| **Backend**    | Node.js, Express, TypeScript, Prisma         |
| **Database**   | PostgreSQL (Hosted on Neon.tech)             |
| **Deployment** | Vercel (Frontend) & Render (Backend)         |

---

## Live Deployment

The application is automatically deployed via GitHub Actions/Hooks:

- **Frontend (Vercel)**: https://dance-school-app-steel.vercel.app
- **Backend API (Render)**: https://dance-school-app-skz9.onrender.com

## Development Team

**João Paulo Soares**\
**Filipe Fernandes**\
**Rita Ranito**\
**Edga Casal**\
**Simão Machado**

## Key Features Implemented

    Fullstack Monorepo Structure

    Database Schema with Prisma & PostgreSQL

    TypeScript integration on both Front and Back

    Automated CI/CD Deployment

    CORS Security configuration
