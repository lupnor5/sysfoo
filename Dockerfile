FROM maven:3.9.6-eclipse-temurin-17-alpine AS BUILD 
WORKDIR /build
COPY . . 
RUN mvn package -DskipTests && \
    mv target/sysfoo*.jar /run/sysfoo.jar

FROM eclipse-temurin:17-jre-alpine
WORKDIR /run
COPY --from=BUILD /run/sysfoo*.jar sysfoo.jar
EXPOSE 8080 
CMD java -jar /run/sysfoo.jar
