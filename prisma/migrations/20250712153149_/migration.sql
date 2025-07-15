-- CreateEnum
CREATE TYPE "TraitType" AS ENUM ('FACTION', 'ROLE');

-- CreateTable
CREATE TABLE "HeroAttribute" (
    "id" SERIAL NOT NULL,
    "heroId" INTEGER NOT NULL,
    "starLevel" INTEGER NOT NULL,
    "healthPoints" INTEGER NOT NULL,
    "physicalAttack" INTEGER NOT NULL,
    "magicAttack" INTEGER NOT NULL,
    "attackSpeed" DOUBLE PRECISION NOT NULL,
    "attackRange" INTEGER NOT NULL,
    "initialManaCap" INTEGER NOT NULL,
    "manaCap" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HeroAttribute_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SkillScaling" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "values" DOUBLE PRECISION NOT NULL,
    "skillId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SkillScaling_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Season" (
    "id" SERIAL NOT NULL,
    "version" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Season_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Synergy" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "trait" "TraitType" NOT NULL,
    "imageUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Synergy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hero" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "cost" INTEGER NOT NULL,
    "imageUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Hero_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HeroSkill" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HeroSkill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SeasonSynergies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_SeasonSynergies_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_HeroSynergies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_HeroSynergies_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_HeroSeasons" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_HeroSeasons_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "Synergy_name_key" ON "Synergy"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Hero_skillId_key" ON "Hero"("skillId");

-- CreateIndex
CREATE UNIQUE INDEX "Hero_name_key" ON "Hero"("name");

-- CreateIndex
CREATE INDEX "_SeasonSynergies_B_index" ON "_SeasonSynergies"("B");

-- CreateIndex
CREATE INDEX "_HeroSynergies_B_index" ON "_HeroSynergies"("B");

-- CreateIndex
CREATE INDEX "_HeroSeasons_B_index" ON "_HeroSeasons"("B");

-- AddForeignKey
ALTER TABLE "HeroAttribute" ADD CONSTRAINT "HeroAttribute_heroId_fkey" FOREIGN KEY ("heroId") REFERENCES "Hero"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SkillScaling" ADD CONSTRAINT "SkillScaling_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "HeroSkill"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hero" ADD CONSTRAINT "Hero_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "HeroSkill"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeasonSynergies" ADD CONSTRAINT "_SeasonSynergies_A_fkey" FOREIGN KEY ("A") REFERENCES "Season"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeasonSynergies" ADD CONSTRAINT "_SeasonSynergies_B_fkey" FOREIGN KEY ("B") REFERENCES "Synergy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HeroSynergies" ADD CONSTRAINT "_HeroSynergies_A_fkey" FOREIGN KEY ("A") REFERENCES "Hero"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HeroSynergies" ADD CONSTRAINT "_HeroSynergies_B_fkey" FOREIGN KEY ("B") REFERENCES "Synergy"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HeroSeasons" ADD CONSTRAINT "_HeroSeasons_A_fkey" FOREIGN KEY ("A") REFERENCES "Hero"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HeroSeasons" ADD CONSTRAINT "_HeroSeasons_B_fkey" FOREIGN KEY ("B") REFERENCES "Season"("id") ON DELETE CASCADE ON UPDATE CASCADE;
