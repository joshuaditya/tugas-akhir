FROM node:20-alpine

RUN addgroup -g 1001 ahmdgroup && adduser -u 1001 -G ahmdgroup -s /bin/sh -D ahmduser

WORKDIR /home/ahmd

RUN mkdir -p /home/ahmd

COPY source/ /home/ahmd/
RUN chown -R ahmduser:ahmdgroup /home/ahmd

USER ahmduser
RUN npm install

EXPOSE 3000

CMD [ "node", "app.js" ]
