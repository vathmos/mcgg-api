/*
  Warnings:

  - A unique constraint covering the columns `[commanderId]` on the table `CommanderSkill` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "ItemType" AS ENUM ('PHYSICAL', 'MAGIC', 'DEFENSE', 'MAGIC_CRYSTAL', 'SPECIAL_EQUIPMENT');

-- CreateTable
CREATE TABLE "Item" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" "ItemType" NOT NULL,
    "summary" TEXT NOT NULL,
    "modifiers" TEXT[],
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Item_name_key" ON "Item"("name");

-- CreateIndex
CREATE INDEX "CommanderSkill_commanderId_key" ON "CommanderSkill"("commanderId");

-- AddForeignKey
ALTER TABLE "CommanderSkill" ADD CONSTRAINT "CommanderSkill_commanderId_fkey" FOREIGN KEY ("commanderId") REFERENCES "Commander"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
