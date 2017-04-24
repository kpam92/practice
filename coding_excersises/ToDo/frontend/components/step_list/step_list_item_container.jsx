import { connect } from 'react-redux';
import StepListItem from './step_list_item';
// Actions
import { receiveStep, removeStep, destroyStep, createStep, updateStep } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { step }) => ({
  removeStep: () => dispatch(removeStep(step)),
  receiveStep: step => dispatch(receiveStep(step)),
  destroyStep: () => dispatch(destroyStep(step)),
  createStep: step => dispatch(createStep(step)),
  updateStep: step => dispatch(updateStep(step))


});

export default connect(
  null, // step prop is already passed in
  mapDispatchToProps
)(StepListItem);
