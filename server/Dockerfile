FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN apk add python python-dev py2-pip autoconf automake g++ make --no-cache
RUN pip install py-bcrypt
RUN npm install
COPY . .
CMD ["npm", "run", "start"]