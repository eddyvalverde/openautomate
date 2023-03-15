import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthDto } from './dto';
import * as argon from 'argon2';

@Injectable({})
export class AuthService {
  constructor(private prisma: PrismaService) {}
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  async login(dto: AuthDto) {
    const hash = await argon.hash(dto.password);

    const user = await this.prisma.user.create({
      data: {
        email: dto.email,
        hash,
      },
    });
    return user;
  }
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  signup(dto: AuthDto) {
    return {
      msg: 'I have signed in- email:' + dto.email + ' password:' + dto.password,
    };
  }
}
