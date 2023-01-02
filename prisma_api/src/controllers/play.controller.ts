import { Response, Request } from "express";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();


export const application = async (req: Request, res: Response) => {
    try {
        const currentDate = new Date().getTime();
        const token = req.query.token;
        let problemOrder: number;
        problemOrder = Number(req.query.problem);
        if (!problemOrder) {
            throw {
                error: "The problem data type has to be Natural",
                status: 400,
            };
        }




    } catch (error) {

    }

}


