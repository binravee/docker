FROM node:alpine
#above as builder is a tagging
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder  /app/build /usr/share/nginx/html
