// importing npm modules
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const helmet = require("helmet");
const morgan = require("morgan");
const cors = require("cors");

// importing local modules
const userRoutes = require("./api/routes/user");
const authRoutes = require("./api/routes/auth");

const app = express();

require("dotenv").config();

// connecting to mongoDB
mongoose
  .connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log("database connected!");
  })
  .catch((error) => {
    console.log(error);
  });
mongoose.Promise = global.Promise;

// automatic default logging middleware
app.use(morgan("common"));

// body parsing middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// middleware
app.use(express.json());
app.use(helmet());
app.use(cors());

//Routes for handling requests
app.use("/auth", authRoutes);

//error handling middleware
app.use((req, res, next) => {
  const error = new Error("Not Found!");
  error.status = 404;
  next(error);
});

app.use((error, req, res, next) => {
  res.status(error.status || 500).json({
    error: error.message,
  });
});

module.exports = app;
