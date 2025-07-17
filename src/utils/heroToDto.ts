import { Hero } from "../generated/prisma";

type HeroDto = {
  name: string;
  cost: number;
  url: string;
};

export default function heroToDto(hero: Hero): HeroDto {
  return {
    name: hero.name,
    cost: hero.cost,
    url: `${process.env.BASE_URL}/heroes/${hero.id}`,
  };
}
