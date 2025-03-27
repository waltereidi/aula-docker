# Debian
FROM debian:12.6-slim
ARG USERNAME
ARG UID
ARG GID
ARG GITREPOSBACKPARAM
ARG GITREPOSFRONTPARAM


# Basic setup
RUN apt update && apt upgrade -y
RUN apt install -y sudo nano zip
RUN apt install -y sudo nano zip git
RUN apt install -y sudo unzip 
RUN apt install -y sudo libzip-dev
RUN apt install -y sudo wget

# Usando a imagem oficial do Python 3.9
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

FROM python:3.9

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt


#Dependencias 


COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh
ENV PYTHONPATH=/app
RUN mkdir /var/www

WORKDIR /var/www/
####
COPY /start.sh /start.sh

RUN chmod +x /start.sh
#RUN sudo chown -R $USERNAME:$USERNAME /var/www 
#RUN sudo chmod 777 -R /var/www

# Definir variáveis de ambiente

CMD ["python", "app.py"]
ENTRYPOINT ["/start.sh"]
