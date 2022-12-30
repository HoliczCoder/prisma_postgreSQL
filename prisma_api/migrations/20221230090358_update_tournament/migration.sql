-- CreateTable
CREATE TABLE "Tournament" (
    "idTournament" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "stateTournamentId" INTEGER NOT NULL,
    "typeTournamentId" INTEGER NOT NULL,

    CONSTRAINT "Tournament_pkey" PRIMARY KEY ("idTournament")
);

-- CreateTable
CREATE TABLE "StateTournament" (
    "idState" SERIAL NOT NULL,
    "State" TEXT NOT NULL,

    CONSTRAINT "StateTournament_pkey" PRIMARY KEY ("idState")
);

-- CreateTable
CREATE TABLE "TypeTournament" (
    "idType" SERIAL NOT NULL,
    "Type" TEXT NOT NULL,

    CONSTRAINT "TypeTournament_pkey" PRIMARY KEY ("idType")
);

-- AddForeignKey
ALTER TABLE "Tournament" ADD CONSTRAINT "Tournament_stateTournamentId_fkey" FOREIGN KEY ("stateTournamentId") REFERENCES "StateTournament"("idState") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tournament" ADD CONSTRAINT "Tournament_typeTournamentId_fkey" FOREIGN KEY ("typeTournamentId") REFERENCES "TypeTournament"("idType") ON DELETE RESTRICT ON UPDATE CASCADE;
