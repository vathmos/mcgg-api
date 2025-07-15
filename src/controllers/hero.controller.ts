import { Request, Response } from "express";
import { findHeroes, findHeroById } from "../services/hero.service";
import { BASE_URL } from "../utils/urlBuilder";
import { Hero } from "../generated/prisma";

type HeroDto = {
  name: string;
  cost: number;
  url: string;
};

async function getAllHeroes(req: Request, res: Response) {
  const rawHeroes = await findHeroes();
  function heroToDto(hero: Hero): HeroDto {
    return {
      name: hero.name,
      cost: hero.cost,
      url: `${BASE_URL}/heroes/${hero.id}`,
    };
  }
  const heroes = rawHeroes.map((hero) => {
    return heroToDto(hero);
  });
  res.json(heroes);
}

async function getHeroById(req: Request, res: Response) {
  let { id } = req.params;
  const hero = await findHeroById(Number(id));
  res.json(hero);
}

export { getAllHeroes, getHeroById };
