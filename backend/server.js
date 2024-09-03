import { server } from './config/index.js';
import connectDB from './config/connectDB.js';

await connectDB();
server.listen(process.env.PORT, () => {
    console.log(`Server is running at http://localhost:${process.env.PORT}`);
});
