# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

ARG NODE_VERSION=24.13.0

FROM node:${NODE_VERSION}-alpine AS development
WORKDIR /app
COPY package*.json ./
RUN npm install glob rimraf
RUN npm install --only=development
COPY . .
RUN npm run build

FROM node:${NODE_VERSION}-alpine AS production
WORKDIR /app

# ENV DATABASE_URL=postgres://postgres:postgres@host.docker.internal:5432/auth-test
# ENV JWT_ACCESS_KEY=i9\9!zL9Gc~v
# ENV JWT_REFRESH_KEY=4<8m031%*ZsY

COPY package*.json ./
RUN npm install --only=production
COPY . .
COPY --from=development /app/dist ./dist
EXPOSE 8000
CMD ["npm", "run", "start:prod"]