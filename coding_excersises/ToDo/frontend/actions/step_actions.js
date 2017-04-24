import * as StepAPIUtil from '../utils/step_api_util'
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receiveSteps = steps => ({
  type: RECEIVE_STEPS,
  steps
});

export const receiveStep = step => ({
  type: RECEIVE_STEP,
  step
});

export const removeStep = step => ({
  type: REMOVE_STEP,
  step
});


export const createStep = (todoId,step) => dispatch => (
  StepAPIUtil.createStep(todoId,step)
  .then(step => dispatch(receiveStep(step)))
);

export const fetchSteps = id => dispatch => (
  StepAPIUtil.fetchSteps(id).then(steps => dispatch(receiveSteps(steps)))
);

export const updateStep = step => dispatch => (
  StepAPIUtil.updateStep(step).then(step => dispatch(receiveStep(step)))
);

export const destroyStep = step => dispatch => (
  StepAPIUtil.deleteStep(step).then(step => dispatch(removeStep(step)))
);
