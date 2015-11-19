FROM        perl:5.22
MAINTAINER  Alex Valuyskiy olval@ciklum.com

RUN cpanm Mojolicious
RUN cpanm common::sense

RUN cachebuster=cb89cc2 git clone https://github.com/ravengerUA/fantlab_bookcases.git
RUN cd fantlab_bookcases

EXPOSE 3000

WORKDIR fantlab_bookcases
CMD morbo script/fantlab_bookcases -l http://*:3000