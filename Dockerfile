FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
COPY server.js /usr/src/app/server.js
COPY db.json /usr/src/app/db.json
RUN npm install --silent
RUN npm install react-scripts -g --silent

# add app
COPY . ./

# start app
CMD ["node", "server.js"]