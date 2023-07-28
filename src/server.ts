import fastify from 'fastify'
import { PrismaClient } from '@prisma/client'

const app = fastify()
const prisma = new PrismaClient()

app.get('/', async (request, reply) => {
  const wheels = await prisma.wheel.findMany()
  return { wheels }
})

app
  .listen({
    port: 3333,
  })
  .then((address) => {
    console.log(`🚀Server is listening on ${address}`)
  })
