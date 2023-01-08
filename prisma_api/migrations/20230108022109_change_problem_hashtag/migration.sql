/*
  Warnings:

  - Made the column `hashtagIdHashtag` on table `ProblemHashtag` required. This step will fail if there are existing NULL values in that column.
  - Made the column `problemIdProblem` on table `ProblemHashtag` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "ProblemHashtag" DROP CONSTRAINT "ProblemHashtag_hashtagIdHashtag_fkey";

-- DropForeignKey
ALTER TABLE "ProblemHashtag" DROP CONSTRAINT "ProblemHashtag_problemIdProblem_fkey";

-- AlterTable
ALTER TABLE "ProblemHashtag" ALTER COLUMN "hashtagIdHashtag" SET NOT NULL,
ALTER COLUMN "problemIdProblem" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "ProblemHashtag" ADD CONSTRAINT "ProblemHashtag_hashtagIdHashtag_fkey" FOREIGN KEY ("hashtagIdHashtag") REFERENCES "Hashtag"("idHashtag") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProblemHashtag" ADD CONSTRAINT "ProblemHashtag_problemIdProblem_fkey" FOREIGN KEY ("problemIdProblem") REFERENCES "Problem"("idProblem") ON DELETE RESTRICT ON UPDATE CASCADE;
