package expenses

import "errors"

// Record represents an expense record.
type Record struct {
	Day      int
	Amount   float64
	Category string
}

// DaysPeriod represents a period of days for expenses.
type DaysPeriod struct {
	From int
	To   int
}

// Filter returns the records for which the predicate function returns true.
func Filter(in []Record, predicate func(Record) bool) (rec []Record) {
	for _, r := range in {
		if predicate(r) {
			rec = append(rec, r)
		}
	}
	return rec
}

// ByDaysPeriod returns predicate function that returns true when
// the day of the record is inside the period of day and false otherwise.
func ByDaysPeriod(p DaysPeriod) func(Record) bool {
	return func(r Record) bool { return r.Day >= p.From && r.Day <= p.To }
}

// ByCategory returns predicate function that returns true when
// the category of the record is the same as the provided category
// and false otherwise.
func ByCategory(c string) func(Record) bool {
	return func(r Record) bool { return r.Category == c }
}

// TotalByPeriod returns total amount of expenses for records
// inside the period p.
func TotalByPeriod(in []Record, p DaysPeriod) (total float64) {
	for _, r := range Filter(in, ByDaysPeriod(p)) {
		total += r.Amount
	}
	return total
}

var ErrUnkownCategory = errors.New("unknown category entertainment")

// CategoryExpenses returns total amount of expenses for records
// in category c that are also inside the period p.
// An error must be returned only if there are no records in the list that belong
// to the given category, regardless of period of time.
func CategoryExpenses(in []Record, p DaysPeriod, c string) (float64, error) {
	records := Filter(in, ByCategory(c))
	if len(records) == 0 {
		return 0, ErrUnkownCategory
	}
	return TotalByPeriod(records, p), nil
}
