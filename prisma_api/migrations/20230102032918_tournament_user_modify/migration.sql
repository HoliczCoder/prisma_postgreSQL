/*
  Warnings:

  - You are about to drop the column `order` on the `TournamentUser` table. All the data in the column will be lost.
  - Added the required column `token` to the `TournamentUser` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TournamentUser" DROP COLUMN "order",
ADD COLUMN     "point" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "time" BIGINT NOT NULL DEFAULT 0,
ADD COLUMN     "token" TEXT NOT NULL;
