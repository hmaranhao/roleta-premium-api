import { FastifyInstance } from 'fastify'

import { prisma } from '../../lib/prisma'
import { bodyWheelSchema, paramsWheelIdSchema } from './zodSchemas'

export async function wheelRoutes(app: FastifyInstance) {
  app.get('/wheels', async (request) => {
    const wheels = await prisma.wheel.findMany({
      orderBy: {
        createdAt: 'desc',
      },
    })
    return { wheels }
  })

  app.get('/wheel/:id', async (request) => {
    const { id } = paramsWheelIdSchema.parse(request.params)
    const wheel = await prisma.wheel.findUnique({
      where: { id },
    })
    return { wheel }
  })

  app.put('/wheel/:id', async (request) => {
    const { id } = paramsWheelIdSchema.parse(request.params)
    const { title, enabled, description } = bodyWheelSchema.parse(request.body)
    const wheel = await prisma.wheel.update({
      where: { id },
      data: {
        title,
        enabled,
        description,
      },
    })
    return { wheel }
  })

  app.post('/wheel', async (request) => {
    const { title, description } = bodyWheelSchema.parse(request.body)
    const wheel = await prisma.wheel.create({
      data: {
        title,
        description,
      },
    })
    return { wheel }
  })

  app.delete('/wheel/:id', async (request) => {
    const { id } = paramsWheelIdSchema.parse(request.params)
    console.log('id', id)
    await prisma.wheel.delete({
      where: { id },
    })
    return true
  })
}
