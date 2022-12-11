import { Prisma, PrismaClient } from "@prisma/client"
const prisma = new PrismaClient()
import e, { Request, Response } from "express"
export const createUser = async (req: Request, res: Response) => {
    try {
        const createUser = await prisma.user.create({ data: req.body })
        res.status(200).json(createUser)
    } catch (error) {
        res.status(500).json({ error });
    }
}