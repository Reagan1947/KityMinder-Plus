FROM pierrezemb/gostatic
COPY . /srv/http/
RUN  npm i -g wr && npm install -g less && npm install -g grunt && npm install -g bower && bower install && npm install
CMD ["-port","8080","-https-promote", "-enable-logging"]
