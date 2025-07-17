import { Router } from "express";
import {
  getAllHeroes,
  getHeroByParam,
} from "../controllers/hero.controller";

const router = Router();

router.get("/heroes", getAllHeroes);

router.get("/heroes/:param", getHeroByParam);

export default router;
