const express = require("express");
const router = express.Router();

const userController = require("../controllers/auth.controller");
const checkAuth = require("../middleware/auth.middleware");

router.post("/signup", userController.signup);
router.post("/login", userController.login);
//router.delete("/:userId", checkAuth, UserController.user_delete);

module.exports = router;
