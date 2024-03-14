const mongoose = require("mongoose");
const studentSchema = mongoose.Schema({
name:{
    type:String,
    required:true
},
phoneNumber:{
    type:String,
    unique:true,
    required:true},
student:{
    type:String,
    required:true
},
description:{
    type:String,
    required:true
}
});

const Student=mongoose.model("studentInformation",studentSchema);
module.exports =Student;