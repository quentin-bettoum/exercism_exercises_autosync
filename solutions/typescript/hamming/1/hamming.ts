export function compute(left: string, right: string): number {
  if (left.length !== right.length) {
    throw new Error('DNA strands must be of equal length.')
  }

  return zip([...left], [...right]).reduce((acc, [a, b]) => acc + (a !== b ? 1 : 0), 0)
}

function zip<A, B>(a: A[], b: B[]): [A, B][] {
  return a.map((val, index) => [val, b[index]])
}
