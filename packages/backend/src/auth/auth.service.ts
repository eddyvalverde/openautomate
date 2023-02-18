import { Injectable } from '@nestjs/common';

@Injectable({})
export class AuthService {
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  login() {
    return { msg: 'I have logged up' };
  }
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  signup() {
    return { msg: 'I have signed in' };
  }
}
