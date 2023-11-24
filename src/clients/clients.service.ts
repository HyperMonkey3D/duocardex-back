import { Injectable } from '@nestjs/common';
import { CreateClientDto } from './dto/create-client.dto';
import { UpdateClientDto } from './dto/update-client.dto';
import { PrismaService } from 'prisma.service';
import { v4 as uuidv4 } from 'uuid';

@Injectable()
export class ClientsService {

  constructor(private prisma:PrismaService){}

  create(data) {
    try {
      console.log("ssssss", data)
      const ClientID = uuidv4()
      console.log("id", ClientID)
      const CreatedAt = new Date().toISOString()
      console.log(CreatedAt)

      data = {...data, ClientID, CreatedAt}

      return this.prisma.client.create({data})
    } catch (error) {
      throw error
    }
  }

  findAll() {
    try {
      return this.prisma.client.findMany()
    } catch (error) {
      throw error
    }
  }

  findOne(id: number) {
    try {
      return this.prisma.client.findUnique({
        where: {
          ID: id
        }
      })
    } catch (error) {
      throw error
    }
  }

  update(id: number, updateClientDto) {
    try {
      return this.prisma.client.update({
        where: {
          ID: id
        },
        data: updateClientDto
      })
    } catch (error) {
      throw error
    }
  }

  remove(id: number) {
    return this.prisma.client.delete({
      where: {
        ID: id
      }
    })
  }
}
