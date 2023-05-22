FROM node:alpine
WORKDIR '/app'
# Copy package.json first to avoid unnecessary npm installs
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Path: Dockerfile
# Compare this snippet from Dockerfile.dev:
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
