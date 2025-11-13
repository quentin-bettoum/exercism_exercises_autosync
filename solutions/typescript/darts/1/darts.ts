export function score(x: number, y: number): number {
  const euclidean_distance = Math.hypot(x, y)

  if (euclidean_distance <= 1) return 10
  else if (euclidean_distance <= 5) return 5
  else if (euclidean_distance <= 10) return 1
  return 0
}
