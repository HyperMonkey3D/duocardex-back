import { Injectable } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { PrismaService } from 'prisma.service';

@Injectable()
export class OrdersService {

  constructor(private prisma:PrismaService){}

  create(data) {
    return this.prisma.order.create({data})
  }

  findAll() {
    return this.prisma.order.findMany()
  }

  findOne(id: number) {
    return this.prisma.order.findUnique({
      where: {
        OrderID: id
      }
    });
  }

  update(id: number, updateOrderDto) {
    return this.prisma.order.update({
      where: {
        OrderID: id
      },
      data: updateOrderDto
    })
  }

  remove(id: number) {
    return this.prisma.order.delete({
      where: {
        OrderID: id
      }
    })
  }
}
