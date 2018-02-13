FROM node:9.5-stretch

RUN apt-get update && apt-get install -y libusb-1.0-0-dev libudev-dev libopenzwave1.5-dev
COPY . /src

WORKDIR /src

RUN yarn

ENTRYPOINT ["/src/docker/docker-entrypoint.sh"]
CMD ["npm", "start"]
