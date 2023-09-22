import { FastifyInstance } from 'fastify'

import { prisma } from '../../lib/prisma'
import {
  bodyWheelPrizeSchema,
  paramsPostWheelPrizeSchema,
  paramsPutWheelPrizeSchema,
} from './zodSchemas'

export async function wheelPrizesRoutes(app: FastifyInstance) {
  app.get('/wheel/:wheelId/wheelPrizes', async (request) => {
    const { wheelId } = paramsPostWheelPrizeSchema.parse(request.params)
    const wheelPrizes = await prisma.wheelPrize.findMany({
      where: {
        wheelId,
      },
    })
    return { wheelPrizes }
  })

  app.put('/wheelPrize/:id', async (request) => {
    const { id } = paramsPutWheelPrizeSchema.parse(request.params)
    const { title, chancePercent, wheelId } = bodyWheelPrizeSchema.parse(
      request.body,
    )
    const wheelPrize = await prisma.wheelPrize.update({
      where: { id },
      data: {
        title,
        wheelId,
        chancePercent,
      },
    })
    return { wheelPrize }
  })

  app.post('/wheel/:wheelId/wheelPrize', async (request) => {
    console.log({ request })
    const { wheelId } = paramsPostWheelPrizeSchema.parse(request.params)
    const { title, chancePercent } = bodyWheelPrizeSchema.parse(request.body)
    const wheelPrize = await prisma.wheelPrize.create({
      data: {
        title,
        chancePercent,
        wheelId,
      },
    })
    return { wheelPrize }
  })

  app.delete('/wheelPrize/:id', async (request) => {
    const { id } = paramsPutWheelPrizeSchema.parse(request.params)
    await prisma.wheelPrize.delete({
      where: { id },
    })
    return true
  })
}
