import { connect } from 'react-redux';
import StepListItem from './step_list_item';
// Actions
import { receiveStep, removeStep, deleteStep, createStep } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { step }) => ({
  removeStep: () => dispatch(removeStep(step)),
  receiveStep: step => dispatch(receiveStep(step)),
  deleteStep: () => dispatch(deleteStep(step)),
  createStep: step => dispatch(createStep(step))


});

export default connect(
  null, // step prop is already passed in
  mapDispatchToProps
)(StepListItem);
