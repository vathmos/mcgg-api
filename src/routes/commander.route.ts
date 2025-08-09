import { Router } from "express";
import { getAllCommanders, getCommanderByParam } from "../controllers/commander.controller";

const router = Router();

router.get("/commanders", getAllCommanders);

router.get("/commanders/:param", getCommanderByParam);

export default router;