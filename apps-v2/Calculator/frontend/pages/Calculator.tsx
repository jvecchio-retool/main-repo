import { useState } from 'react'
import { Button } from '../lib/shadcn/button'
import { Card, CardContent, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Divide, Minus, Plus, X, Delete } from 'lucide-react'
import { cn } from '../lib/shadcn/utils'

export default function Calculator() {
  const [display, setDisplay] = useState('0')
  const [previousValue, setPreviousValue] = useState<number | null>(null)
  const [operation, setOperation] = useState<string | null>(null)
  const [shouldResetDisplay, setShouldResetDisplay] = useState(false)

  const handleNumber = (num: string) => {
    if (shouldResetDisplay) {
      setDisplay(num)
      setShouldResetDisplay(false)
    } else {
      setDisplay(display === '0' ? num : display + num)
    }
  }

  const handleDecimal = () => {
    if (shouldResetDisplay) {
      setDisplay('0.')
      setShouldResetDisplay(false)
    } else if (!display.includes('.')) {
      setDisplay(display + '.')
    }
  }

  const handleOperation = (op: string) => {
    const currentValue = parseFloat(display)
    
    if (previousValue === null) {
      setPreviousValue(currentValue)
    } else if (operation) {
      const result = calculate(previousValue, currentValue, operation)
      setDisplay(String(result))
      setPreviousValue(result)
    }
    
    setOperation(op)
    setShouldResetDisplay(true)
  }

  const calculate = (prev: number, current: number, op: string): number => {
    switch (op) {
      case '+':
        return prev + current
      case '-':
        return prev - current
      case '*':
        return prev * current
      case '/':
        return prev / current
      default:
        return current
    }
  }

  const handleEquals = () => {
    if (operation && previousValue !== null) {
      const currentValue = parseFloat(display)
      const result = calculate(previousValue, currentValue, operation)
      setDisplay(String(result))
      setPreviousValue(null)
      setOperation(null)
      setShouldResetDisplay(true)
    }
  }

  const handleClear = () => {
    setDisplay('0')
    setPreviousValue(null)
    setOperation(null)
    setShouldResetDisplay(false)
  }

  const handleDelete = () => {
    if (display.length === 1) {
      setDisplay('0')
    } else {
      setDisplay(display.slice(0, -1))
    }
  }

  const handleSign = () => {
    const num = parseFloat(display)
    setDisplay(String(-num))
  }

  const handlePercent = () => {
    const num = parseFloat(display)
    setDisplay(String(num / 100))
  }

  return (
    <div className="min-h-screen bg-background flex items-center justify-center p-4">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="text-center">Calculator</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {/* Display */}
          <div className="bg-muted rounded-lg p-6 text-right">
            <div className="text-4xl font-mono font-semibold text-foreground break-all">
              {display}
            </div>
            {operation && previousValue !== null && (
              <div className="text-sm text-muted-foreground mt-2">
                {previousValue} {operation}
              </div>
            )}
          </div>

          {/* Buttons */}
          <div className="grid grid-cols-4 gap-2">
            {/* Row 1 */}
            <Button
              variant="secondary"
              onClick={handleClear}
              className="h-14 text-lg font-semibold"
            >
              AC
            </Button>
            <Button
              variant="secondary"
              onClick={handleDelete}
              className="h-14"
            >
              <Delete className="w-5 h-5" />
            </Button>
            <Button
              variant="secondary"
              onClick={handlePercent}
              className="h-14 text-lg font-semibold"
            >
              %
            </Button>
            <Button
              variant="default"
              onClick={() => handleOperation('/')}
              className={cn(
                "h-14 bg-primary text-primary-foreground hover:bg-primary/90",
                operation === '/' && "ring-2 ring-ring"
              )}
            >
              <Divide className="w-5 h-5" />
            </Button>

            {/* Row 2 */}
            <Button
              variant="outline"
              onClick={() => handleNumber('7')}
              className="h-14 text-lg font-semibold"
            >
              7
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('8')}
              className="h-14 text-lg font-semibold"
            >
              8
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('9')}
              className="h-14 text-lg font-semibold"
            >
              9
            </Button>
            <Button
              variant="default"
              onClick={() => handleOperation('*')}
              className={cn(
                "h-14 bg-primary text-primary-foreground hover:bg-primary/90",
                operation === '*' && "ring-2 ring-ring"
              )}
            >
              <X className="w-5 h-5" />
            </Button>

            {/* Row 3 */}
            <Button
              variant="outline"
              onClick={() => handleNumber('4')}
              className="h-14 text-lg font-semibold"
            >
              4
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('5')}
              className="h-14 text-lg font-semibold"
            >
              5
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('6')}
              className="h-14 text-lg font-semibold"
            >
              6
            </Button>
            <Button
              variant="default"
              onClick={() => handleOperation('-')}
              className={cn(
                "h-14 bg-primary text-primary-foreground hover:bg-primary/90",
                operation === '-' && "ring-2 ring-ring"
              )}
            >
              <Minus className="w-5 h-5" />
            </Button>

            {/* Row 4 */}
            <Button
              variant="outline"
              onClick={() => handleNumber('1')}
              className="h-14 text-lg font-semibold"
            >
              1
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('2')}
              className="h-14 text-lg font-semibold"
            >
              2
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('3')}
              className="h-14 text-lg font-semibold"
            >
              3
            </Button>
            <Button
              variant="default"
              onClick={() => handleOperation('+')}
              className={cn(
                "h-14 bg-primary text-primary-foreground hover:bg-primary/90",
                operation === '+' && "ring-2 ring-ring"
              )}
            >
              <Plus className="w-5 h-5" />
            </Button>

            {/* Row 5 */}
            <Button
              variant="outline"
              onClick={handleSign}
              className="h-14 text-lg font-semibold"
            >
              +/-
            </Button>
            <Button
              variant="outline"
              onClick={() => handleNumber('0')}
              className="h-14 text-lg font-semibold"
            >
              0
            </Button>
            <Button
              variant="outline"
              onClick={handleDecimal}
              className="h-14 text-lg font-semibold"
            >
              .
            </Button>
            <Button
              variant="default"
              onClick={handleEquals}
              className="h-14 bg-primary text-primary-foreground hover:bg-primary/90 text-lg font-semibold"
            >
              =
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
