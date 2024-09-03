import User from "../model/userModel.js";

class UserController {
    constructor() {}

    async createUser(req, res) {
        const { name, email, password } = req.body;
        try {
            const existingUser = await User.findOne({ email });
            if (existingUser) {
                return res.status(400).json({
                    message: `User already registered with the email ${email}`,
                    success: false
                });
            }
            const newUser = new User({ name, email, password });
            const createdUser = await newUser.save();

            return res.status(201).json({
                message: "User successfully created",
                data: createdUser,
                success: true
            });
        } catch (err) {
            console.error("Error creating user:", err);
            return res.status(500).json({
                message: "Error while creating the user",
                success: false
            });
        }
    }

    async loginUser(req, res) {
        const { email, password } = req.body;
        try {
            const findUser = await User.findOne({ email });
            if (!findUser) {
                return res.status(400).json({
                    message: "User is not registered with us",
                    success: false
                });
            }
            const isMatch = await findUser.comparePassword(password);
            if (!isMatch) {
                return res.status(400).json({
                    message: "Wrong password",
                    success: false
                });
            }
            const token = await findUser.createToken(); 
            return res.status(200).json({
                message: "User successfully logged in",
                token: token,
                user : findUser.id,
                success: true
            });
        } catch (err) {
            console.error("Error logging in user:", err);
            return res.status(500).json({
                message: "Unexpected error occurred",
                error: err,
                success: false
            });
        }
    }
}

export default UserController;
