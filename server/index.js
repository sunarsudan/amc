const express = require("express");
const app = express();
const mongoose = require("mongoose");
const UserRouter = require("./user/user_services");
const PORT = process.env.PORT || 1200;
app.use(express.json());
app.use(UserRouter);


mongoose.connect("mongodb://127.0.0.1:27017/amcdata").then(()=>{
    console.log("mongo has been connected");
}).catch((error)=>{
    console.log("error has been detected in the mongo db");
});


app.listen(PORT,"0.0.0.0",()=>{
console.log(`the server is connected on the PORT number ${PORT}`);
});