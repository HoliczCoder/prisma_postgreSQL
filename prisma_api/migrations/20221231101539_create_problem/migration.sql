-- CreateTable
CREATE TABLE "Problem" (
    "idProblem" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "archive" TEXT NOT NULL,
    "statement" TEXT NOT NULL,
    "complexityId" INTEGER NOT NULL,
    "maxExecutionTime" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Problem_pkey" PRIMARY KEY ("idProblem")
);

-- CreateTable
CREATE TABLE "Complexity" (
    "idComplexity" SERIAL NOT NULL,
    "complexity" TEXT NOT NULL,

    CONSTRAINT "Complexity_pkey" PRIMARY KEY ("idComplexity")
);

-- AddForeignKey
ALTER TABLE "Problem" ADD CONSTRAINT "Problem_complexityId_fkey" FOREIGN KEY ("complexityId") REFERENCES "Complexity"("idComplexity") ON DELETE RESTRICT ON UPDATE CASCADE;
