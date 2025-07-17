import prisma from "../db";

async function findSynergies() {
  return await prisma.synergy.findMany();
}

async function findSynergyById(id: number) {
  return await prisma.synergy.findUnique({
    where: {
      id,
    },
    include: {
      seasons: true,
      heroes: true
    }
  });
}

async function findSynergyBySlug(slug: string) {
  return await prisma.synergy.findFirst({
    where: {
      name: {
        equals: slug,
        mode: "insensitive",
      },
    },
    include: {
      seasons: true,
      heroes: true
    }
  });
}

export { findSynergies, findSynergyById, findSynergyBySlug };
