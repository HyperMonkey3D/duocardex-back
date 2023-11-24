import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { OrdersModule } from './orders/orders.module';
import { ClientsModule } from './clients/clients.module';
import { ItemsModule } from './items/items.module';

@Module({
  imports: [ConfigModule.forRoot(), OrdersModule, ClientsModule, ItemsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
