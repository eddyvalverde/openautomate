import { Body, Controller, Post, Req } from '@nestjs/common';
import { AuthService } from './auth.service'

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('signup')
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  signup(@Body() dto: any) {
    console.log(dto);
    return this.authService.signup();
  }

  @Post('login')
  signin() {
    return this.authService.login();
  }
}
