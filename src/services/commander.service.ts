import prisma from "../db";

async function findCommanders() {
  return await prisma.commander.findMany();
}

async function findCommanderById(id: number) {
  return await prisma.commander.findUnique({
    where: {
      id
    },
    include: {
      skills: {
        select: {
          id: true,
          name: true,
          type: true,
          level: true,
          description: true,
          imageUrl: true,
          createdAt: true,
          updatedAt: true,
        }
      },
    }
  });
}
async function findCommanderBySlug(slug: string) {
  return await prisma.commander.findFirst({
    where: {
      name: {
        equals: slug,
        mode: "insensitive",
      },
    },
    include: {
      skills: {
        select: {
          id: true,
          name: true,
          type: true,
          level: true,
          description: true,
          imageUrl: true,
        }
      },
    }
  });
}

export {findCommanders, findCommanderById, findCommanderBySlug}