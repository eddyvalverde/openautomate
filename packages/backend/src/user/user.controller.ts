import { Body, Controller, Get, Patch, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { User } from '@prisma/client';
import { Request } from 'express';
import { GetUser } from '../auth/decorator/get-user.decorator';
import { JwtGuard } from '../auth/guard';
import { UserService } from './user.service';
import { EditUserDto } from './dto';

@Controller('users')
export class UserController {
  constructor(private userService: UserService){}
  @UseGuards(JwtGuard)
  @Get('me')
  // eslint-disable-next-line prettier/prettier
  getMe(@GetUser() user: User) { //@GetUser('id') to get only a column value
    /*console.log({
      user: req.user,
    });*/
    return user;
  }

  @Patch()
  editUser(@GetUser('ide') userId: number, @Body() dto: EditUserDto) {
    return this.userService.editUser(userId, dto);
  }
}
