import { Request, Response } from "express";
import { Prisma, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();


export const createTournament = async (req: Request, res: Response) => {
    try {
        let user =
        // const result = await prisma.tournament.create()

    } catch (error) {

    }

}

// export const createTorneo = async (req: Request, res: Response) => {
// 	try {
// 		let usuario: Usuario = req["usuario"];            // cho nay la lay thong tin user
// 		const torneoRepository = getRepository(Torneo);    // lay repository cua tournament

// 		const nuevoTorneo = torneoRepository.create({ ...req.body } as object);
// 		console.log(nuevoTorneo);

// 		nuevoTorneo.creador = usuario;
// 		const result = await torneoRepository.save(nuevoTorneo);    // save no lai
// 		for (let i = 0; i < nuevoTorneo.torneosProblemas.length; i++) {
// 			let torneoNuevo = new Torneo();
// 			torneoNuevo.idTorneo = result.idTorneo;
// 			nuevoTorneo.torneosProblemas[i].torneo = torneoNuevo;
// 			await getRepository(TorneoProblema).save(nuevoTorneo.torneosProblemas[i]);
// 		}
// 		res.json(result);
// 	} catch (error) {
// 		console.log(error);
// 		res.status(500).json({ error });
// 	} finally {
// 		cambiarEstadoTorneo()
// 			.then(() => { })
// 			.catch((error) => console.log(error));
// 	}
// };