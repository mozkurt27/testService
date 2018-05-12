FROM frekele/debian:stable



#JDK openjdk-8

RUN apt-get update && \
    aprt-get install openjdk-8-jdk


#Jar AND Yaml

RUN mkdir /tmp/imageUploadMService
COPY ./GratisImageUploader-V1.0-launcher.jar /tmp/imageUploadMService/
COPY ./gratisImageUpload.yml /tmp/imageUploadMService/

#Environment Variables

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH


WORKDIR /tmp/imageUploadMService

EXPOSE 8080 8081

CMD java -jar GratisImageUploader-V1.0-launcher.jar server gratisImageUpload.yml
