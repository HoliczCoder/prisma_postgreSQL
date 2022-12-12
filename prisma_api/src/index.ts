import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
import "reflect-metadata";
let cors = require("cors");
import bodyParser = require("body-parser");
import routes from "./routers/routes.index";
import Server from "./server/Server";
// import { ejecutarCron } from './functions/cronJobs'
// import { mainHandler } from "./socketController/mainHandler";
import "source-map-support/register";
// import { refreshToken } from "./middleware/auth";
async function main() {
  require("dotenv").config();
  const server = Server.init(Number(process.env.PORT));
  server.app.use(cors());
  //   server.app.use("/api", (req: any, res: any)=> {
  //     res.send("hell world")
  //   } );
  server.app.use(bodyParser.json())
  server.app.use("/api", routes);
  server.start(() => {
    console.log(
      `servidor corriendo en el puerto http://localhost:${process.env.PORT}/api`
    );
  });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
