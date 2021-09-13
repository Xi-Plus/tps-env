FROM ubuntu:18.04
RUN git clone --depth 1 https://github.com/ioi-2017/tps.git &&
	./tps/install-tps.sh &&
	wget https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb &&
	dpkg -i pandoc-2.10.1-1-amd64.deb &&
	add-apt-repository ppa:jonathonf/texlive-2019 &&
	apt-get update &&
	apt-get install texlive-xetex &&
	mkdir -p /usr/share/fonts/opentype/noto &&
	wget -nv https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK-Regular.ttc.zip &&
	unzip NotoSansCJK-Regular.ttc.zip -d NotoSansCJK-Regular &&
	cp NotoSansCJK-Regular/NotoSansCJK-Regular.ttc /usr/share/fonts/opentype/noto &&
	wget -nv https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK-Bold.ttc.zip &&
	unzip NotoSansCJK-Bold.ttc.zip -d NotoSansCJK-Bold &&
	cp NotoSansCJK-Bold/NotoSansCJK-Bold.ttc /usr/share/fonts/opentype/noto &&
	fc-cache -f -v &&
	apt-get install poppler-utils &&
	apt-get install dos2unix python3-setuptools &&
	python3 -m pip install psutil
