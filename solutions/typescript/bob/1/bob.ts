export function hey(message: string): string {
  message = message.trim()

  if (message === '') return "Fine. Be that way!"

  const isQuestion = message.endsWith('?')
  const isYelled = message === message.toUpperCase() && /\p{Lu}/u.test(message)

  if (isQuestion && isYelled)
    return "Calm down, I know what I'm doing!"
  else if (isQuestion)
    return "Sure."
  else if (isYelled)
    return "Whoa, chill out!"
  else
    return "Whatever."
}
