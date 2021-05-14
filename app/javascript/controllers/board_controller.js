import { Controller } from 'stimulus'

export default class BoardController extends Controller {
  static targets = ['guess', 'inputBall']

  chooseColor(event) {
    const inputBall = event.target
    const color = inputBall.dataset.color
    const emptyGuess = this._firstEmptyGuess()

    if (emptyGuess) {
      this._emptyColor(inputBall, color)
      this._fillColor(emptyGuess, color)
    }
  }

  removeGuess(event) {
    const guessBall = event.target
    const color = guessBall.dataset.color
    const guessBallHasColor = !!color
    if (guessBallHasColor) {
      this._emptyColor(guessBall, color)
      this._fillColor(this._firstEmptyInputBall(), color)
    }
  }

  _emptyColor(elem, previousColor) {
    elem.classList.remove(`ball--${previousColor}`)
    elem.classList.add('ball--empty')
    elem.dataset.color = ''
    if (elem.nextElementSibling) {
      elem.nextElementSibling.value = ''
    }
  }

  _fillColor(elem, color) {
    elem.classList.add(`ball--${color}`)
    elem.classList.remove('ball--empty')
    elem.dataset.color = color
    if (elem.nextElementSibling) {
      elem.nextElementSibling.value = color
    }
  }

  _firstEmptyGuess() {
    return this.guessTargets.find((guessElem) => !guessElem.dataset.color)
  }

  _firstEmptyInputBall() {
    return this.inputBallTargets.find((inputElem) => !inputElem.dataset.color)
  }
}
