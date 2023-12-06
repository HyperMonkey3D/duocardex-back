/*
  Warnings:

  - The primary key for the `Order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ID` on the `Order` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "OrderID" TEXT NOT NULL PRIMARY KEY,
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
