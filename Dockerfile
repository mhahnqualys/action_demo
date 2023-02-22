FROM ubuntu:latest

RUN adduser --disabled-password appuser
WORKDIR /home/appuser
USER appuser

CMD echo "my ubuntu container at " $(date)