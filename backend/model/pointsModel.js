import mongoose from "mongoose";

const PointSchema = new mongoose.Schema({
    x : {
        type : Number,
        required : true,
    },

    y : {
        type : Number,
        required : true,
    },

    userId : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User',
        required : true,
    },

    timeStamp : {
        type : Date,
        default : Date.now,
    }
})

export default mongoose.model("points",PointSchema, "Points");