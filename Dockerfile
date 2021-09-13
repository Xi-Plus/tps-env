FROM ubuntu:18.04
# RUN git clone --depth 1 https://github.com/ioi-2017/tps.git &&
# 	cd tps &&
# 	./install-tps.sh
RUN wget https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb &&
	dpkg -i pandoc-2.10.1-1-amd64.deb
RUN add-apt-repository ppa:jonathonf/texlive-2019 &&
	apt-get update &&
	apt-get install texlive-xetex
RUN mkdir -p /usr/share/fonts/opentype/noto
RUN wget -nv https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK-Regular.ttc.zip
RUN unzip NotoSansCJK-Regular.ttc.zip -d NotoSansCJK-Regular
RUN cp NotoSansCJK-Regular/NotoSansCJK-Regular.ttc /usr/share/fonts/opentype/noto
RUN wget -nv https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK-Bold.ttc.zip
RUN unzip NotoSansCJK-Bold.ttc.zip -d NotoSansCJK-Bold
RUN cp NotoSansCJK-Bold/NotoSansCJK-Bold.ttc /usr/share/fonts/opentype/noto
RUN fc-cache -f -v
RUN apt-get install poppler-utils dos2unix python3-setuptools
RUN python3 -m pip install psutil
