import { Router } from "express";
import {
  getAllHeroes,
  getHeroById,
} from "../controllers/hero.controller";

const router = Router();

router.get("/heroes", getAllHeroes);

router.get("/heroes/:id", getHeroById);

export default router;
