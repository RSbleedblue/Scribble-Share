import Point from "../model/pointsModel.js";

class PointsController {
    async savePoint(data) {
        try {
            const point = new Point({
                x : data.x,
                y : data.y,
                userId : data.userId
            });
            await point.save();
            return {success: true, message : "Points saved successfully"}
        }
        catch(err){
            console.error("Error while saving the Points");
            return {success : false, message : "Failed to save the point"};
        }
    }
}

export default PointsController;