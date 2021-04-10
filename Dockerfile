FROM openjdk:8
ADD target/ROOT.jar ROOT.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "ROOT.jar"]