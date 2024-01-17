FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install

# Add the rest of your application files
COPY . .

CMD ["npm", "start"]