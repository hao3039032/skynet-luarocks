FROM hao3039032/skynet:release-ubuntu-1.5.0
RUN apt-get update && apt-get install -y gcc curl make unzip autoconf \
&& curl -SL http://luarocks.github.io/luarocks/releases/luarocks-3.7.0.tar.gz | tar -xzC /opt/ && cd /opt/luarocks-3.7.0 \
&& ./configure --prefix=/opt/skynet/rocks --lua-version=5.4 --with-lua-bin=/opt/skynet/3rd/lua --with-lua-include=/opt/skynet/3rd/lua --with-lua-lib=/opt/skynet/3rd/lua --with-lua=/opt/skynet/3rd/lua \
&& make && make install && ln -s /opt/skynet/rocks/bin/luarocks /opt/skynet/luarocks 
COPY ./config-5.4.lua /opt/skynet/rocks/etc/luarocks/config-5.4.lua
COPY ./config.path /opt/skynet/examples/config.path