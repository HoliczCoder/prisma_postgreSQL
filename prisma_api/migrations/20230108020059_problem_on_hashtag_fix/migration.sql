/*
  Warnings:

  - You are about to drop the column `tournamentProblemIdTournamentProblem` on the `ProblemHashtag` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ProblemHashtag" DROP CONSTRAINT "ProblemHashtag_tournamentProblemIdTournamentProblem_fkey";

-- AlterTable
ALTER TABLE "ProblemHashtag" DROP COLUMN "tournamentProblemIdTournamentProblem",
ADD COLUMN     "problemIdProblem" INTEGER;

-- AddForeignKey
ALTER TABLE "ProblemHashtag" ADD CONSTRAINT "ProblemHashtag_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE SET NULL ON UPDATE CASCADE;
