import { Router } from "express";
import { getAllItems, getItemByParam } from "../controllers/item.controller";
import { cacheControl } from "../middleware/cacheControl";

const router = Router();

router.get("/items", cacheControl(600), getAllItems);

router.get("/items/:param", cacheControl(600), getItemByParam);

export default router;