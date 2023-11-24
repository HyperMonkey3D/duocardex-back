export class CreateOrderDto {
    clientID: number
    productID: number
    orderDate: string
    quantity: number
    unitPrice: number
    comment: string
    totalAmount: number
}
