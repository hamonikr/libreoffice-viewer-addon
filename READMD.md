# libreoffice-viewer-addon

리브레 오피스 뷰어 전용 기능을 추가합니다.

# Install
프로그램을 적용하기 전 `libreoffice-7.0.4~rc2-1ubuntu0.20.04.2`패키지가 설치되어 있어야 합니다.

## libreoffice-7.0.4~rc2-1ubuntu0.20.04.2 설치
```
echo "deb [arch=amd64] https://pkg.hamonikr.org hanla upstream testing" | sudo tee -a /etc/apt/sources.list.d/hamonikr.list 
sudo apt update
sudo apt install -y libreoffice libreoffice-help-ko libreoffice-l10n-ko
```

## 뷰어 적용
```
git clone https://github.com/hamonikr/libreoffice-viewer-addon.git
cd libreoffice-viewer-addon
sudo make
```

# Customize menu and toolbar

## Calc 
* 메뉴 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/menubar/menubar-view.xml
* 툴바 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/toolbar/standardbar-view.xml

## Impress 
* 메뉴 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/menubar/menubar-view.xml
* 툴바 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/toolbar/standardbar-view.xml

## Writer
* 메뉴 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/menubar/menubar-view.xml
* 툴바 설정 : usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/toolbar/standardbar-view.xml

# TO-DO
 * 뷰어로 열린 문서 창에서 다른 파일을 상단 메뉴의 열기로 여는 경우, 편집 가능한 모드로 열리는 버그 수정 필요