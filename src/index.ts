import express, { Request, Response } from "express";
import synergyRouter from "./routes/synergy.route";
import heroRouter from "./routes/hero.route";
import commanderRouter from "./routes/commander.route";
import cors from "cors";
import { cacheControl } from "./middleware/cacheControl";

const app = express();
const PORT = process.env.port || 3000;

app.use(cors());

app.use(express.json());

app.use("/api", synergyRouter);

app.use("/api", heroRouter);

app.use("/api", commanderRouter);

app.get("/", (req: Request, res: Response) => {
  res.send("M C G G  A P I");
});

app.get("/api", cacheControl(60), (req: Request, res: Response) => {
  res.json({
    synergies: `${process.env.BASE_URL}/synergies`,
    heroes: `${process.env.BASE_URL}/heroes`,
    commander: `${process.env.BASE_URL}/commanders`,
    items: `${process.env.BASE_URL}/items`,
  });
});

app.listen(PORT, () => {
  console.log(`http://localhost:${PORT}/api`);
});
