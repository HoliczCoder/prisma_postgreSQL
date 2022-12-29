-- AlterTable
ALTER TABLE "User" ADD COLUMN     "roleId" INTEGER;

-- CreateTable
CREATE TABLE "CambioClave" (
    "idCambio" SERIAL NOT NULL,
    "status" INTEGER NOT NULL,

    CONSTRAINT "CambioClave_pkey" PRIMARY KEY ("idCambio")
);

-- CreateTable
CREATE TABLE "Rol" (
    "idRol" SERIAL NOT NULL,
    "rol" TEXT NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("idRol")
);

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Rol"("idRol") ON DELETE SET NULL ON UPDATE CASCADE;
