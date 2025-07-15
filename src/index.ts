import express, { Request, Response } from "express";
import helloRouter from "./routes/hello.route";
import synergyRouter from "./routes/synergy.route";
import heroRouter from "./routes/hero.route";

const app = express();
const PORT = process.env.port || 3000;

app.use(express.json());

app.use("/api", helloRouter);

app.use("/api", synergyRouter);

app.use("/api", heroRouter);

app.get("/", (req: Request, res: Response) => {
  res.send("TEESKONFIG DOT JESON");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
