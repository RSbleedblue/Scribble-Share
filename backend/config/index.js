import express from 'express';
import userRouter from '../routes/userRoutes.js';
import dotenv from 'dotenv';
import cors from 'cors';
import { Server } from 'socket.io';
import http from 'http';
import PointsController from '../controller/pointsController.js';

// Load environment variables
dotenv.config();

// Initialize Express
const app = express();

// Apply CORS middleware before any route definitions
app.use(cors());

// Use JSON middleware to parse request bodies
app.use(express.json());

// Routes
app.use("/api/user", userRouter);

// Create HTTP server using the Express app
const server = http.createServer(app);

// Initialize Socket.io with the HTTP server
const io = new Server(server, {
    cors: {
        origin: "*",  // Replace with your frontend's domain in production
        methods: ["GET", "POST"]
    }
});

// Initialize PointsController
const pointController = new PointsController(); 

// Setup socket.io connection
io.on('connection', (socket) => {
    console.log("User Connected", socket.id);

    socket.on("draw", async (data) => {
        const result = await pointController.savePoint(data);

        if (result.success) {
            socket.broadcast.emit('draw', data);
            socket.emit('draw_status', { status: 'success', message: result.message });
        } else {
            socket.emit('draw_status', { status: 'error', message: result.message });
        }
    });

    socket.on("disconnect", () => {
        console.log("User Disconnected", socket.id);
    });
});

export { app, server };
