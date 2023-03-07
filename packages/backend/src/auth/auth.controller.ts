import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthDto } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('signup')
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  signup(@Body() dto: AuthDto) {
    console.log(dto);
    return this.authService.signup();
  }

  @Post('login')
  signin() {
    return this.authService.login();
  }
}
