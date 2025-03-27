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

RUN apt-get install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN # Install py39 from deadsnakes repository
RUN apt-get install python3.9
RUN apt-get install python3-pip

RUN mkdir /var/www

# Remover apache2
RUN apt remove apache2-bin apache2-data apache2-utils apache2 libapache2-mod-php8.2
RUN rm -rf /etc/apache2
RUN rm -rf /usr/sbin/apache2
RUN rm -rf /usr/lib/apache2
RUN rm -rf /usr/share/apache2
RUN apt autoremove && apt autoclean && apt clean all

# Nginx
RUN apt install nginx -y

# Docker user
RUN groupadd --gid $GID $USERNAME
RUN useradd --uid $UID --gid $GID -m $USERNAME
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

WORKDIR /var/www/
####
COPY docker/start.sh /

RUN sudo chmod +x /start.sh
RUN sudo chown -R $USERNAME:$USERNAME /var/www 
RUN sudo chmod 777 -R /var/www

# Definir variáveis de ambiente
ENV GITREPOSBACK=$GITREPOSBACKPARAM
ENV GITREPOSFRONT=$GITREPOSFRONTPARAM

ENTRYPOINT ["/start.sh"]
