import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { v4 as uuidv4 } from 'uuid';

interface order {
  select: string
  quantity: string
  productName: string
  unitPrice: string
  totalPrice: number
}

@Controller('orders')
export class OrdersController {
  constructor(private readonly ordersService: OrdersService) {}

  @Post()
  create(@Body() body: CreateOrderDto) {
    const OrderID = uuidv4()
    const createdAt = new Date().toISOString()
    const { ClientID, Comment, Orders } = body

    try {
      Orders.map((item:order) => {
        const { select, quantity, productName, unitPrice, totalPrice } = item
       
        const posted = {
         OrderID,
          ClientID,
          ProductID: parseInt(select),
          ProductName: productName,
          OrderDate: createdAt,
          Quantity: parseInt(quantity),
          UnitPrice: unitPrice,
          Comment,
          TotalAmount: totalPrice
        }
      return this.ordersService.create(posted)
      
       })
    } catch (error) {
      console.error(error)
    }
    
  }

  @Get()
  findAll() {
    return this.ordersService.findAll();
  }

  @Get(':orderId')
  findOne(@Param('orderId') orderId: string) {
    return this.ordersService.findOne(orderId);
  }

  @Patch(':orderId')
  update(@Param('orderId') orderId: string, @Body() updateOrderDto: UpdateOrderDto) {
    return this.ordersService.update(orderId, updateOrderDto);
  }

  @Delete(':orderId')
  remove(@Param('orderId') orderId: string) {
    return this.ordersService.remove(orderId);
  }
}
