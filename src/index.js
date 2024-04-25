import express from "express";
import cors from "cors";
import { PrismaClient } from "@prisma/client";

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());
app.use(express.text());
app.use(express.urlencoded({ extended: true }));

app.post("/insert", async (req, res) => {
  try {
    const { nombre, apellido, edad } = req.body;

    const newPerson = await prisma.persona.create({
      data: { nombre, apellido, edad },
    });

    res.status(201).json(newPerson);
  } catch (error) {
    res.json({ message: [error.message] });
  }
});

app.get("/data", async (req, res) => {
  try {
    const row = await prisma.persona.findMany();
    res.status(200).json(row);
  } catch (error) {
    res.status(500).json({ message: [error.message] });
  }
});

app.use((req, res) => {
  try {
    res.status(404).json({ message: ["not found"] });
  } catch (error) {
    res.status(500).json({ message: [error.message] });
  }
});

app.listen(5000, () => console.log("server on port 5000"));
