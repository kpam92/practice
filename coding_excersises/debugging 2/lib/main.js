import { getNumberFact } from './feedback';
import { mathProblem, evaluateAnswer } from './math-problem';

document.addEventListener('DOMContentLoaded', () => {
  // Get a Number Fact and set its number-fact innerHTML while keeping it hidden
  getNumberFact();

  // add evaluateAnswer callback to the form
  const mathForm = document.getElementById('math-form');
  mathForm.addEventListener('submit', evaluateAnswer);
});
