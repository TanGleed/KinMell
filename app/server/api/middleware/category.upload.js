const multer = require("multer");
const path = require("path");
//const paths = require("../upload/categories");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "api/uploads/categories");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const fileFilter = (req, file, callback) => {
  const acceptableExt = [".png", ".jpg", ".jpeg"];
  if (!acceptableExt.includes(path.extname(file.originalname))) {
    return callback(new Error("Only .png, .jpg and .jpeg format allowed!"));
  }

  const fileSize = parseInt(req.headers["content-length"]);

  if (fileSize > 1048576) {
    return callback(new Error("File Size Big"));
  }

  callback(null, true);
};

let upload = multer({
  storage,
  fileFilter,
  fileSize: 1048576,
});

module.exports = upload.single("categoryImage");
