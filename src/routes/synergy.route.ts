import { Router } from "express";
import {
  getAllSynergies,
  getSynergyById,
} from "../controllers/synergy.controller";

const router = Router();

router.get("/synergies", getAllSynergies);

router.get("/synergies/:id", getSynergyById);

export default router;
