import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ClientsService } from './clients.service';
import { CreateClientDto } from './dto/create-client.dto';
import { UpdateClientDto } from './dto/update-client.dto';

@Controller('clients')
export class ClientsController {
  constructor(private readonly clientsService: ClientsService) {}

  @Post()
  create(@Body() createClientDto: CreateClientDto) {
    try {
      return this.clientsService.create(createClientDto);
    } catch (error) {
      console.log(error)
    }
  }

  @Get()
  findAll() {
    try {
      return this.clientsService.findAll();
    } catch (error) {
      console.log(error)
    }
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    try {
      return this.clientsService.findOne(+id);
    } catch (error) {
      console.log(error)
    }
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateClientDto: UpdateClientDto) {
    try {
      `updated!`
      return this.clientsService.update(+id, updateClientDto);
    } catch (error) {
      console.log(error)
    }
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.clientsService.remove(+id);
  }
}
