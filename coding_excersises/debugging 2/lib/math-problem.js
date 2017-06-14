import { renderFeedback } from './feedback';

const getRandNum = () => {
  Math.floor((Math.random() * 10) + 1);
}

const getRandSymbol = () => {
  const randNum = Math.random();
  if (randNum < 0.33) {
    return "+";
  } else if (randNum >= 0.33 && randNum < 0.66) {
    return "-";
  } else {
    return "*";
  }
};

const mathProblem = {
  firstNum: getRandNum(),
  secondNum: getRandNum(),
  operationSymbol: getRandSymbol(),
  answer: () => {
    eval(`${this.firstNum} ${this.operationSymbol} ${this.secondNum}`);
  },
};

// Use the mathProblem obj to display the problem for the user
const firstDisplayNum = document.getElementById('first-num');
firstDisplayNum.innerHTML = mathProblem.firstNum;
const displaySymbol = document.getElementById('operation');
displaySymbol.innerHTML = mathProblem.operationSymbol;
const secondDisplayNum = document.getElementById('second-num');
secondDisplayNum.innerHTML = mathProblem.secondNum;

const evaluateAnswer = (event) => {
  const userAnswer = event.currentTarget.children[5].value;
  renderFeedback(userAnswer === mathProblem.answer());
}

export { mathProblem, evaluateAnswer };
