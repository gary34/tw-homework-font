FROM node AS compile
ADD . /app
WORKDIR /app

RUN npm run build

FROM nginx:alpine
COPY --from=compile /app/dist /usr/share/nginx/html
expose 80
