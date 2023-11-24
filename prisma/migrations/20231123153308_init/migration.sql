-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "OrderID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ClientID" TEXT NOT NULL,
    "ProductID" INTEGER NOT NULL,
    "OrderDate" DATETIME NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "UnitPrice" DECIMAL NOT NULL,
    "TotalAmount" DECIMAL NOT NULL,
    CONSTRAINT "Order_ClientID_fkey" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("ClientID", "OrderDate", "OrderID", "ProductID", "Quantity", "TotalAmount", "UnitPrice") SELECT "ClientID", "OrderDate", "OrderID", "ProductID", "Quantity", "TotalAmount", "UnitPrice" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
CREATE TABLE "new_Client" (
    "ID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "DoctorFirstName" TEXT NOT NULL,
    "DoctorLastName" TEXT NOT NULL,
    "ClinicName" TEXT NOT NULL,
    "Address" TEXT NOT NULL,
    "Email" TEXT,
    "Phone" TEXT NOT NULL,
    "ClientID" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Client" ("Address", "ClientID", "ClinicName", "CreatedAt", "DoctorFirstName", "DoctorLastName", "Email", "ID", "Phone") SELECT "Address", "ClientID", "ClinicName", "CreatedAt", "DoctorFirstName", "DoctorLastName", "Email", "ID", "Phone" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client_ClientID_key" ON "Client"("ClientID");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
