FROM node:alpine

WORKDIR /code

ENV PATH /code/node_modules/.bin:$PATH

COPY package.json package-lock.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]
