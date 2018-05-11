FROM node:alpine
MAINTAINER Kylie Tse "kylie.kale923@gmail.com"

# Set version when swagger-ui is updated
ENV VERSION "v2.2.8"
ENV FOLDER "swagger-ui-2.2.8"
ENV API_URL "http://petstore.swagger.io/v2/swagger.json"
ENV API_KEY "**None**"
ENV OAUTH_CLIENT_ID "**None**"
ENV OAUTH_CLIENT_SECRET "**None**"
ENV OAUTH_REALM "**None**"
ENV OAUTH_APP_NAME "**None**"
ENV OAUTH_ADDITIONAL_PARAMS "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 80

WORKDIR /app

RUN apk add --no-cache openssl
RUN wget -qO- https://github.com/swagger-api/swagger-ui/archive/$VERSION.tar.gz | tar xvz
RUN cp -r $FOLDER/dist/* . && rm -rf $FOLDER
RUN npm install -g http-server
RUN apk del openssl

ADD run.sh run.sh

# webserver port
EXPOSE 80

CMD ["sh", "run.sh"]
