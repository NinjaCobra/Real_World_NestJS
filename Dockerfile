FROM node:18-alpine AS dependencies
WORKDIR /usr/src/app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod

FROM node:18-alpine
WORKDIR /usr/src/app
COPY package.json dist ./
COPY --from=dependencies /usr/src/app/node_modules ./node_modules
EXPOSE 3000
CMD [ "node", "dist/main" ]
