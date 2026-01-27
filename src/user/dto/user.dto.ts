import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
    @ApiProperty({ type: Number })
    id: number;

    @ApiProperty({ type: String })
    email: string;

    @ApiProperty({ type: String })
    name: string;

    @ApiProperty({ type: String })
    password: string;
}

export class UserResponseDto {
    @ApiProperty({ type: Number })
    id: number;

    @ApiProperty({ type: String })
    email: string;

    @ApiProperty({ type: String })
    name: string;

    constructor(partial: Partial<UserResponseDto>) {
        Object.assign(this, partial);
    }
}

