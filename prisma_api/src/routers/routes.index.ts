import { Router } from "express";
import userRouter from "./users.routes";
import loginRouter from "./login.routes"
import problemRouter from "./problem.routes"
import mainRouter from "./main.routes"
import { Request, Response } from "express";
const routes = Router();
// routes.use("/", (req: Request, res: Response) => {
//     res.send("hell world");
// });
routes.use("/problem", problemRouter)
routes.use("/user", userRouter);
routes.use("/login", loginRouter)
routes.use("/", mainRouter)

export default routes;
