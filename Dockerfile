FROM node:18-alpine

WORKDIR /usr/app

COPY assets /usr/app/assets
COPY discord /usr/app/discord
COPY languages /usr/app/languages
COPY misc /usr/app/misc
COPY valorant /usr/app/valorant

COPY package.json /usr/app
COPY package-lock.json /usr/app

COPY sharding.js /usr/app/
COPY SkinPeek.js /usr/app/

RUN npm i

RUN adduser -D -u 8877 bot
RUN chown -R bot:bot /usr/app
USER bot

CMD ["node", "SkinPeek.js"]
