FROM eclipse-temurin:21-jdk-jammy

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

COPY start.sh /minecraft/start.sh
COPY stop.sh /minecraft/stop.sh

RUN chmod +x start.sh stop.sh

CMD ["./start.sh"]

