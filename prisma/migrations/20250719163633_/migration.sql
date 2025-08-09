/*
  Warnings:

  - You are about to drop the column `starLevel` on the `HeroAttribute` table. All the data in the column will be lost.
  - Added the required column `level` to the `HeroAttribute` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum

DROP TABLE "CommanderSkin";
DROP TABLE "CommanderSkill";
DROP TABLE "Commander";
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

/*
  Warnings:

  - You are about to drop the column `diamondPointPrice` on the `Commander` table. All the data in the column will be lost.
  - Added the required column `diamondPrice` to the `Commander` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Commander` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `CommanderSkill` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Commander" DROP COLUMN "diamondPointPrice",
ADD COLUMN     "diamondPrice" INTEGER NOT NULL,
ADD COLUMN     "iconImageUrl" TEXT,
ADD COLUMN     "portraitImageUrl" TEXT,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "CommanderSkill" ADD COLUMN     "type" "commanderSkillType" NOT NULL;

-- CreateTable
CREATE TABLE "CommanderSkin" (
    "id" SERIAL NOT NULL,
    "commanderId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommanderSkin_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CommanderSkin_commanderId_key" ON "CommanderSkin"("commanderId");

-- AddForeignKey
ALTER TABLE "CommanderSkin" ADD CONSTRAINT "CommanderSkin_commanderId_fkey" FOREIGN KEY ("commanderId") REFERENCES "Commander"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
