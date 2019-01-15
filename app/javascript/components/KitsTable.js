import React from 'react';
import PropTypes from 'prop-types';

import Rails from 'rails-ujs';
import ReactTable from 'react-table';
import 'react-table/react-table.css';

class KitsTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      loading: true
    };

    this.checkAll = this.checkAll.bind(this);
    this.checkChecks = this.checkChecks.bind(this);
    this.checkKit = this.checkKit.bind(this);
    this.fetchData = this.fetchData.bind(this);
    this.uncheckCheckAll = this.uncheckCheckAll.bind(this);

    this.checkChecks();
  }

  checkAll() {
    const checked = document.getElementById('checkAll').checked;

    document.querySelectorAll('.checkKit').forEach((checkbox) => {
      checkbox.checked = checked;
    });

    this.checkChecks();
  }

  checkChecks() {
    document.querySelectorAll('.create-export-form input[name="export[kit_ids][]"]').forEach((item) => {
      item.remove();
    });

    const button = document.querySelectorAll('.export-selected');
    const selectedItems = document.querySelectorAll('.checkKit:checked');

    if (selectedItems.length > 0) {
      button.forEach((b) => { b.classList.remove('is-hidden') });

      document.querySelectorAll('.create-export-form').forEach((form) => {
        selectedItems.forEach((item) => {
          let checkbox = document.createElement('input');
          checkbox.type = 'hidden';
          checkbox.name = 'export[kit_ids][]';
          checkbox.value = item.value;
          form.appendChild(checkbox);
        });
      });
    } else {
      button.forEach((b) => { b.classList.add('is-hidden') });
    }
  }

  checkKit() {
    this.uncheckCheckAll();
    this.checkChecks();
  }

  fetchData(state, instance) {
    this.setState({
      loading: true
    });

    let that = this;
    Rails.ajax({
      type: 'GET',
      url: '/kits.json',
      error: () => {
        alert('Произошла ошибка при загрузке данных!');
      },
      success: (response) => {
        that.setState({
          data: response,
          loading: false
        });
      }
    });
  }

  uncheckCheckAll() {
    document.getElementById('checkAll').checked = false;
  }

  render() {
    const { data, loading } = this.state;

    const defaultFilterMethod = (filter, row, column) => {
      const id = filter.pivotId || filter.id;
      return row[id] !== undefined ? String(row[id]).includes(filter.value) : true;
    };

    return (
      <div data-controller="kits">
        <ReactTable
          className="-striped -highlight"
          columns={[
            {
              Header: () => (
                <strong>Артикул</strong>
              ),
              accessor: 'article',
              width: 92
            },
            {
              Header: () => (
                <strong>Год</strong>
              ),
              accessor: 'year',
              width: 72
            },
            {
              Header: () => (
                <strong>Наименование</strong>
              ),
              accessor: 'name'
            },
            {
              Header: () => (
                <strong>Масштаб</strong>
              ),
              accessor: 'scale.name',
              width: 103
            },
            {
              Cell: (row) => (
                <span className="is-monospaced">{row.value}</span>
              ),
              Header: () => (
                <strong>Штрихкод</strong>
              ),
              accessor: 'barcode',
              width: 150
            },
            {
              Cell: row => (
                <a href={`/kits/${row.original.id}/edit`}>редактировать</a>
              ),
              filterable: false,
              resizable: false,
              sortable: false,
              width: 140
            },
            {
              Cell: row => (
                <a className="has-text-danger" href={`/kits/${row.original.id}`} rel="nofollow"
                   data-confirm="Вы уверены?" data-method="delete">
                  удалить
                </a>
              ),
              filterable: false,
              resizable: false,
              sortable: false,
              width: 85
            },
            {
              Cell: row => (
                <input type="checkbox" value={row.original.id} className="checkKit" onClick={this.checkKit}/>
              ),
              Header: row => (
                <input id="checkAll" type="checkbox" onClick={this.checkAll}/>
              ),
              filterable: false,
              resizable: false,
              sortable: false,
              width: 25
            }
          ]}
          data={data}
          defaultFilterMethod={defaultFilterMethod}
          filterable={true}
          loading={loading}
          loadingText="загружается..."
          minRows={0}
          noDataText="Ничего не найдено"
          onFetchData={this.fetchData}
          pageSize={data.length}
          showPagination={false}
        />
      </div>
    );
  }
}

KitsTable.propTypes = {
  kits: PropTypes.arrayOf(PropTypes.object)
};

export default KitsTable;
