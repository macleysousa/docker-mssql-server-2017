FROM node:14

RUN apt-get update

# # install certificates for https
# RUN apt-get install -yyq ca-certificates
# # install libraries
# RUN apt-get install -yyq libappindicator1 libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6
# # install tools
# RUN apt-get install -yyq gconf-service lsb-release wget xdg-utils
# # install fonts
# RUN apt-get install -yyq fonts-liberation

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn

COPY . .

RUN npx prisma generate

RUN yarn build

ENV PORT=3000

ENV NODE_ENV=production
ENV SERVER=docker
ENV BROWSER_PATH=/usr/bin/google-chrome-stable

CMD ["yarn","start"]