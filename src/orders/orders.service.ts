import { Injectable } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { PrismaService } from 'prisma.service';

@Injectable()
export class OrdersService {

  constructor(private prisma:PrismaService){}

  async create(data) {
    try {
      console.log("success posting order", data.ClientID)
      return this.prisma.order.create({data})
    } catch (error) {
      console.log(error)
    }
    
    
  }

  findAll() {
    return this.prisma.order.findMany()
  }

  findOne(orderId: string) {
    return this.prisma.order.findMany({
      where: { OrderID: orderId}
    });
  }

  update(orderId: string, updateOrderDto) {
    return this.prisma.order.updateMany({
      where: {
        OrderID: orderId
      },
      data: updateOrderDto
    })
  }

  remove(orderId: string) {
    return this.prisma.order.deleteMany({
      where: {
        OrderID: orderId
      }
    })
  }
}
