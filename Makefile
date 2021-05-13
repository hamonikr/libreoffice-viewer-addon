all: clean copyfiles

copyfiles:
	@echo "==="
	@echo "Install files for Viewer"
	@echo "==="

	sudo cp -v usr/local/sbin/libreoffice-viewer /usr/local/sbin/libreoffice-viewer

	sudo mkdir -p /usr/share/doc/libreoffice-viewer
	sudo cp -v usr/share/doc/libreoffice-viewer/empty.* /usr/share/doc/libreoffice-viewer/

	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/menubar/menubar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/menubar/menubar-view.xml
	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/toolbar/standardbar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/toolbar/standardbar-view.xml
	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/menubar/menubar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/menubar/menubar-view.xml
	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/toolbar/standardbar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/toolbar/standardbar-view.xml
	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/menubar/menubar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/menubar/menubar-view.xml
	sudo cp -v usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/toolbar/standardbar-view.xml /usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/toolbar/standardbar-view.xml

	sudo cp -v usr/share/applications/libreoffice-calc-viewer.desktop /usr/share/applications/libreoffice-calc-viewer.desktop		
	sudo cp -v usr/share/applications/libreoffice-impress-viewer.desktop /usr/share/applications/libreoffice-impress-viewer.desktop	
	sudo cp -v usr/share/applications/libreoffice-writer-viewer.desktop /usr/share/applications/libreoffice-writer-viewer.desktop

	@echo "==="
	@echo "Change MIME type"
	@echo "==="
	sudo cp -v /usr/share/applications/defaults.list /usr/share/applications/defaults.list.orig
	sudo sed -i 's/libreoffice-calc.desktop/libreoffice-calc-viewer.desktop;libreoffice-calc.desktop/g' /usr/share/applications/defaults.list
	sudo sed -i 's/libreoffice-impress.desktop/libreoffice-impress-viewer.desktop;libreoffice-impress.desktop/g' /usr/share/applications/defaults.list
	sudo sed -i 's/libreoffice-writer.desktop/libreoffice-writer-viewer.desktop;libreoffice-writer.desktop/g' /usr/share/applications/defaults.list		

	# mime type update
	sudo update-mime-database /usr/share/mime
 
	# application db update
	sudo update-desktop-database /usr/share/applications

clean:
	@echo "==="
	@echo "Clean previous files"
	@echo "==="

	sudo rm -fv /usr/local/sbin/libreoffice-viewer
	sudo rm -frv /usr/share/doc/libreoffice-viewer

	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/menubar/menubar-view.xml
	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/scalc/toolbar/standardbar-view.xml
	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/menubar/menubar-view.xml
	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/simpress/toolbar/standardbar-view.xml
	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/menubar/menubar-view.xml
	sudo rm -fv /usr/lib/libreoffice/share/config/soffice.cfg/modules/swriter/toolbar/standardbar-view.xml

	sudo rm -fv /usr/share/applications/libreoffice-calc-viewer.desktop		
	sudo rm -fv /usr/share/applications/libreoffice-impress-viewer.desktop	
	sudo rm -fv /usr/share/applications/libreoffice-writer-viewer.desktop			

	sudo mv -v /usr/share/applications/defaults.list.orig /usr/share/applications/defaults.list || true