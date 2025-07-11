import { Router } from "express";
import {
  getAllSynergies,
  getSynergyById,
} from "../controllers/synergy.controller";

const router = Router();

router.get("/synergy", getAllSynergies);

router.get("/synergy/:id", getSynergyById);

export default router;
