FROM node:20-alpine as build-step
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build -- --output-path=./dist/out



FROM nginx as prod
COPY --from=build-step /app/dist/out/ /usr/share/nginx/html
