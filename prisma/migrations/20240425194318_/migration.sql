-- CreateTable
CREATE TABLE "Persona" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apllido" TEXT NOT NULL,
    "edad" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Persona_id_key" ON "Persona"("id");
