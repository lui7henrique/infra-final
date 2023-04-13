FROM ubuntu
RUN apt-get update 
RUN apt install openjdk-11-jdk -y
WORKDIR pasta
COPY . .
RUN ["javac", "HelloWorld.java"]

ENTRYPOINT ["java", "HelloWorld" ]