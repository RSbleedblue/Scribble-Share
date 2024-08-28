import express from 'express';
import userRouter from '../routes/userRoutes.js';
import dotenv from 'dotenv';

const app = express();

dotenv.config();
app.use(express.json());
app.use("/api/user",userRouter);


export default app;