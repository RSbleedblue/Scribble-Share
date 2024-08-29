import express from 'express';
import userRouter from '../routes/userRoutes.js';
import dotenv from 'dotenv';
import cors from 'cors';

const app = express();

dotenv.config();
app.use(express.json());
app.use("/api/user",userRouter);
app.use(cors());

export default app;