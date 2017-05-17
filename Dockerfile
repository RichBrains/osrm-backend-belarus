FROM osrm/osrm-backend
ENV MAP belarus-latest

ADD http://download.geofabrik.de/europe/${MAP}.osm.pbf /data/${MAP}.osm.pbf
RUN osrm-extract -p /opt/car.lua /data/${MAP}.osm.pbf
RUN osrm-contract /data/${MAP}.osrm

CMD osrm-routed /data/${MAP}.osrm

