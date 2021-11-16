-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` DATETIME NOT NULL,
    `name` TEXT,
    `email` TEXT NOT NULL,
    `hashedPassword` TEXT,
    `role` VARCHAR(50) NOT NULL DEFAULT 'USER',
    PRIMARY KEY (`id`)
);

-- CreateTable
CREATE TABLE `Session` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` DATETIME NOT NULL,
    `expiresAt` DATETIME,
    `handle` VARCHAR(50) NOT NULL,
    `hashedSessionToken` TEXT,
    `antiCSRFToken` TEXT,
    `publicData` TEXT,
    `privateData` TEXT,
    `userId` INTEGER,
    PRIMARY KEY (`id`)
);

-- CreateTable
CREATE TABLE `Token` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` DATETIME NOT NULL,
    `hashedToken` VARCHAR(100) NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    `expiresAt` DATETIME NOT NULL,
    `sentTo` VARCHAR(100) NOT NULL,
    `userId` INTEGER NOT NULL,
    PRIMARY KEY (`id`)
);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `User_email_key` ON `User`(`email`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `Session_handle_key` ON `Session`(`handle`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `Token_hashedToken_type_key` ON `Token`(`hashedToken`, `type`);
