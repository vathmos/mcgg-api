import { Request, Response } from "express";
import { findSynergies, findSynergyById } from "../services/synergy.service";

async function getAllSynergies(req: Request, res: Response) {
  const synergies = await findSynergies();
  res.json(synergies);
}

async function getSynergyById(req: Request, res: Response) {
  const { id } = req.params;
  const synergy = await findSynergyById(Number(id));
  res.json(synergy);
}

export { getAllSynergies, getSynergyById };
