# Stage 1: Build React app
FROM node:18 AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy build output to Nginx HTML folder
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Replace default Nginx config if needed
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

