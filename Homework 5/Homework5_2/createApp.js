function createStartPage(primaryFrame) {
    var component;
    var sprite;

    component = Qt.createComponent("startPage.qml");
    sprite = component.createObject(primaryFrame);
}

function loadApp() {
    loader.sourceComponent = page1;
}

