const http = require("http");
const app = require("./app");

const PORT = process.env.PORT || 8000;
const hostName = "192.168.1.38";

const server = http.createServer(app);

server.listen(PORT, hostName, () => {
  console.log(`server is listening at http://${hostName}:${PORT}`);
});
