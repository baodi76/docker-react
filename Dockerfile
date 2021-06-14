#BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#RUN PHASE
FROM  nginx
#nothing for local test but aws elastic beanstalk will use it map
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html