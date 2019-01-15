import React from 'react';
import PropTypes from 'prop-types';

class KitRow extends React.Component {
  render () {
    return (
      <tr>
        <td className="kits__article"><a href={`/kits/${this.props.kit.id}`}>{this.props.kit.article}</a></td>
        <td className="kits__year">{this.props.kit.year}</td>
        <td>{this.props.kit.name}</td>
        <td className="kits__scale">{this.props.kit.scale}</td>
        <td className="is-monospaced kits__barcode">{this.props.kit.barcode}</td>

        <td><a href={`/kits/${this.props.kit.id}/edit`}>редактировать</a></td>
        <td>
          <a href={`/kits/${this.props.kit.id}`} rel="nofollow" className="has-text-danger" data-confirm="Вы уверены?" data-method="delete">
            удалить
          </a>
        </td>
        <td></td>
      </tr>
    );
  }
}

KitRow.propTypes = {
  kit: PropTypes.object
};

export default KitRow;
