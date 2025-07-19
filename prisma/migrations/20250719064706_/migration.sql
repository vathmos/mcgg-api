/*
  Warnings:

  - You are about to drop the column `starLevel` on the `HeroAttribute` table. All the data in the column will be lost.
  - Added the required column `level` to the `HeroAttribute` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "CommanderType" AS ENUM ('COMBAT', 'SURVIVAL', 'RESOURCE', 'STRATEGY');

-- CreateEnum
CREATE TYPE "commanderSkillType" AS ENUM ('ACTIVE', 'PASSIVE');

-- AlterTable
ALTER TABLE "HeroAttribute" DROP COLUMN "starLevel",
ADD COLUMN     "level" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Commander" (
    "id" SERIAL NOT NULL,
    "commanderNumber" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "type" "CommanderType" NOT NULL,
    "chessPointPrice" INTEGER NOT NULL,
    "diamondPointPrice" INTEGER NOT NULL,

    CONSTRAINT "Commander_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommanderSkill" (
    "id" SERIAL NOT NULL,
    "commanderId" INTEGER NOT NULL,
    "level" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommanderSkill_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CommanderSkill_commanderId_key" ON "CommanderSkill"("commanderId");

-- AddForeignKey
ALTER TABLE "CommanderSkill" ADD CONSTRAINT "CommanderSkill_commanderId_fkey" FOREIGN KEY ("commanderId") REFERENCES "Commander"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
