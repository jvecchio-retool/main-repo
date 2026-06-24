import { useState } from 'react'
import { Button } from '../lib/shadcn/button'
import { Card } from '../lib/shadcn/card'
import DarkModeToggle from '../components/DarkModeToggle'

type Operator = '+' | '-' | '×' | '÷'

export default function Calculator() {
  const [display, setDisplay] = useState('0')
  const [previous, setPrevious] = useState<number | null>(null)
  const [operator, setOperator] = useState<Operator | null>(null)
  const [waitingForOperand, setWaitingForOperand] = useState(false)

  const inputDigit = (digit: string) => {
    if (waitingForOperand) {
      setDisplay(digit)
      setWaitingForOperand(false)
    } else {
      setDisplay(display === '0' ? digit : display + digit)
    }
  }

  const inputDecimal = () => {
    if (waitingForOperand) {
      setDisplay('0.')
      setWaitingForOperand(false)
      return
    }
    if (!display.includes('.')) {
      setDisplay(display + '.')
    }
  }

  const clearAll = () => {
    setDisplay('0')
    setPrevious(null)
    setOperator(null)
    setWaitingForOperand(false)
  }

  const toggleSign = () => {
    if (display === '0') return
    setDisplay(display.startsWith('-') ? display.slice(1) : '-' + display)
  }

  const percent = () => {
    const value = parseFloat(display)
    setDisplay(String(value / 100))
  }

  const calculate = (a: number, b: number, op: Operator): number => {
    switch (op) {
      case '+': return a + b
      case '-': return a - b
      case '×': return a * b
      case '÷': return b === 0 ? NaN : a / b
    }
  }

  const performOperator = (nextOperator: Operator) => {
    const inputValue = parseFloat(display)

    if (previous === null) {
      setPrevious(inputValue)
    } else if (operator && !waitingForOperand) {
      const result = calculate(previous, inputValue, operator)
      setDisplay(formatResult(result))
      setPrevious(result)
    }

    setOperator(nextOperator)
    setWaitingForOperand(true)
  }

  const performEquals = () => {
    if (operator === null || previous === null) return
    const inputValue = parseFloat(display)
    const result = calculate(previous, inputValue, operator)
    setDisplay(formatResult(result))
    setPrevious(null)
    setOperator(null)
    setWaitingForOperand(true)
  }

  const formatResult = (n: number): string => {
    if (!isFinite(n) || isNaN(n)) return 'Error'
    // Trim long decimals
    const str = String(n)
    if (str.includes('.') && str.length > 12) {
      return n.toPrecision(10).replace(/\.?0+$/, '')
    }
    return str
  }

  const keyClass = 'h-14 text-lg font-medium'
  const funcClass = `${keyClass} bg-blue-200 text-blue-900 hover:bg-blue-300 dark:bg-blue-800 dark:text-blue-50 dark:hover:bg-blue-700`
  const numClass = `${keyClass} bg-blue-50 text-blue-900 border-blue-300 hover:bg-blue-100 dark:bg-blue-950 dark:text-blue-50 dark:border-blue-800 dark:hover:bg-blue-900`
  const opClass = `${keyClass} bg-blue-600 text-white hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-400`

  return (
    <div className="min-h-screen flex items-center justify-center bg-blue-50 dark:bg-blue-950 p-4">
      <Card className="w-full max-w-xs p-4 shadow-retool-lg bg-blue-100 border-blue-300 dark:bg-blue-900 dark:border-blue-700">
        <div className="flex justify-end mb-2">
          <DarkModeToggle />
        </div>
        <div
          className="mb-4 rounded-md bg-blue-900 text-blue-50 dark:bg-blue-950 dark:text-blue-100 px-4 py-5 text-right text-4xl font-semibold tabular-nums tracking-tight overflow-hidden"
          aria-live="polite"
        >
          {display}
        </div>
        <div className="grid grid-cols-4 gap-2">
          <Button variant="secondary" className={funcClass} onClick={clearAll}>AC</Button>
          <Button variant="secondary" className={funcClass} onClick={toggleSign}>+/-</Button>
          <Button variant="secondary" className={funcClass} onClick={percent}>%</Button>
          <Button className={opClass} onClick={() => performOperator('÷')}>÷</Button>

          <Button variant="outline" className={numClass} onClick={() => inputDigit('7')}>7</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('8')}>8</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('9')}>9</Button>
          <Button className={opClass} onClick={() => performOperator('×')}>×</Button>

          <Button variant="outline" className={numClass} onClick={() => inputDigit('4')}>4</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('5')}>5</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('6')}>6</Button>
          <Button className={opClass} onClick={() => performOperator('-')}>-</Button>

          <Button variant="outline" className={numClass} onClick={() => inputDigit('1')}>1</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('2')}>2</Button>
          <Button variant="outline" className={numClass} onClick={() => inputDigit('3')}>3</Button>
          <Button className={opClass} onClick={() => performOperator('+')}>+</Button>

          <Button variant="outline" className={`${numClass} col-span-2`} onClick={() => inputDigit('0')}>0</Button>
          <Button variant="outline" className={numClass} onClick={inputDecimal}>.</Button>
          <Button className={opClass} onClick={performEquals}>=</Button>
        </div>
      </Card>
    </div>
  )
}
