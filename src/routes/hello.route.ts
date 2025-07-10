import { Request, Response, Router } from "express";

const router = Router();

router.get("/hello", (req: Request, res: Response) => {
  res.json({message: "THIS IS THE HELLO ROUTE BUDDY!"});
})

export default router;