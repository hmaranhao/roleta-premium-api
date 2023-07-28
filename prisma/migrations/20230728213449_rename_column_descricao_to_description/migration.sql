/*
  Warnings:

  - You are about to drop the column `descricao` on the `Wheel` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Wheel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME,
    "enabled" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_Wheel" ("createdAt", "deletedAt", "enabled", "id", "title", "updatedAt") SELECT "createdAt", "deletedAt", "enabled", "id", "title", "updatedAt" FROM "Wheel";
DROP TABLE "Wheel";
ALTER TABLE "new_Wheel" RENAME TO "Wheel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
