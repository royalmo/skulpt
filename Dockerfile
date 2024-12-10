# Build with docker because my default node version didn't work

# docker build -t my-project .
# docker run --rm -u $UID -v $(pwd):/usr/src/app my-project
# cp ./dist/skulpt.min.js ~/Documents/app/public/python3/lib/skulpt.min.js
# cp ./dist/skulpt-stdlib.js ~/Documents/app/public/python3/lib/skulpt-stdlib.js

FROM node:18

WORKDIR /usr/src/app
RUN git config --global --add safe.directory /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
ENV NODE_OPTIONS=--openssl-legacy-provider

CMD ["npm", "run", "build"]
