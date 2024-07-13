FROM node:latest
WORKDIR /usr/src/app
COPY nodeapp/* /
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]
CMD ["docker", "run", "-p", "3001:3000", "my-node-app"]
