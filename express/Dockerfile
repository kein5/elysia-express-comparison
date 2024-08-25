FROM oven/bun:latest

WORKDIR /app

COPY package.json bun.lockb /app/
COPY . /app
RUN bun install
EXPOSE 3001
CMD ["bun", "run", "start"]
