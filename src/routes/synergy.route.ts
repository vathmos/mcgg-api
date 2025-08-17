import { Router } from "express";
import {
  getAllSynergies,
  getSynergyByParam,
} from "../controllers/synergy.controller";
import { cacheControl } from "../middleware/cacheControl";

const router = Router();

router.get("/synergies", cacheControl(600), getAllSynergies);

router.get("/synergies/:param", cacheControl(600), getSynergyByParam);

export default router;
