/*
  Warnings:

  - A unique constraint covering the columns `[handle]` on the table `Session` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[hashedToken,type]` on the table `Token` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `Session` MODIFY `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `expiresAt` DATETIME(3) NULL,
    MODIFY `handle` VARCHAR(191) NOT NULL,
    MODIFY `hashedSessionToken` VARCHAR(191) NULL,
    MODIFY `antiCSRFToken` VARCHAR(191) NULL,
    MODIFY `publicData` VARCHAR(191) NULL,
    MODIFY `privateData` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Token` MODIFY `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `hashedToken` VARCHAR(191) NOT NULL,
    MODIFY `type` VARCHAR(191) NOT NULL,
    MODIFY `expiresAt` DATETIME(3) NOT NULL,
    MODIFY `sentTo` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `User` MODIFY `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `name` VARCHAR(191) NULL,
    MODIFY `email` VARCHAR(191) NOT NULL,
    MODIFY `hashedPassword` VARCHAR(191) NULL,
    MODIFY `role` VARCHAR(191) NOT NULL DEFAULT 'USER';

-- CreateIndex
CREATE UNIQUE INDEX `Session_handle_key` ON `Session`(`handle`);

-- CreateIndex
CREATE UNIQUE INDEX `Token_hashedToken_type_key` ON `Token`(`hashedToken`, `type`);

-- CreateIndex
CREATE UNIQUE INDEX `User_email_key` ON `User`(`email`);

-- AddForeignKey
ALTER TABLE `Session` ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Token` ADD CONSTRAINT `Token_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
