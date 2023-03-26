#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>
#include "table.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    Table model;
    model.appendRowElement(Table::RowElement{1, "Александр", "Иванов", {"Василий Иванов", "Степан Степанов"}});
    model.appendRowElement(Table::RowElement{2, "Илья", "Шишкин", {"Дмитрий Васильев","Игнат Афанасьев"}});
    model.appendRowElement(Table::RowElement{3, "Акакий", "Дмитриев", {"Павел Загребняк"}});
    engine.rootContext()->setContextProperty("mdl", &model);

    engine.load(url);
    return app.exec();
}
