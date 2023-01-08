/*
  Warnings:

  - You are about to drop the column `problemIdProblem` on the `TournamentUser` table. All the data in the column will be lost.
  - You are about to drop the `CambioClave` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TournamentUser" DROP CONSTRAINT "TournamentUser_problemIdProblem_fkey";

-- AlterTable
ALTER TABLE "TournamentUser" DROP COLUMN "problemIdProblem",
ADD COLUMN     "userId" INTEGER;

-- DropTable
DROP TABLE "CambioClave";

-- CreateTable
CREATE TABLE "UserCode" (
    "idUserCode" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER,

    CONSTRAINT "UserCode_pkey" PRIMARY KEY ("idUserCode")
);

-- CreateTable
CREATE TABLE "ChangeKey" (
    "idChangeKey" SERIAL NOT NULL,
    "userId" INTEGER,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "token" TEXT NOT NULL,
    "condtion" INTEGER NOT NULL,

    CONSTRAINT "ChangeKey_pkey" PRIMARY KEY ("idChangeKey")
);

-- CreateTable
CREATE TABLE "Label" (
    "idLabel" SERIAL NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "Label_pkey" PRIMARY KEY ("idLabel")
);

-- CreateTable
CREATE TABLE "Resolution" (
    "idResolution" SERIAL NOT NULL,
    "userId" INTEGER,
    "problemIdProblem" INTEGER,
    "solutionIdSolution" INTEGER,
    "tournamentIdTournament" INTEGER,
    "token" TEXT NOT NULL,
    "applicationDate" TEXT NOT NULL,
    "responseDate" TEXT,
    "reply" TEXT,
    "stateSolutionIdState" INTEGER,

    CONSTRAINT "Resolution_pkey" PRIMARY KEY ("idResolution")
);

-- CreateTable
CREATE TABLE "Solution" (
    "idSolution" SERIAL NOT NULL,
    "problemIdProblem" INTEGER,
    "inputParameter" TEXT NOT NULL,
    "exit" TEXT NOT NULL,

    CONSTRAINT "Solution_pkey" PRIMARY KEY ("idSolution")
);

-- CreateTable
CREATE TABLE "Hashtag" (
    "idHashtag" SERIAL NOT NULL,

    CONSTRAINT "Hashtag_pkey" PRIMARY KEY ("idHashtag")
);

-- CreateTable
CREATE TABLE "ProblemHashtag" (
    "idProblemHashtab" SERIAL NOT NULL,
    "hashtagIdHashtag" INTEGER,
    "tournamentProblemIdTournamentProblem" INTEGER,

    CONSTRAINT "ProblemHashtag_pkey" PRIMARY KEY ("idProblemHashtab")
);

-- CreateIndex
CREATE UNIQUE INDEX "Resolution_token_key" ON "Resolution"("token");

-- AddForeignKey
ALTER TABLE "UserCode" ADD CONSTRAINT "UserCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChangeKey" ADD CONSTRAINT "ChangeKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TournamentUser" ADD CONSTRAINT "TournamentUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resolution" ADD CONSTRAINT "Resolution_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resolution" ADD CONSTRAINT "Resolution_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resolution" ADD CONSTRAINT "Resolution_solutionIdSolution_fkey" FOREIGN KEY ("solutionIdSolution") REFERENCES "Solution"("idSolution") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resolution" ADD CONSTRAINT "Resolution_tournamentIdTournament_fkey" FOREIGN KEY ("tournamentIdTournament") REFERENCES "Tournament"("idTournament") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resolution" ADD CONSTRAINT "Resolution_stateSolutionIdState_fkey" FOREIGN KEY ("stateSolutionIdState") REFERENCES "StateSolution"("idState") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProblemHashtag" ADD CONSTRAINT "ProblemHashtag_hashtagIdHashtag_fkey" FOREIGN KEY ("hashtagIdHashtag") REFERENCES "Hashtag"("idHashtag") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProblemHashtag" ADD CONSTRAINT "ProblemHashtag_tournamentProblemIdTournamentProblem_fkey" FOREIGN KEY ("tournamentProblemIdTournamentProblem") REFERENCES "TournamentProblem"("idTournamentProblem") ON DELETE SET NULL ON UPDATE CASCADE;
