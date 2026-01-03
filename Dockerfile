FROM python:3.13.10-slim 

RUN apt-get update && apt-get install gcc python3-dev wireless-tools -y && apt-get clean

RUN mkdir -p /app/config
RUN mkdir -p /app/host

ENV YES_YOU_ARE_IN_A_CONTAINER=True

COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt

COPY src/ /app/
RUN chmod a+x /app/bin/system_sensors.sh

CMD ["/app/bin/system_sensors.sh"]
