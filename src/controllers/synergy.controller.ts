import { Request, Response } from "express";
import {
  findSynergies,
  findSynergyById,
  findSynergyBySlug,
} from "../services/synergy.service";
import heroToDto from "../utils/heroToDto";
import synergyToDto from "../utils/synergyToDto";


async function getAllSynergies(req: Request, res: Response) {
  const rawSynergies = await findSynergies();

  const synergies = rawSynergies.map((synergy) => synergyToDto(synergy));
  res.json(synergies);
}

async function getSynergyByParam(req: Request, res: Response) {
  let { param } = req.params;
  let synergy;

  if (/^\d+$/.test(param)) {
    synergy = await findSynergyById(Number(param));
  } else {
    synergy = await findSynergyBySlug(param.replace(/-/g, " "));
  }

  if (!synergy) {
    return res.status(404).json({ message: "Synergy not found" });
  }

  const { heroes: rawHeroes, ...rest } = synergy;

  const heroes = rawHeroes.map((hero) => heroToDto(hero));

  res.json({
    ...rest,
    heroes,
  });
}

export { getAllSynergies, getSynergyByParam };
