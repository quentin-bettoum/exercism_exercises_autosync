type OldScore = { [key: string]: string[] }
type NewScore = { [key: string]: number }

export function transform(scores: OldScore): NewScore {
  const newscore: NewScore = {}

  for (const [points, letters] of Object.entries(scores)) {
    for (const letter of letters) {
      newscore[letter.toLowerCase()] = Number(points)
    }
  }

  return newscore
}

// NOTE: In a more functional way
export function transform2(scores: OldScore): NewScore {
  return Object.fromEntries(
    Object.entries(scores).flatMap(([points, letters]) =>
      letters.map(letter => [letter.toLowerCase(), Number(points)])
    )
  )
}
