// src/config/database.ts
import { Pool } from "pg";
import { DATABASE_URL } from "./index";

const pool = new Pool({
  connectionString: DATABASE_URL,
});

const checkDbConnection = async () => {
  try {
    await pool.connect();
    console.log("Database connected successfully");
  } catch (error: any) {
    console.error("Database connection failed:", error.message);
    process.exit(1); // Exit the process with failure code
  }
};

export { pool, checkDbConnection };
