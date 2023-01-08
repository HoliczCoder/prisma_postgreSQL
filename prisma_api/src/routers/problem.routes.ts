import { Router } from "express";
import { createProblem, getProblem } from "../controllers/problem.controller";
const router = Router();

router.get("/", getProblem);
router.post("/", createProblem);

export default router;
