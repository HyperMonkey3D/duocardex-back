import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { ItemsService } from './items.service';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';

@Controller('items')
export class ItemsController {
  constructor(private readonly itemsService: ItemsService) {}

  @Post()
  create(@Body() body: CreateItemDto) {
    try {
      this.itemsService.create(body);
      return "item created"
    } catch (error) {
      console.log(error)
    }
  }

  @Get()
  findAll() {
    try {
      return this.itemsService.findAll();
    } catch (error) {
      console.log(error)
    }
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    try {
      return this.itemsService.findOne(+id);
    } catch (error) {
      console.log(error)      
    }
  }

  @Patch(":id")
  update(@Param("id", ParseIntPipe) id: number, @Body() body: UpdateItemDto) {
   try {
    console.log("updated!")
     return this.itemsService.update(id, body);
   } catch (error) {
    `this error ${error}`
   }
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.itemsService.remove(+id);
  }
}
