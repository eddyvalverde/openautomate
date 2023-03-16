/*
  Warnings:

  - You are about to drop the `DataBaseData` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DataBaseStep` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DataBaseStepRun` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DatabaseConfiguration` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Email` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Expression` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Flow` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FlowRun` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ImapConfiguration` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ImapStep` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ImapStepRun` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Parameter` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ParameterType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Step` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StepRun` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Value` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ValueRun` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DataBaseData" DROP CONSTRAINT "DataBaseData_dataBaseStepId_fkey";

-- DropForeignKey
ALTER TABLE "DataBaseStep" DROP CONSTRAINT "DataBaseStep_databaseConfigurationId_fkey";

-- DropForeignKey
ALTER TABLE "DataBaseStepRun" DROP CONSTRAINT "DataBaseStepRun_dataBaseStepId_fkey";

-- DropForeignKey
ALTER TABLE "DataBaseStepRun" DROP CONSTRAINT "DataBaseStepRun_flowRunId_fkey";

-- DropForeignKey
ALTER TABLE "DatabaseConfiguration" DROP CONSTRAINT "DatabaseConfiguration_userId_fkey";

-- DropForeignKey
ALTER TABLE "Flow" DROP CONSTRAINT "Flow_userId_fkey";

-- DropForeignKey
ALTER TABLE "FlowRun" DROP CONSTRAINT "FlowRun_flowId_fkey";

-- DropForeignKey
ALTER TABLE "ImapConfiguration" DROP CONSTRAINT "ImapConfiguration_userId_fkey";

-- DropForeignKey
ALTER TABLE "ImapStep" DROP CONSTRAINT "ImapStep_flowId_fkey";

-- DropForeignKey
ALTER TABLE "ImapStep" DROP CONSTRAINT "ImapStep_imapConfigurationId_fkey";

-- DropForeignKey
ALTER TABLE "ImapStepRun" DROP CONSTRAINT "ImapStepRun_flowRunId_fkey";

-- DropForeignKey
ALTER TABLE "ImapStepRun" DROP CONSTRAINT "ImapStepRun_imapStepId_fkey";

-- DropForeignKey
ALTER TABLE "Parameter" DROP CONSTRAINT "Parameter_expressionId_fkey";

-- DropForeignKey
ALTER TABLE "Parameter" DROP CONSTRAINT "Parameter_parameterTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Step" DROP CONSTRAINT "Step_expressionId_fkey";

-- DropForeignKey
ALTER TABLE "Step" DROP CONSTRAINT "Step_flowId_fkey";

-- DropForeignKey
ALTER TABLE "Step" DROP CONSTRAINT "Step_succesorId_fkey";

-- DropForeignKey
ALTER TABLE "StepRun" DROP CONSTRAINT "StepRun_flowRunId_fkey";

-- DropForeignKey
ALTER TABLE "StepRun" DROP CONSTRAINT "StepRun_stepId_fkey";

-- DropForeignKey
ALTER TABLE "StepRun" DROP CONSTRAINT "StepRun_successorId_fkey";

-- DropForeignKey
ALTER TABLE "Value" DROP CONSTRAINT "Value_ParameterId_fkey";

-- DropForeignKey
ALTER TABLE "Value" DROP CONSTRAINT "Value_stepId_fkey";

-- DropForeignKey
ALTER TABLE "ValueRun" DROP CONSTRAINT "ValueRun_stepRunId_fkey";

-- DropForeignKey
ALTER TABLE "ValueRun" DROP CONSTRAINT "ValueRun_valueId_fkey";

-- DropTable
DROP TABLE "DataBaseData";

-- DropTable
DROP TABLE "DataBaseStep";

-- DropTable
DROP TABLE "DataBaseStepRun";

-- DropTable
DROP TABLE "DatabaseConfiguration";

-- DropTable
DROP TABLE "Email";

-- DropTable
DROP TABLE "Expression";

-- DropTable
DROP TABLE "Flow";

-- DropTable
DROP TABLE "FlowRun";

-- DropTable
DROP TABLE "ImapConfiguration";

-- DropTable
DROP TABLE "ImapStep";

-- DropTable
DROP TABLE "ImapStepRun";

-- DropTable
DROP TABLE "Parameter";

-- DropTable
DROP TABLE "ParameterType";

-- DropTable
DROP TABLE "Step";

-- DropTable
DROP TABLE "StepRun";

-- DropTable
DROP TABLE "Value";

-- DropTable
DROP TABLE "ValueRun";

-- CreateTable
CREATE TABLE "imapConfigurations" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "host" TEXT NOT NULL,
    "port" INTEGER NOT NULL,
    "tls" BOOLEAN NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "imapConfigurations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "databaseConfigurations" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "system" TEXT NOT NULL,
    "server" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "database" TEXT NOT NULL,
    "port" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "databaseConfigurations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "flows" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "flows_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emails" (
    "id" SERIAL NOT NULL,
    "subject" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "bodyPreview" TEXT NOT NULL,
    "mesageId" TEXT NOT NULL,
    "internetMesageId" TEXT NOT NULL,
    "conversationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "emails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imapSteps" (
    "id" SERIAL NOT NULL,
    "imapConfigurationId" INTEGER NOT NULL,
    "flowId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "imapSteps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parameterTypes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "parameterTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parameters" (
    "id" SERIAL NOT NULL,
    "index" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "parameterTypeId" INTEGER NOT NULL,
    "expressionId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "parameters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "expressions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "expressions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "steps" (
    "id" SERIAL NOT NULL,
    "input" TEXT NOT NULL,
    "output" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "expressionId" INTEGER NOT NULL,
    "flowId" INTEGER NOT NULL,
    "succesorId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "steps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "flowRun" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "flowId" INTEGER NOT NULL,

    CONSTRAINT "flowRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stepRuns" (
    "id" SERIAL NOT NULL,
    "log" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "stepId" INTEGER NOT NULL,
    "flowRunId" INTEGER NOT NULL,
    "successorId" INTEGER,

    CONSTRAINT "stepRuns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "values" (
    "id" SERIAL NOT NULL,
    "data" TEXT NOT NULL,
    "ParameterId" INTEGER NOT NULL,
    "stepId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "valueRuns" (
    "id" SERIAL NOT NULL,
    "data" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "valueId" INTEGER NOT NULL,
    "stepRunId" INTEGER NOT NULL,

    CONSTRAINT "valueRuns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imapStepRuns" (
    "id" SERIAL NOT NULL,
    "imapStepId" INTEGER NOT NULL,
    "flowRunId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "imapStepRuns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dataBaseDatas" (
    "id" SERIAL NOT NULL,
    "data" TEXT NOT NULL,
    "attributeName" TEXT NOT NULL,
    "attributeType" TEXT NOT NULL,
    "dataBaseStepId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dataBaseDatas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dataBaseSteps" (
    "id" SERIAL NOT NULL,
    "tableName" TEXT NOT NULL,
    "databaseConfigurationId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dataBaseSteps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dataBaseStepRuns" (
    "id" SERIAL NOT NULL,
    "log" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "dataBaseStepId" INTEGER NOT NULL,
    "flowRunId" INTEGER NOT NULL,

    CONSTRAINT "dataBaseStepRuns_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "imapSteps_flowId_key" ON "imapSteps"("flowId");

-- CreateIndex
CREATE UNIQUE INDEX "steps_expressionId_key" ON "steps"("expressionId");

-- CreateIndex
CREATE UNIQUE INDEX "steps_flowId_key" ON "steps"("flowId");

-- CreateIndex
CREATE UNIQUE INDEX "steps_succesorId_key" ON "steps"("succesorId");

-- CreateIndex
CREATE UNIQUE INDEX "stepRuns_stepId_key" ON "stepRuns"("stepId");

-- CreateIndex
CREATE UNIQUE INDEX "stepRuns_successorId_key" ON "stepRuns"("successorId");

-- CreateIndex
CREATE UNIQUE INDEX "imapStepRuns_flowRunId_key" ON "imapStepRuns"("flowRunId");

-- CreateIndex
CREATE UNIQUE INDEX "dataBaseStepRuns_flowRunId_key" ON "dataBaseStepRuns"("flowRunId");

-- AddForeignKey
ALTER TABLE "imapConfigurations" ADD CONSTRAINT "imapConfigurations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "databaseConfigurations" ADD CONSTRAINT "databaseConfigurations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "flows" ADD CONSTRAINT "flows_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imapSteps" ADD CONSTRAINT "imapSteps_imapConfigurationId_fkey" FOREIGN KEY ("imapConfigurationId") REFERENCES "imapConfigurations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imapSteps" ADD CONSTRAINT "imapSteps_flowId_fkey" FOREIGN KEY ("flowId") REFERENCES "flows"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "parameters" ADD CONSTRAINT "parameters_parameterTypeId_fkey" FOREIGN KEY ("parameterTypeId") REFERENCES "parameterTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "parameters" ADD CONSTRAINT "parameters_expressionId_fkey" FOREIGN KEY ("expressionId") REFERENCES "expressions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_expressionId_fkey" FOREIGN KEY ("expressionId") REFERENCES "expressions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_flowId_fkey" FOREIGN KEY ("flowId") REFERENCES "flows"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_succesorId_fkey" FOREIGN KEY ("succesorId") REFERENCES "steps"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "flowRun" ADD CONSTRAINT "flowRun_flowId_fkey" FOREIGN KEY ("flowId") REFERENCES "flows"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stepRuns" ADD CONSTRAINT "stepRuns_stepId_fkey" FOREIGN KEY ("stepId") REFERENCES "steps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stepRuns" ADD CONSTRAINT "stepRuns_flowRunId_fkey" FOREIGN KEY ("flowRunId") REFERENCES "flowRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stepRuns" ADD CONSTRAINT "stepRuns_successorId_fkey" FOREIGN KEY ("successorId") REFERENCES "stepRuns"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "values" ADD CONSTRAINT "values_ParameterId_fkey" FOREIGN KEY ("ParameterId") REFERENCES "parameters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "values" ADD CONSTRAINT "values_stepId_fkey" FOREIGN KEY ("stepId") REFERENCES "steps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "valueRuns" ADD CONSTRAINT "valueRuns_valueId_fkey" FOREIGN KEY ("valueId") REFERENCES "values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "valueRuns" ADD CONSTRAINT "valueRuns_stepRunId_fkey" FOREIGN KEY ("stepRunId") REFERENCES "stepRuns"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imapStepRuns" ADD CONSTRAINT "imapStepRuns_imapStepId_fkey" FOREIGN KEY ("imapStepId") REFERENCES "imapSteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imapStepRuns" ADD CONSTRAINT "imapStepRuns_flowRunId_fkey" FOREIGN KEY ("flowRunId") REFERENCES "flowRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dataBaseDatas" ADD CONSTRAINT "dataBaseDatas_dataBaseStepId_fkey" FOREIGN KEY ("dataBaseStepId") REFERENCES "dataBaseSteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dataBaseSteps" ADD CONSTRAINT "dataBaseSteps_databaseConfigurationId_fkey" FOREIGN KEY ("databaseConfigurationId") REFERENCES "databaseConfigurations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dataBaseStepRuns" ADD CONSTRAINT "dataBaseStepRuns_dataBaseStepId_fkey" FOREIGN KEY ("dataBaseStepId") REFERENCES "dataBaseSteps"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dataBaseStepRuns" ADD CONSTRAINT "dataBaseStepRuns_flowRunId_fkey" FOREIGN KEY ("flowRunId") REFERENCES "flowRun"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
