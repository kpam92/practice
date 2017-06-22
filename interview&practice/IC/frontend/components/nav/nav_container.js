import Nav from './nav';
import { connect } from 'react-redux';

import { updateFilter, removeFilter } from '../../actions/filter_actions';

//
// const mapStateToProps = state => ({
//   locations: allLocations(state),
//   filters: state.filters,
//   movie: state.detail
// })

const mapDispatchToProps = dispatch => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value)),
  removeFilter: (filter) => dispatch(removeFilter(filter))
});

export default connect(
  null,
  mapDispatchToProps
)(Nav);
