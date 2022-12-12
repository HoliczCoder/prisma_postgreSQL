import { Router } from "express";
import { createUser, emailResigter } from "../controllers/user.controllers";

const router = Router();
router.post("/email-resgister", emailResigter)
router.post("/", createUser)


export default router;