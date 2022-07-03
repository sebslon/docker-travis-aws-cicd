# Multi Step Process
# (as) Tagging a phase of the workflow
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# Copy --from (from another phase) to ...
COPY --from=builder /app/build /usr/share/nginx/html

# docker run -p 3000:80 <image_id>