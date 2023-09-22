import fastify from 'fastify'
import cors from '@fastify/cors'
import { wheelRoutes } from './routes/wheel'
import { wheelPrizesRoutes } from './routes/wheelPrizes'

const app = fastify()

app.register(cors, { origin: true })

app.register(wheelRoutes)
app.register(wheelPrizesRoutes)

app.get('/', async (request, reply) => {
  return 'Wheel API'
})

app
  .listen({
    port: 3333,
  })
  .then((address) => {
    console.log(`🚀Server is listening on ${address}`)
  })
