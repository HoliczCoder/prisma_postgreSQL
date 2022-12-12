import { Router } from "express";
import userRouter from "./users.routes";
import { Request, Response } from "express";
const routes = Router();
// routes.use("/", (req: Request, res: Response) => {
//   res.send("hell world");
// });
routes.use("/user", userRouter);
export default routes;
