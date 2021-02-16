FROM openjdk:8-jre-alpine

ENV _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

RUN apk --update --no-cache add openssl \
                                ca-certificates 

RUN adduser -D burp burp

COPY burpsuite_community_v2020.12.1.jar /home/kali/Desktop/Burp_Docker/

USER burp

WORKDIR /home/burp

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "burpsuite_community.jar"]
