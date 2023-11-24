/*
  Warnings:

  - Added the required column `Comment` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "OrderID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ClientID" TEXT NOT NULL,
    "ProductID" INTEGER NOT NULL,
    "OrderDate" DATETIME NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "UnitPrice" DECIMAL NOT NULL,
    "Comment" TEXT NOT NULL,
    "TotalAmount" DECIMAL NOT NULL,
    CONSTRAINT "Order_ClientID_fkey" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("ClientID", "OrderDate", "OrderID", "ProductID", "Quantity", "TotalAmount", "UnitPrice") SELECT "ClientID", "OrderDate", "OrderID", "ProductID", "Quantity", "TotalAmount", "UnitPrice" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
