package twelve

import "strings"

import "fmt"

const (
	GIFTSLEN = len(gifts)
	REFRAIN  = "On the %s day of Christmas my true love gave to me: %s."
)

var gifts = [...]string{
	"twelve Drummers Drumming",
	"eleven Pipers Piping",
	"ten Lords-a-Leaping",
	"nine Ladies Dancing",
	"eight Maids-a-Milking",
	"seven Swans-a-Swimming",
	"six Geese-a-Laying",
	"five Gold Rings",
	"four Calling Birds",
	"three French Hens",
	"two Turtle Doves",
	"a Partridge in a Pear Tree",
}

var ordinals = [...]string{
	"first", "second", "third", "fourth", "fifth", "sixth",
	"seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
}

func Verse(nbr int) string {
	var verseGifts strings.Builder

	relevantGifts := gifts[GIFTSLEN-nbr:]

	for i, gift := range relevantGifts {
		if i > 0 {
			verseGifts.WriteString(", ")
		}
		if nbr > 1 && i == len(relevantGifts)-1 {
			verseGifts.WriteString("and ")
		}
		verseGifts.WriteString(gift)
	}

	return fmt.Sprintf(REFRAIN, ordinals[nbr-1], verseGifts.String())
}

func Song() string {
	var builder strings.Builder

	for i := 1; i <= GIFTSLEN; i++ {
		builder.WriteString(Verse(i))
		if i < GIFTSLEN {
			builder.WriteString("\n")
		}
	}

	return builder.String()
}
