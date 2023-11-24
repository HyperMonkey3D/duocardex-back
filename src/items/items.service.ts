import { Injectable } from '@nestjs/common';
import { CreateItemDto } from './dto/create-item.dto';
import { UpdateItemDto } from './dto/update-item.dto';
import { PrismaService } from 'prisma.service';


@Injectable()
export class ItemsService {

  constructor(private prisma:PrismaService){}

  async create(data) {
    try {
      return this.prisma.product.create({data})
    } catch (error) {
       throw error
    }
  }

  async findAll() {
    try {
      return this.prisma.product.findMany() 
    } catch (error) {
      throw error      
    }
  }

  async findOne(id: number) {
    try {
      return this.prisma.product.findUnique({
        where: {
          ProductID: id
        }
      }) 
    } catch (error) {
      throw error     
    }
  }

  async update(id: number, updateItemDto) {
    try {
      return this.prisma.product.update({
        where: {
          ProductID: id
        },
        data: updateItemDto
      }) 
    } catch (error) {
      throw error
    }
  }

  async remove(id: number) {
    try {
      return this.prisma.product.delete({
        where:{
          ProductID: id
        }
      })
    } catch (error) {
      throw error
    }
  }
}
