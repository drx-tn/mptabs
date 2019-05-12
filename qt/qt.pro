QT += webenginewidgets
TARGET = mptabs
TEMPLATE = app
SOURCES += main.cpp
CONFIG += c++11
RESOURCES += mptabs.qrc

win32 {
	RC_FILE = windows/windows.rc
}

unix:!macx {
	target.path = /opt/mptabs/
	icon.files = linux/mptabs.png
	icon.path = /usr/share/pixmaps/
	shortcutfile.files += linux/mptabs.desktop
	shortcutfile.path = /usr/share/applications/
	INSTALLS += target
	INSTALLS += icon
	INSTALLS += shortcutfile
}

macx:ICON=osx/mptabs.icns
