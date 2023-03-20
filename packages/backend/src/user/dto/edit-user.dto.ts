import { IsEmail, IsString } from 'class-validator';

export class EditUserDto {
  @IsEmail()
  email?: string;
  @IsString()
  firstname?: string;
  @IsString()
  lastname?: string;
}
