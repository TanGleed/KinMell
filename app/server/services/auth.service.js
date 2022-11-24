const { user } = require("../models/user.model");
const bcrypt = require("bcryptjs");
const auth = require("../middleware/auth.middleware");
const otpGenerator=require("otp-generator");
const crypto=require("crypto");
const key="otp-secret-key";
const nodemailer= require("nodemailer");
async function login({ email, password }, callback)
{
  const userModel = await user.findOne({ email });

  if (userModel != null) {
    if (bcrypt.compareSync(password, userModel.password)) {
      const token = auth.generateAccessToken(userModel.toJSON());
      return callback(null, { ...userModel.toJSON(), token });
    } else {
      return callback({
        message: "Invalid Email/Password",
      });
    }
  } else {
    return callback({
      message: "Invalid Email/Password",
    });
  }
}

async function singup(params, callback) {
  if (params.email === undefined) {
    return callback({
      message: "Email Required!",
    });
  }

  let isUserExist = await user.findOne({ email: params.email });

  if (isUserExist) {
    return callback({
      message: "Email already registered!",
    });
  }

  const salt = bcrypt.genSaltSync(10);
  params.password = bcrypt.hashSync(params.password, salt);

  const userSchema = new user(params);
  userSchema
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}
async function createOtp(params,callback)
{
  
  const otp=otpGenerator.generate(
    4,
    {
      lowerCaseAlphabets: false,
      upperCaseAlphabets :false,
      specialChars: false
    }
  );
  //const ttl= 5*60*1000;
  //const expires =Date.now()+ ttl;
  const data =params.email+otp;
  const hash=crypto.createHmac("sha256",key).update(data).digest("hex");
  const mailOptions=
  {
    from:"sudipbhattarai806@gmail.com",
    to:params.email,
    subject:"Verify Your Email",
    html:'<p>Enter <b>'+otp+'</b> to complete verifying your email and proceed futher.</p>',
  }
  let transporter=nodemailer.createTransport({
    service:'gmail',
  
    auth:
    {
      user: "sudipbhattarai1792@gmail.com",
      pass: "zajwdrqaczoptebd",
    }
  });
  

  transporter.sendMail(mailOptions,function(error,info)
  {
    if(error)
    {
      console.log(error);
    }
    else
    {
      console.log("Email Sent Info");
    }
  });
  
  return callback(null,hash);
}

async function verifyOtp(params,callback)
{
  
  let data=params.email+params.otp;
  let newCalculateHash=crypto.createHmac("sha256",key).update(data).digest("hex");
  if(newCalculateHash==params.hash)
  {
    return callback(null, "OTP VERIFIED" );
  }
  else
  {
    return callback(null,"Invalid OTP");
  }
}
module.exports = {
  login,
  singup,
  createOtp,
  verifyOtp,
};
