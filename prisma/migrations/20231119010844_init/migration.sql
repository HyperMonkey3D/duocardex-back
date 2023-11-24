-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "orderNumber" INTEGER,
    "name" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    CONSTRAINT "Product_orderNumber_fkey" FOREIGN KEY ("orderNumber") REFERENCES "Order" ("orderID") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Product" ("id", "name", "orderNumber", "price") SELECT "id", "name", "orderNumber", "price" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
