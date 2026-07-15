FROM node:20-bookworm-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 make g++ ca-certificates \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
# The server statically serves only public/; expose the built editor bundle there.
RUN cp -r dist/assets/. public/assets/
CMD ["npm", "run", "serve"]