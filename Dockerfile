FROM        perl:5.22
MAINTAINER  Alex Valuyskiy olval@ciklum.com

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Mojocilious common::sense

RUN cachebuster=fb9409a git clone https://github.com/ravengerUA/fantlab_bookcases.git
RUN cd fantlab_bookcases && carton install --deployment

EXPOSE 8080

WORKDIR fantlab_bookcases
CMD morbo script/fantlab_bookcases -l http://*:8080