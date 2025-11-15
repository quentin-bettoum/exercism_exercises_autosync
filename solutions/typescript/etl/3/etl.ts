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

// export function transform(scores: OldScore): NewScore {
//   let newscore: NewScore = {}

//   return Object.entries(scores).reduce(
//     (acc, [points, letters]) =>
//       letters.reduce((acc, letter) => {
//         acc[letter.toLowerCase()] = Number(points)
//         return acc
//       }, acc),
//     newscore
//   )
// }
