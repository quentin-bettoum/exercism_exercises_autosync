export const square = (nbr: number): bigint => {
  if (nbr < 1 || nbr > 64) {
    throw new Error('The requested square must be between 1 and 64 (inclusive)')
  }

  return BigInt(2 ** (nbr - 1))
}

export const total = (): bigint => BigInt(2 ** 64) - 1n
