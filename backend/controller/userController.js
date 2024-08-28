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
}

export default UserController;
