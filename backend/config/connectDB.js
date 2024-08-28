import mongoose from "mongoose";

const connectDB = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URL, {
            appName: "SynchShare",
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        console.log("Database successfully connected!");
    } catch (error) {
        console.error("Database connection failed:", error.message);
        process.exit(1); 
    }
};

export default connectDB;
