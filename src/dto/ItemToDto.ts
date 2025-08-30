import { Item } from "../generated/prisma";

type ItemDto = {
  name: string;
  imageUrl: string | null;
  url: string;
};

export default function itemToDto(item: Item): ItemDto {
  return {
    name: item.name,
    imageUrl: item.imageUrl,
    url: `${process.env.BASE_URL}/items/${item.id}`,
  }
}
