FROM node:20-alpine

RUN addgroup -g 1001 ahmdgroup && adduser -u 1001 -G ahmdgroup -s /bin/sh -D ahmduser

WORKDIR /home/ahmd

COPY source/ /home/ahmd/
RUN chown -R ahmduser:ahmdgroup /home/ahmd
RUN chmod -R 755 /home/ahmd && find /home/ahmd -type f -exec chmod 644 {} \;

USER ahmduser
RUN npm install

EXPOSE 3000

CMD [ "node", "app.js" ]
