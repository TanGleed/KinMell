const authServices = require("../services/auth.service");

exports.signup = (req, res, next) => {
  authServices.singup(req.body, (error, results) => {
    if (error) return next(error);
    else {
      return res.status(200).send({
        message: "Success",
        data: results,
      });
    }
  });
};

exports.login = (req, res, next) => {
  const { email, password } = req.body;

  authServices.login({ email, password }, (error, results) => {
    if (error) return next(error);
    return res.status(200).send({
      message: "Success",
      data: results,
    });
  });
};

// exports.user_delete = async (req, res, next) => {
//   await User.remove({ _id: req.params.userId })
//     .exec()
//     .then((result) => {
//       res.status(200).json({
//         message: "Your account is deleted!",
//       });
//     })
//     .catch((err) => {
//       console.log(err);
//       res.status(500).json({
//         error: err,
//       });
//     });
// };
