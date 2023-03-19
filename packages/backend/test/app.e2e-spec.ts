import { INestApplication, ValidationPipe } from '@nestjs/common';
import { Test } from '@nestjs/testing';
import { PrismaService } from '../src/prisma/prisma.service';
import { AppModule } from '../src/app.module';

describe('App e2e', () => {
  let app: INestApplication;
  let prisma: PrismaService;
  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleRef.createNestApplication();
    app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
    await app.init();

    prisma = app.get(PrismaService);

    await prisma.cleanDb();
  });
  afterAll(() => {
    app.close();
  });
  describe('Auth', () => {
    describe('SingUp', () => {
      it.todo('should SignUp');
    });
    describe('Login', () => {
      it.todo('should Login');
    });
  });
  describe('User', () => {
    describe('Get me', () => {
      it.todo('should get current user information');
    });
    describe('Edit User', () => {
      it.todo('should edit current user');
    });
  });
  describe('Bookmarks', () => {
    describe('Create bookmark', () => {
      it.todo('should create a bookmark');
    });
    describe('Get bookmarks', () => {
      it.todo('should get all bookmarks');
    });
    describe('Get bookmark by id', () => {
      it.todo('should get bookmark by id');
    });
    describe('Edit Bookmark', () => {
      it.todo('should edit bookmark details');
    });
    describe('Delete Bookmark', () => {
      it.todo('should delete bookmark');
    });
  });

  describe('DatabaseDatas', () => {
    describe('Create databaseData', () => {
      it.todo('should create a databaseData');
    });
    describe('Get databaseDatas', () => {
      it.todo('should get all databaseDatas');
    });
    describe('Get databaseData by id', () => {
      it.todo('should get databaseData by id');
    });
    describe('Edit databaseData', () => {
      it.todo('should edit databaseData details');
    });
    describe('Delete databaseData', () => {
      it.todo('should delete databaseData');
    });
  });
  describe('DatabaseConfigurations', () => {
    describe('Create databaseConfiguration', () => {
      it.todo('should create a databaseConfiguration');
    });
    describe('Get databaseConfigurations', () => {
      it.todo('should get all databaseConfigurations');
    });
    describe('Get databaseConfiguration by id', () => {
      it.todo('should get databaseConfiguration by id');
    });
    describe('Edit databaseConfiguration', () => {
      it.todo('should edit databaseConfiguration details');
    });
    describe('Delete databaseConfiguration', () => {
      it.todo('should delete databaseConfiguration');
    });
  });
  describe('Expressions', () => {
    describe('Create expressions', () => {
      it.todo('should create an expression');
    });
    describe('Get expressionss', () => {
      it.todo('should get all expressions');
    });
    describe('Get expression by id', () => {
      it.todo('should get expression by id');
    });
    describe('Edit expressions', () => {
      it.todo('should edit expression details');
    });
    describe('Delete expressions', () => {
      it.todo('should delete expression');
    });
  });
  describe('dataBaseSteps', () => {
    describe('Create dataBaseStep', () => {
      it.todo('should create a dataBaseStep');
    });
    describe('Get dataBaseSteps', () => {
      it.todo('should get all dataBaseStepss');
    });
    describe('Get dataBaseStep by id', () => {
      it.todo('should get dataBaseStep by id');
    });
    describe('Edit dataBaseStep', () => {
      it.todo('should edit dataBaseSteps details');
    });
    describe('Delete dataBaseStep', () => {
      it.todo('should delete dataBaseStep');
    });
  });

  describe('Steps', () => {
    describe('Create step', () => {
      it.todo('should create a step');
    });
    describe('Get steps', () => {
      it.todo('should get all steps');
    });
    describe('Get step by id', () => {
      it.todo('should get step by id');
    });
    describe('Edit step', () => {
      it.todo('should edit step details');
    });
    describe('Delete step', () => {
      it.todo('should delete step');
    });
  });
  describe('StepRuns', () => {
    describe('Create stepRuns', () => {
      it.todo('should create a stepRun');
    });
    describe('Get stepRuns', () => {
      it.todo('should get all stepRuns');
    });
    describe('Get stepRun by id', () => {
      it.todo('should get stepRun by id');
    });
    describe('Delete stepRun', () => {
      it.todo('should delete stepRun');
    });
  });
  describe('FlowRuns', () => {
    describe('Create flowRun', () => {
      it.todo('should create a flowRun');
    });
    describe('Get flowRuns', () => {
      it.todo('should get all flowRuns');
    });
    describe('Get flowRun by id', () => {
      it.todo('should get flowRuns by id');
    });
    describe('Delete flowRun', () => {
      it.todo('should delete flowRun');
    });
  });
  describe('Emails', () => {
    describe('Create email', () => {
      it.todo('should create an email');
    });
    describe('Get emails', () => {
      it.todo('should get all emails');
    });
    describe('Get emails by id', () => {
      it.todo('should get email by id');
    });
    describe('Delete emails', () => {
      it.todo('should delete emails');
    });
  });
  describe('ImapSteps', () => {
    describe('Create imapSteps', () => {
      it.todo('should create a imapStep');
    });
    describe('Get imapStepss', () => {
      it.todo('should get all imapSteps');
    });
    describe('Get imapSteps by id', () => {
      it.todo('should get imapStep by id');
    });
    describe('Edit imapSteps', () => {
      it.todo('should edit imapStep details');
    });
    describe('Delete imapSteps', () => {
      it.todo('should delete imapStep');
    });
  });
  describe('ImapConfigurations', () => {
    describe('Create imapConfigurations', () => {
      it.todo('should create an imapConfiguration');
    });
    describe('Get imapConfigurationss', () => {
      it.todo('should get all imapConfigurations');
    });
    describe('Get imapConfigurations by id', () => {
      it.todo('should get imapConfiguration by id');
    });
    describe('Edit imapConfigurations', () => {
      it.todo('should edit imapConfiguration details');
    });
    describe('Delete imapConfigurations', () => {
      it.todo('should delete imapConfiguration');
    });
  });
  describe('Flows', () => {
    describe('Create flows', () => {
      it.todo('should create a flow');
    });
    describe('Get flowss', () => {
      it.todo('should get all flows');
    });
    describe('Get flows by id', () => {
      it.todo('should get flow by id');
    });
    describe('Edit flows', () => {
      it.todo('should edit flow details');
    });
    describe('Delete flows', () => {
      it.todo('should delete flow');
    });
  });
});
