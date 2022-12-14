import { Prisma, PrismaClient } from "@prisma/client";
import { hashSync, genSaltSync } from "bcrypt";
const prisma = new PrismaClient();
import e, { Request, Response } from "express";
export const createUser = async (req: Request, res: Response) => {
  try {
    console.log(req.body);
    if (req.body.password) {
      const salt = genSaltSync(Number(process.env.SALT_HASH));
      const hash_password: string = hashSync(req.body.password, salt);
      const reps = await prisma.user.create({
        data: {
          email: req.body.email,
          name: req.body.name,
          password: hash_password,
        },
      });
      res.status(200).json(reps);
    }
    res.status(200).send("cannot encrypt password");

  } catch (error) {
    res.status(500).json({ error });
  }
};

export const emailResigter = async (req: Request, res: Response) => {
  let email = req.body.email;
  const result = await prisma.user.findFirst({ where: { email: email } });
  if (!result) {
    res.json({ isInUse: false });
  } else {
    res.json({ isInUse: true });
  }
};
