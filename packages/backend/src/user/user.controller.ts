import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { User } from '@prisma/client';
import { Request } from 'express';
import { GetUser } from '../auth/decorator/get-user.decorator';
import { JwtGuard } from '../auth/guard';

@Controller('users')
export class UserController {
  @UseGuards(JwtGuard)
  @Get('me')
  // eslint-disable-next-line prettier/prettier
  getMe(@GetUser() user: User) { //@GetUser('id') to get only a column value
    /*console.log({
      user: req.user,
    });*/
    return user;
  }
}
