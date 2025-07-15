import prisma from "../db";

async function findHeroes() {
  return await prisma.hero.findMany({
    include: {
      synergies: true,
      skill: true,
    },
  });
}

async function findHeroById(id: number) {
  return await prisma.hero.findUnique({
    where: {
      id,
    },
    include: {
      synergies: true,
      skill: true,
    },
  });
}

export { findHeroes, findHeroById };
