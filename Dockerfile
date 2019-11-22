FROM osrm/osrm-backend:latest
ENV MAP belarus-latest

ADD http://download.geofabrik.de/europe/${MAP}.osm.pbf /data/${MAP}.osm.pbf
#COPY car.lua /opt/car.lua
RUN osrm-extract -p /opt/car.lua /data/${MAP}.osm.pbf
RUN osrm-partition /data/${MAP}.osrm
RUN osrm-customize /data/${MAP}.osrm

CMD osrm-routed --algorithm mld /data/${MAP}.osrm  --max-matching-size 3000

