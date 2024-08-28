import app from "../backend/config/index.js";
import connectDB from "./config/connectDB.js";

await connectDB();
app.listen(process.env.PORT, () => {
    console.log(`Server is running at http://localhost:${process.env.PORT}`);
});
