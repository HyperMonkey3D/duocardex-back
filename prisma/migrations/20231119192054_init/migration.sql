/*
  Warnings:

  - The primary key for the `Order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `clientID` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `orderID` on the `Order` table. All the data in the column will be lost.
  - The primary key for the `Client` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `address` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `clinic` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `creationDate` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `doctorLastName` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `doctorName` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `orgID` on the `Client` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Client` table. All the data in the column will be lost.
  - The primary key for the `Product` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `orderNumber` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `Product` table. All the data in the column will be lost.
  - Added the required column `ClientID` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `OrderDate` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `OrderID` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ProductID` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Quantity` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `TotalAmount` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `UnitPrice` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Address` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ClientID` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ClinicName` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DoctorFirstName` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DoctorLastName` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ID` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Phone` to the `Client` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Description` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Price` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ProductID` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ProductName` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "OrderID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ClientID" INTEGER NOT NULL,
    "ProductID" INTEGER NOT NULL,
    "OrderDate" DATETIME NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "UnitPrice" DECIMAL NOT NULL,
    "TotalAmount" DECIMAL NOT NULL,
    CONSTRAINT "Order_ClientID_fkey" FOREIGN KEY ("ClientID") REFERENCES "Client" ("ClientID") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID") ON DELETE RESTRICT ON UPDATE CASCADE
);
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
    "ClientID" INTEGER NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client_ClientID_key" ON "Client"("ClientID");
CREATE TABLE "new_Product" (
    "ProductID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ProductName" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Price" DECIMAL NOT NULL
);
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
