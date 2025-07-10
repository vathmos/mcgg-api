import express, { Request, Response } from "express";
import helloRouter from "./routes/hello.route";

const app = express();
const PORT = process.env.port || 3000;

app.use(express.json());

app.use("/api", helloRouter);

app.get("/", (req: Request, res: Response) => {
  res.send("TEESKONFIG DOT JESON");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
