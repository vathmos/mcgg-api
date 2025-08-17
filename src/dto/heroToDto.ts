import { Hero } from "../generated/prisma";

type HeroDto = {
  name: string;
  cost: number;
  portraitImageUrl: string | null,
  iconImageUrl: string | null,
  url: string;
};

export default function heroToDto(hero: Hero): HeroDto {
  return {
    name: hero.name,
    cost: hero.cost,
    portraitImageUrl: hero.portraitImageUrl,
    iconImageUrl: hero.iconImageUrl,
    url: `${process.env.BASE_URL}/heroes/${hero.id}`,
  };
}
