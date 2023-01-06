import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { compareSync } from "bcrypt";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const createProblem = async (req: Request, res: Response) => {
    try {
        await 
    } catch (e) {
        console.log(e);
    }
}