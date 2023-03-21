import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { StringDecoder } from 'string_decoder';

export class CreateBookmarkDto {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsString()
  @IsNotEmpty()
  link: string;
}
