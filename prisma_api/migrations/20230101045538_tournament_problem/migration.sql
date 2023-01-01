-- CreateTable
CREATE TABLE "TournamentProblem" (
    "idTournamentProblem" SERIAL NOT NULL,
    "tournamentIdTournament" INTEGER NOT NULL,
    "problemIdProblem" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,

    CONSTRAINT "TournamentProblem_pkey" PRIMARY KEY ("idTournamentProblem")
);

-- AddForeignKey
ALTER TABLE "TournamentProblem" ADD CONSTRAINT "TournamentProblem_tournamentIdTournament_fkey" FOREIGN KEY ("tournamentIdTournament") REFERENCES "Tournament"("idTournament") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TournamentProblem" ADD CONSTRAINT "TournamentProblem_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE RESTRICT ON UPDATE CASCADE;
