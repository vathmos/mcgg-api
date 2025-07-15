import { Request, Response } from "express";
import {
  findHeroes,
  findHeroById,
} from "../services/hero.service";

async function getAllHeroes(req: Request, res: Response) {
  const heroes = await findHeroes();
  res.json(heroes);
}

async function getHeroById(req: Request, res: Response) {
  let { id } = req.params;
  const hero = await findHeroById(Number(id));
  res.json(hero);
}

export { getAllHeroes, getHeroById };
