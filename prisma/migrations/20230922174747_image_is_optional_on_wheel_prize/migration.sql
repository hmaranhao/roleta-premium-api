/*
  Warnings:

  - Added the required column `chancePercent` to the `WheelPrize` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_WheelPrize" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "wheelId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "image" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "chancePercent" REAL NOT NULL,
    CONSTRAINT "WheelPrize_wheelId_fkey" FOREIGN KEY ("wheelId") REFERENCES "Wheel" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_WheelPrize" ("createdAt", "id", "image", "title", "updatedAt", "wheelId") SELECT "createdAt", "id", "image", "title", "updatedAt", "wheelId" FROM "WheelPrize";
DROP TABLE "WheelPrize";
ALTER TABLE "new_WheelPrize" RENAME TO "WheelPrize";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
