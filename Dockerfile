FROM hao3039032/skynet:release-1.1.0
RUN apk add make openssl unzip curl \
&& curl -SL http://luarocks.github.io/luarocks/releases/luarocks-3.0.4.tar.gz | tar -xzC /opt/ && cd /opt/luarocks-3.0.4 \
&& ./configure --prefix=/opt/skynet/rocks --lua-version=5.3 --with-lua-bin=/opt/skynet/3rd/lua --with-lua-include=/opt/skynet/3rd/lua --with-lua-lib=/opt/skynet/3rd/lua \
&& make && make install && ln -s /opt/skynet/rocks/bin/luarocks /opt/skynet/luarocks
COPY ./config-5.3.lua /opt/skynet/rocks/etc/luarocks/config-5.3.lua
COPY ./config.path /opt/skynet/examples/config.path