import { Request, Response } from "express";
import {
  findCommanders,
  findCommanderById,
  findCommanderBySlug,
} from "../services/commander.service";
import commanderToDto from "../utils/CommanderToDto";

async function getAllCommanders(req: Request, res: Response) {
  const rawCommanders = await findCommanders();
  const commanders = rawCommanders.map((commander) => {
    return commanderToDto(commander);
  });
  res.json(commanders);
}

async function getCommanderByParam(req: Request, res: Response) {
  let { param } = req.params;
  let commander;
  if (/^\d+$/.test(param)) {
    commander = await findCommanderById(Number(param));
  } else {
    commander = await findCommanderBySlug(param.replace(/-/g, " "));
  }

  if (!commander) {
    return res.status(404).json({ message: "Commander not found" });
  }

   res.json(commander);

}

export { getAllCommanders, getCommanderByParam };
