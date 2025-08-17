import { Synergy } from "../generated/prisma";

type synergyDto = {
  name: string;
  imageUrl: string | null;
  url: string;
};

export default function synergyToDto(synergy: Synergy): synergyDto {
  return {
    name: synergy.name,
    imageUrl: synergy.imageUrl,
    url: `${process.env.BASE_URL}/synergies/${synergy.id}`,
  };
}
