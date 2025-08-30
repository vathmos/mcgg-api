import { Request, Response } from "express";
import {
  findItems,
  findItemById,
  findItemBySlug,
} from "../services/item.service";
import itemToDto from "../dto/ItemToDto";

async function getAllItems(req: Request, res: Response) {
  const rawItems = await findItems();
  const items = rawItems.map(item => itemToDto(item));
  res.json(items);
}

async function getItemByParam(req: Request, res: Response) {
  const { param } = req.params;
  let item;
  if (/^\d+$/.test(param)) {
    item = await findItemById(Number(param));
  } else {
    item = await findItemBySlug(param.replace(/-/g, " "));
  }

  if (!item) {
    return res.status(404).json({ message: "Item not found" });
  }

  res.json(item);
}

export { getAllItems, getItemByParam };
