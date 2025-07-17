import { Router } from "express";
import {
  getAllSynergies,
  getSynergyByParam,
} from "../controllers/synergy.controller";

const router = Router();

router.get("/synergies", getAllSynergies);

router.get("/synergies/:param", getSynergyByParam);

export default router;
