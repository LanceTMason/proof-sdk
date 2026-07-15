FROM node:20-bookworm-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 make g++ ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
CMD ["npm", "run", "serve"]