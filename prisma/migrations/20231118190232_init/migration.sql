-- CreateTable
CREATE TABLE "Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "doctorName" TEXT NOT NULL,
    "doctorLastName" TEXT NOT NULL,
    "clinic" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT NOT NULL,
    "orgID" INTEGER NOT NULL,
    "creationDate" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "orderNumber" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    CONSTRAINT "Product_orderNumber_fkey" FOREIGN KEY ("orderNumber") REFERENCES "Order" ("orderID") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "orderID" INTEGER NOT NULL,
    "clientID" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Order_clientID_fkey" FOREIGN KEY ("clientID") REFERENCES "Client" ("orgID") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Client_orgID_key" ON "Client"("orgID");

-- CreateIndex
CREATE UNIQUE INDEX "Order_orderID_key" ON "Order"("orderID");
