import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { compareSync } from "bcrypt";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
// import { prisma } from "@prisma/client";

export const login = async (req: Request, res: Response) => {
  try {
    let { user, password } = req.body;
    let email = req.body.email;
    const result = await prisma.user.findFirst({ where: { email: email } });
    if (!result) {
      res.status(500).send({ error: "Email  no encontrado" });
      return;
    } else {
      res.json({ isInUse: true });
    }
  } catch (e) {
    console.log(e);
    res.status(500).send(e);
  }
};
