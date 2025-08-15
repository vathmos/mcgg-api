import { Router } from "express";
import { getAllCommanders, getCommanderByParam } from "../controllers/commander.controller";
import { cacheControl } from "../middleware/cacheControl";

const router = Router();

router.get("/commanders", cacheControl(600),getAllCommanders);

router.get("/commanders/:param", cacheControl(600),getCommanderByParam);

export default router;