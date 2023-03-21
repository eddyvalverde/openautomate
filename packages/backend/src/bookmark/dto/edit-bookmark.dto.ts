import { IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { StringDecoder } from 'string_decoder';

export class EditBookmarkDto {
  @IsString()
  @IsOptional()
  title?: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsString()
  @IsOptional()
  link?: string;
}
