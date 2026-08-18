# Stage 1: Build dependencies
FROM node:18 AS build

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy source code
COPY . .

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /usr/src/app

# Copy only necessary files from build stage
COPY --from=build /usr/src/app .

EXPOSE 5000

CMD ["node", "index.js"]

