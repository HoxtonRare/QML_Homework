#include "table.h"

Table::Table(QObject *parent) : QAbstractTableModel(parent)
{
}
int Table::rowCount(const QModelIndex& /*index*/) const
{
    return m_data.size();
}
int Table::columnCount(const QModelIndex& /*index*/) const
{
    return 1;
}
QVariant Table::data(const QModelIndex &index, int role) const
{
    const int row{ index.row() };
    if (row >= 0 && row < (int)m_data.size()) {
        if (role == TableRoles::IdRole)
            return m_data[row].id;
        if (role == TableRoles::NameRole)
            return m_data[row].name;
        if (role == TableRoles::SurnameRole)
            return m_data[row].surname;
        if (role == TableRoles::FriendsRole)
            return m_data[row].friends;
        if (role == Qt::DisplayRole) {
            const int col{ index.column() };
            if (col == 0)
                return m_data[row].id;
            if (col == 1)
                return m_data[row].name;
            if (col == 2)
                return m_data[row].surname;
        }
    }
    return QVariant();
}
QHash<int, QByteArray> Table::roleNames() const
{
    return {
        {TableRoles::IdRole, "rowId"},
        {TableRoles::NameRole, "name"},
        {TableRoles::SurnameRole, "surname"},
        {TableRoles::FriendsRole, "friends"}
    };
}
void Table::appendRowElement(const RowElement &element)
{
    QAbstractTableModel::beginInsertRows(QModelIndex(), m_data.size(), m_data.size() + 1);
        m_data.push_back(element);
    QAbstractTableModel::endInsertRows();
}
