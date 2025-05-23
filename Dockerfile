FROM node:22.12.0-alpine3.19

EXPOSE 3000

WORKDIR /app

COPY . .

ENV NODE_ENV=production

ENV AWS_ACCESS= 'AKIA4MTWI4VXGZHLGUE61'
          
ENV AWS_SECRET= 'jbToBJzML4imOAZjXn0ZP2F/XdibfprKa4Fqt6kq2'

RUN npm install --omit=dev

RUN npm run build

# You'll probably want to remove this in production, it's here to make it easier to test things!
RUN rm -f prisma/dev.sqlite

CMD ["npm", "run", "docker-start"]
