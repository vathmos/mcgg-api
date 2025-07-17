import prisma from "../db";

async function findHeroes() {
  return await prisma.hero.findMany();
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
async function findHeroBySlug(slug: string) {
  return await prisma.hero.findFirst({
    where: {
      name: {
        equals: slug,
        mode: "insensitive",
      },
    },
    include: {
      synergies: true,
      skill: true,
    },
  });
}

export { findHeroes, findHeroById, findHeroBySlug };
