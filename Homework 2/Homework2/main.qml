import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Date time")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            Rectangle {
                color: "#e5ecef"
                anchors.centerIn: parent
                radius: 5
                width: parent.width/4
                height: parent.height-30

                ButtonGroup{
                    id: radioGroup
                }

                Column{
                    id: userData
                    anchors.fill: parent
                    padding: 10
                    spacing: 35

                    TextField{
                        id: userName
                        placeholderText: "Имя"
                        width: parent.width/1.5
                        height: parent.height/20
                    }
                    RadioButton{
                        id: male
                        text: "Мужчина"
                        width: parent.width/2
                        height: parent.height/20
                        ButtonGroup.group: radioGroup
                            RadioButton{
                                id: woman
                                text: "Женщина"
                                anchors.left: male.right
                                width: parent.width
                                height: parent.height
                                ButtonGroup.group: radioGroup
                            }
                    }
                    TextField{
                        id: userAge
                        placeholderText: "Возраст"
                        width: parent.width/1.5
                        height: parent.height/20
                    }
                    Text {
                        id: aboutEducation
                        text: qsTr("Образование: ")
                        font.pointSize: height/2
                        width: parent.width/2
                        height: parent.height/20
                        ComboBox{
                            id: education
                            model: ["Среднее", "Среднее-специальное", "Высшее"]
                            anchors.left: aboutEducation.right
                            width: parent.width-20
                            height: parent.height
                        }
                    }

                    TextField{
                        id: userCity
                        placeholderText: "Город"
                        width: parent.width/1.5
                        height: parent.height/20
                    }

                    TextField{
                        id: userHobby
                        placeholderText: "Хобби"
                        width: parent.width/1.5
                        height: parent.height/8
                    }
                    TextField{
                        id: userInfo
                        placeholderText: "О себе"
                        width: parent.width/1.5
                        height: parent.height/8
                    }
                }
            }
        }

        Page2Form {
            Rectangle {
                color: "#e5ecef"
                anchors.centerIn: parent
                radius: 5
                width: parent.width/4
                height: parent.height/2

                ButtonGroup{
                    id: radioGroup2
                }

                Column{
                    id: partnerData
                    anchors.fill: parent
                    padding: 10
                    spacing: 35

                    TextField{
                        id: partnerAge
                        placeholderText: "Возрастные границы"
                        width: parent.width/1.5
                        height: parent.height/10
                    }
                    RadioButton{
                        id: partnerMale
                        text: "Мужчина"
                        width: parent.width/2
                        height: parent.height/10
                        ButtonGroup.group: radioGroup2
                            RadioButton{
                                id: partnerWoman
                                text: "Женщина"
                                anchors.left: partnerMale.right
                                width: parent.width
                                height: parent.height
                                ButtonGroup.group: radioGroup2
                            }
                    }
                    Text {
                        id: aboutPartnerEducation
                        text: qsTr("Образование: ")
                        font.pointSize: height/2
                        width: parent.width/2
                        height: parent.height/10
                        ComboBox{
                            id: partnerEducation
                            model: ["Среднее", "Среднее-специальное", "Высшее"]
                            anchors.left: aboutPartnerEducation.right
                            width: parent.width-20
                            height: parent.height
                        }
                    }
                }
                Button{
                    id: registrationButton
                    text: "Зарегистрировать"
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    height: parent.height/8
                    width: parent.width/2.5
                    onClicked: {
                        console.log("Информация о вас: ")
                        console.log("Ваше имя: ", userName.text)
                        console.log("Ваш возраст: ", userAge.text)
                        if (male.checked)
                            console.log("Ваш пол: Мужчина")
                        else
                            console.log("Ваш пол: Женщина")
                        console.log("Ваше образование: ", education.currentText)
                        console.log("Ваш город: ", userCity.text)
                        console.log("Ваши хобби: ", userHobby.text)
                        console.log("Что вы рассказали о себе: ", userInfo.text)

                        console.log("Пожелания для партнёра: ")
                        console.log("Желаемый возраст: ", partnerAge.text)
                        if(partnerMale.checked)
                            console.log("Пол: Мужчина")
                        else
                            console.log("Пол: Женщина")
                        console.log("Образование: ", partnerEducation.currentText)

                    }
                }
            }
        }
    }


    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("О себе")
        }
        TabButton {
            text: qsTr("О партнёре")
        }
    }
}
