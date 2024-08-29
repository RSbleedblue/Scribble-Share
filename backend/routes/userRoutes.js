import { Router } from "express";
import UserController from "../controller/userController.js";

const userRouter = Router();
const userController = new UserController;

userRouter.post("/register",(req,res) => userController.createUser(req,res));
userRouter.post("/login",(req,res) => userController.loginUser(req,res));
export default userRouter