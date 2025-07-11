import prisma from "../db";

async function findSynergies() {
  return await prisma.synergy.findMany();
}

async function findSynergyById(id: number) {
  return await prisma.synergy.findUnique({
    where: {
      id,
    },
  });
}

export { findSynergies, findSynergyById };
