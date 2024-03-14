const express=require("express");
const Student = require("./user_model");
 const UserRouter =express.Router();


UserRouter.post("/student/data",async(req,res)=>{
try{
    const {name,phoneNumber,student,description}=req.body;

const dataShow=  Student({
    name,
    phoneNumber,
    student,
    description
});

dataShow=await dataShow.save();
res.json(dataShow);
}catch(error)
{
    res.status(500).json({error:error.message});
}
});

module.exports=UserRouter;