/*
  Warnings:

  - You are about to drop the column `cardImageUrl` on the `Hero` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Hero" DROP COLUMN "cardImageUrl",
ADD COLUMN     "portraitImageUrl" TEXT;
