DROP TABLE IF EXISTS "CommanderSkill";

CREATE TABLE "CommanderSkill" (
    "id" SERIAL NOT NULL,
    "commanderId" INTEGER NOT NULL,
    "type" "commanderSkillType" NOT NULL,
    "level" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommanderSkill_pkey" PRIMARY KEY ("id")
);
