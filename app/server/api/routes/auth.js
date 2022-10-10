const express = require("express");
const router = express.Router();

// const UserController = require("../controllers/auth");

// router.post("/register", UserController.register);
// router.post("/login", UserController.login);

const UserController = require("../controllers/auth");
const checkAuth = require("../middleware/auth");

router.post("/signup", UserController.user_signup);

router.post("/login", UserController.user_login);

router.delete("/:userId", checkAuth, UserController.user_delete);

module.exports = router;
