// importing npm modules
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cors = require("cors");
const unless = require("express-unless");

// importing local modules
//const userRoutes = require("./api/routes/user");
const authRoutes = require("./api/routes/auth");
const auth = require("./api/middleware/auth");

const app = express();
const PORT = process.env.PORT || 4000;
const host = "192.168.1.65";

require("dotenv").config();

// connecting to mongoDB
mongoose.Promise = global.Promise;
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

// automatic default logging middleware
app.use(morgan("common"));

// body parsing middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// middleware
app.use(express.json());
app.use(cors());
//auth.authenticateToken.unless = unless;

// app.use(
//   auth.authenticateToken.unless({
//     path: [
//       { url: "/auth/login", methods: ["POST"] },
//       { url: "/auth/signup", methods: ["POST"] },
//     ],
//   })
// );

//Routes for handling requests
app.use("/api/auth", authRoutes);

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

app.listen(PORT, host, () => {
  console.log(`server is running at http://${host}:${PORT}`);
});

module.exports = app;
