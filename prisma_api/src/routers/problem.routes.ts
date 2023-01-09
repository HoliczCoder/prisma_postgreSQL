import { editProblem } from "./../controllers/problem.controller";
import { Router } from "express";
import { createProblem, getProblem } from "../controllers/problem.controller";
const router = Router();

router.get("/", getProblem);
router.post("/", createProblem);
router.put("/", editProblem);

export default router;
