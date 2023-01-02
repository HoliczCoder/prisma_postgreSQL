-- CreateTable
CREATE TABLE "TournamentUser" (
    "idTournamentUser" SERIAL NOT NULL,
    "tournamentIdTournament" INTEGER NOT NULL,
    "problemIdProblem" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,

    CONSTRAINT "TournamentUser_pkey" PRIMARY KEY ("idTournamentUser")
);

-- AddForeignKey
ALTER TABLE "TournamentUser" ADD CONSTRAINT "TournamentUser_tournamentIdTournament_fkey" FOREIGN KEY ("tournamentIdTournament") REFERENCES "Tournament"("idTournament") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TournamentUser" ADD CONSTRAINT "TournamentUser_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE RESTRICT ON UPDATE CASCADE;
