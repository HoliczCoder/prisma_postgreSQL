import { Router } from "express";
// import { login } from "../controllers/login.controller";
const router = Router();

router.get("/", (req, res) => {
    console.log("hello world");

    res.json({
        helloWorld: "helloWorld"
    })
});

export default router;
