-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_WheelPrize" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "wheelId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "WheelPrize_wheelId_fkey" FOREIGN KEY ("wheelId") REFERENCES "Wheel" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_WheelPrize" ("createdAt", "id", "image", "title", "updatedAt", "wheelId") SELECT "createdAt", "id", "image", "title", "updatedAt", "wheelId" FROM "WheelPrize";
DROP TABLE "WheelPrize";
ALTER TABLE "new_WheelPrize" RENAME TO "WheelPrize";
CREATE TABLE "new_WheelSetting" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "wheelId" TEXT NOT NULL,
    "spinLimitPerDay" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "WheelSetting_wheelId_fkey" FOREIGN KEY ("wheelId") REFERENCES "Wheel" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_WheelSetting" ("createdAt", "id", "spinLimitPerDay", "updatedAt", "wheelId") SELECT "createdAt", "id", "spinLimitPerDay", "updatedAt", "wheelId" FROM "WheelSetting";
DROP TABLE "WheelSetting";
ALTER TABLE "new_WheelSetting" RENAME TO "WheelSetting";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
