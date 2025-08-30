import prisma from "../db";

async function findItems() {
  return await prisma.item.findMany();
}

async function findItemById(id: number) {
  return await prisma.item.findUnique({
    where: {
      id
    }
  })
}

async function findItemBySlug(slug: string) {
  return await prisma.item.findFirst({
    where: {
      name: slug
    }
  })
}

export { findItems, findItemById, findItemBySlug }