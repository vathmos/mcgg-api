import express, { Request, Response } from "express";
import synergyRouter from "./routes/synergy.route";
import heroRouter from "./routes/hero.route";
import commanderRouter from "./routes/commander.route";

const app = express();
const PORT = process.env.port || 3000;

app.use(express.json());

app.use("/api", synergyRouter);

app.use("/api", heroRouter);

app.use("/api", commanderRouter);

app.get("/", (req: Request, res: Response) => {
  res.send("M C G G  A P I");
});

app.get("/api", (req: Request, res: Response) => {
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
