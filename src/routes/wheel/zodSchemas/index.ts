import z from 'zod'

export const paramsWheelIdSchema = z.object({
  id: z.string().uuid(),
})

export const bodyWheelSchema = z.object({
  title: z.string({ required_error: 'Título é obrigatório' }),
  description: z.string().optional(),
  enabled: z.coerce.boolean().default(true).optional(),
})
