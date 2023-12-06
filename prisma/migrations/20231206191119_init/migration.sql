/*
  Warnings:

  - The primary key for the `Order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `ID` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "ID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "OrderID" TEXT NOT NULL,
    "ClientID" TEXT NOT NULL,
    "ProductID" INTEGER NOT NULL,
    "ProductName" TEXT NOT NULL,
    "OrderDate" DATETIME NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "UnitPrice" DECIMAL NOT NULL,
    "Comment" TEXT NOT NULL,
    "TotalAmount" DECIMAL NOT NULL,
    CONSTRAINT "Order_ClientID_fkey" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("ClientID", "Comment", "OrderDate", "OrderID", "ProductID", "ProductName", "Quantity", "TotalAmount", "UnitPrice") SELECT "ClientID", "Comment", "OrderDate", "OrderID", "ProductID", "ProductName", "Quantity", "TotalAmount", "UnitPrice" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
