import z from 'zod'

export const paramsPostWheelPrizeSchema = z.object({
  wheelId: z.string(),
})

export const paramsPutWheelPrizeSchema = z.object({
  id: z.string(),
})

export const bodyWheelPrizeSchema = z.object({
  title: z.string({ required_error: 'Título é obrigatório' }),
  chancePercent: z.number(),
  wheelId: z.string().optional(),
})
