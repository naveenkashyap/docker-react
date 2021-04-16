# stage 0: build phase
FROM node:alpine
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# step 1: run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
