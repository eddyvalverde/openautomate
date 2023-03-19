import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class PrismaService extends PrismaClient {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  constructor(config: ConfigService) {
    super({
      datasources: {
        db: {
          url: config.get('DATABASE_URL'),
        },
      },
    });
  }
  cleanDb() {
    return this.$transaction([
      this.bookmark.deleteMany(),
      this.dataBaseData.deleteMany(),
      this.databaseConfiguration.deleteMany(),
      this.expression.deleteMany(),
      this.dataBaseStep.deleteMany(),
      this.step.deleteMany(),
      this.stepRun.deleteMany(),
      this.flowRun.deleteMany(),
      this.email.deleteMany(),
      this.imapStep.deleteMany(),
      this.imapConfiguration.deleteMany(),
      this.flow.deleteMany(),
      this.user.deleteMany(),
    ]);
  }
}
