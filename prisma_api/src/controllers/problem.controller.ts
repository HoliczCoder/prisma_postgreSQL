import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { compareSync } from "bcrypt";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const createProblem = async (req: Request, res: Response) => {
    try {
        const createProblem = await prisma.problem.create({
            data: {
                name: req.body.name,
                statement: req.body.statement,
                complexityId: req.body.complexityId,
                maxExecutionTime: req.body.maxExecutionTime,
                problemHashtab: {
                    create: [
                        {
                            hashtag: {
                                create: {
                                    hashtag: req.body.hashtag,
                                },
                            },
                        },
                    ],
                },
                solution: {
                    create: [
                        {
                            inputParameter: req.body.inputParameter,
                            exit: req.body.exit,
                        }
                    ]
                }
            },
        })
    } catch (e) {
        console.log(e);
    }
}