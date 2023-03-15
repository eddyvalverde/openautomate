import { Injectable } from '@nestjs/common';
import { AuthDto } from './dto';

@Injectable({})
export class AuthService {
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  login(dto: AuthDto) {
    return {
      msg: 'I have logged up- email:' + dto.email + ' password:' + dto.password,
    };
  }
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  signup(dto: AuthDto) {
    return {
      msg: 'I have signed in- email:' + dto.email + ' password:' + dto.password,
    };
  }
}
