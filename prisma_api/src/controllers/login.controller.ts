import { Request, Response } from "express";
import * as jwt from "jsonwebtoken";
import { compareSync } from "bcrypt";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
// import { prisma } from "@prisma/client";

export const login = async (req: Request, res: Response) => {
  try {
    // let { user, password } = req.body;
    let email = req.body.email;
    let password = req.body.password
    
    const result = await prisma.user.findFirst({ where: { email: email } });
    if (!result) {
      res.status(500).send({ error: "Email not exist" });
      return;
    } else {
      // res.json({ result: result });
      if (!compareSync(password, result.password)) {
        res.status(403).json({ msg: "incorrect password" });
      } else {
        let setDate = new Date();
        setDate.setHours(setDate.getHours() + 4);
        // const usuario: object = {
        //   idUsuario: usuarioConectado.idUsuario,
        //   institucion: usuarioConectado.institucion,
        //   nombreUsuario: usuarioConectado.nombreUsuario,
        //   descripcion: usuarioConectado.descripcion,
        //   email: usuarioConectado.email,
        //   rol: usuarioConectado.rol,
        // };
        const user: object = {
          userName: result.name
        }
        const crendential = {
          expireDate: `setDate`,
          user: {
            userName: result.name
          },
          token: jwt.sign({ user }, "testing", {
            expiresIn: process.env.EXPIRACION_TOKEN,
          }),
        };
        res.json(crendential);
      }
    }
  } catch (e) {
    console.log(e);
    res.status(500).send(e);
  }
};
