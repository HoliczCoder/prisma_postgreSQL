import { Prisma, PrismaClient } from "@prisma/client"
const prisma = new PrismaClient()
import e, { Request, Response } from "express"
export const createUser = async (req: Request, res: Response) => {
    try {
        console.log(req.body);
        const createUser = await prisma.user.create({ data: req.body })
        res.status(200).json(createUser)
    } catch (error) {
        res.status(500).json({ error });
    }
}

export const emailResigter = async(req: Request, res: Response ) => {
    let email = req.body.email;
    const result = await prisma.user.findFirst({where: {email: email}})
    if (!result) {
		res.json({ isInUse: false })
	} else {
		res.json({ isInUse: true })
	}
}