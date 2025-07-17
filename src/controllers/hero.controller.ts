import { Request, Response } from "express";
import {
  findHeroes,
  findHeroById,
  findHeroBySlug,
} from "../services/hero.service";
import heroToDto from "../utils/heroToDto";
import synergyToDto from "../utils/synergyToDto";

async function getAllHeroes(req: Request, res: Response) {
  const rawHeroes = await findHeroes();
  const heroes = rawHeroes.map((hero) => {
    return heroToDto(hero);
  });
  res.json(heroes);
}

async function getHeroByParam(req: Request, res: Response) {
  let { param } = req.params;
  let hero;
  if (/^\d+$/.test(param)) {
    hero = await findHeroById(Number(param));
  } else {
    hero = await findHeroBySlug(param.replace(/-/g, " "));
  }

  if (!hero) {
    return res.status(404).json({ message: "Hero not found" });
  }

  const { synergies: rawSynergies, ...rest } = hero;
  const synergies = rawSynergies.map(synergy => synergyToDto(synergy));
  res.json({
    ...rest,
    synergies
  });
}

export { getAllHeroes, getHeroByParam };
