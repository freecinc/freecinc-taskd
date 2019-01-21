FROM alpine

RUN apk update && apk add taskd

RUN mkdir -p /app
WORKDIR /app
ADD startup.sh /app/
EXPOSE 53589
CMD sh startup.sh
