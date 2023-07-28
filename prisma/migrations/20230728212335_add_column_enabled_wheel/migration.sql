-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Wheel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "descricao" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "deletedAt" DATETIME,
    "enabled" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_Wheel" ("createdAt", "descricao", "id", "title", "updatedAt") SELECT "createdAt", "descricao", "id", "title", "updatedAt" FROM "Wheel";
DROP TABLE "Wheel";
ALTER TABLE "new_Wheel" RENAME TO "Wheel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
