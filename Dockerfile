FROM openjdk:8
EXPOSE 8761
ADD ./spring-petclinic-discovery-server/src/target/spring-petclinic-discovery-server-3.0.2.jar spring-petclinic-discovery-server-3.0.2.jar
ENTRYPOINT ["java","-jar","spring-petclinic-discovery-server-3.0.2.jar"]