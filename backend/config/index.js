import express from 'express';
import userRouter from '../routes/userRoutes.js';
import dotenv from 'dotenv';
import cors from 'cors';
import { Server } from 'socket.io';
import http from 'http';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.use("/api/user", userRouter);

const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

io.on('connection', (socket) => {
    console.log("User Connected", socket.id);
    
    socket.on("currentSketch", (data) => {
        console.log(`current Sketch ${JSON.stringify(data)}`);
        socket.broadcast.emit('currentSketch', data); // Broadcast to all clients except sender
    });

    socket.on("disconnect", () => {
        console.log("User Disconnected", socket.id);
    });
});

export { app, server };
