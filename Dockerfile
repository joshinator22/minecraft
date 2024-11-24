FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/docker/minecraft

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

COPY server.jar /minecraft/server.jar

#RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/45810d238246d90e811d896f87b14695b7fb6839/server.jars

RUN echo "eula=true" > eula.txt

VOLUME [ "/home/docker/minecraft" ]

EXPOSE 25565

ENTRYPOINT [ "java" ] 

CMD ["-Xmx12288M", "-Xms12288Ms", "-jar", "server.jar", "nogui" ]
