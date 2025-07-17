import { Synergy } from "../generated/prisma";

type synergyDto = {
  name: string;
  url: string;
};

export default function synergyToDto(synergy: Synergy): synergyDto {
  return {
    name: synergy.name,
    url: `${process.env.BASE_URL}/synergies/${synergy.id}`,
  };
}
