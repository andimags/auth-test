import { IsEmail, IsNumber, IsString } from "class-validator";
import { ApiProperty } from "@nestjs/swagger";

export class LoginDto{
    @ApiProperty()
    @IsString()
    @IsEmail()
    email: string;

    @ApiProperty()
    @IsString()
    password: string;
}

export class VerifyTokenDto{
    @ApiProperty()
    @IsString()
    token: string;

    @ApiProperty()
    @IsString()
    type: 'access' | 'refresh';
}