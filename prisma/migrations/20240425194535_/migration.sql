/*
  Warnings:

  - You are about to drop the column `apllido` on the `Persona` table. All the data in the column will be lost.
  - Added the required column `apellido` to the `Persona` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Persona" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "edad" INTEGER NOT NULL
);
INSERT INTO "new_Persona" ("edad", "id", "nombre") SELECT "edad", "id", "nombre" FROM "Persona";
DROP TABLE "Persona";
ALTER TABLE "new_Persona" RENAME TO "Persona";
CREATE UNIQUE INDEX "Persona_id_key" ON "Persona"("id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
