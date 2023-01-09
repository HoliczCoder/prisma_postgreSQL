import { log } from "console";
import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { compareSync } from "bcrypt";
import { Prisma, PrismaClient } from "@prisma/client";
import { json } from "body-parser";
const prisma = new PrismaClient();

export const createProblem = async (req: Request, res: Response) => {
  try {
    if (req?.body?.inputParameter) {
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
              },
            ],
          },
        },
      });
      res.json(createProblem);
    } else {
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
        },
      });
      res.json(createProblem);
    }
  } catch (e) {
    console.log(e);
    res.status(500).json({ e, msg: "Error" });
  }
};

export const getProblem = async (req: Request, res: Response) => {
  res.json({
    hello: "this is response",
  });
};

export const editProblem = async (req: Request, res: Response) => {
  try {
    const updateProblem = await prisma.problem.update({
      where: {
        idProblem: req.body.id,
      },
      data: {
        name: req.body.name,
        statement: req.body.statement,
        complexityId: req.body.complexityId,
        maxExecutionTime: req.body.maxExecutionTime,
        ...(req?.body?.hashtag && {
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
        }),
        ...(req?.body?.inputParameter && {
          solution: {
            create: [
              {
                inputParameter: req.body.inputParameter,
                exit: req.body.exit,
              },
            ],
          },
        }),
      },
    });
    res.json(updateProblem);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error });
  }
};
