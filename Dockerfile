FROM ubuntu:18.04 
RUN  apt update -y && apt install openjdk-8-jre openjdk-8-jdk maven -y
WORKDIR /app
ADD . /app
RUN ls
RUN mvn clean install 
ENTRYPOINT ["java","-jar","target/app1-1.0.war"]