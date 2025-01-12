FROM node:16.10.0 AS builder
COPY . .
RUN npm install -g npm@7.24.0
RUN npm install
RUN npx browserslist@latest --update-db
RUN npm run swizzle docusaurus-lunr-search SearchBar
RUN npm run build
EXPOSE 5000/tcp
CMD ["sh", "-l", "-c", "npm run serve -- --port 5000"]

#FROM nginx:latest
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY --from=builder /docs/build /usr/share/nginx/html