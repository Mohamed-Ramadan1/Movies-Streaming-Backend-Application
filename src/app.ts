// src/app.ts
import express from "express";
import { PORT } from "./config/index.config";
import { checkDbConnection } from "./config/database.config";

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

// Check database connection
checkDbConnection();

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
