import { Router } from "express";
import {
  getAllHeroes,
  getHeroByParam,
} from "../controllers/hero.controller";
import { cacheControl } from "../middleware/cacheControl";

const router = Router();

router.get("/heroes", cacheControl(600), getAllHeroes);

router.get("/heroes/:param", cacheControl(600),getHeroByParam);

export default router;
