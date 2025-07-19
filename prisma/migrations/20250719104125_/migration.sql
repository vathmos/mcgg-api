/*
  Warnings:

  - You are about to drop the column `diamondPointPrice` on the `Commander` table. All the data in the column will be lost.
  - Added the required column `diamondPrice` to the `Commander` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Commander` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `CommanderSkill` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Commander" DROP COLUMN "diamondPointPrice",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "diamondPrice" INTEGER NOT NULL,
ADD COLUMN     "iconImageUrl" TEXT,
ADD COLUMN     "portraitImageUrl" TEXT,
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
