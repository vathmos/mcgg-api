import { Request, Response, NextFunction } from "express";

export const cacheControl =
  (seconds: number) => (req: Request, res: Response, next: NextFunction) => {
    res.set("Cache-Control", `s-maxage=${seconds}, stale-while-revalidate`);
    next();
  };
