#include <QApplication>
#include <QWebView>
#include <QDesktopWidget>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
	QWebView *view = new QWebView();
	view->load(QUrl("qrc:/index.html"));
	view->setWindowTitle("MPTabs");
	QRect screenGeometry = QApplication::desktop()->screenGeometry();
	view->resize((screenGeometry.width()/4)*3,(screenGeometry.height()/4)*3);
	view->move(screenGeometry.width()/8,screenGeometry.height()/8);
	view->setContextMenuPolicy(Qt::PreventContextMenu);
	view->show();
    return app.exec();
}