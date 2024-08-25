FROM oven/bun:latest

WORKDIR /app

COPY package.json bun.lockb /app/
COPY . /app
RUN bun install
EXPOSE 3000
CMD ["bun", "run", "start"]
