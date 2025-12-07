export const eggCount = (displayValue: number): number => {
  return displayValue.toString(2).split('').filter(i => i === '1').length
}
