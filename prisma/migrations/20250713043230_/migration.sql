/*
  Warnings:

  - You are about to drop the column `imageUrl` on the `Hero` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Hero" DROP COLUMN "imageUrl",
ADD COLUMN     "cardImageUrl" TEXT,
ADD COLUMN     "iconImageUrl" TEXT;
