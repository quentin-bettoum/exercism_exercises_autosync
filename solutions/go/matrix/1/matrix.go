package saddlepoints

import (
	"errors"
	"slices"
	"strconv"
	"strings"
)

type Matrix struct {
	rows    [][]int
	columns [][]int
}

var (
	ErrEmptyRow   = errors.New("empty row")
	ErrUnevenRows = errors.New("unever rows")
)

func New(s string) (Matrix, error) {
	var rows [][]int
	var colCount int

	for r := range strings.SplitSeq(s, "\n") {
		var row []int

		// Handle empty row string (e.g., "\n" produces empty row)
		if r == "" {
			return Matrix{}, ErrEmptyRow
		}

		for value := range strings.SplitSeq(r, " ") {
			if value == "" {
				continue // skip multiple spaces
			}
			n, err := strconv.Atoi(value)
			if err != nil {
				return Matrix{}, err // handles: non-numeric, non-integer, int64 overflow
			}
			row = append(row, n)
		}

		// Validate row length consistency
		if len(rows) == 0 {
			colCount = len(row)
		} else if len(row) != colCount {
			return Matrix{}, ErrUnevenRows
		}

		rows = append(rows, row)
	}

	// Build columns
	columns := make([][]int, colCount)
	for i := range columns {
		columns[i] = make([]int, len(rows))
		for j, row := range rows {
			columns[i][j] = row[i]
		}
	}

	return Matrix{rows: rows, columns: columns}, nil
}

func (m Matrix) Cols() [][]int {
	res := make([][]int, len(m.columns))
	for i, c := range m.columns {
		res[i] = slices.Clone(c)
	}
	return res
}

func (m Matrix) Rows() [][]int {
	res := make([][]int, len(m.rows))
	for i, r := range m.rows {
		res[i] = slices.Clone(r)
	}
	return res
}

func (m Matrix) Set(row, col, val int) (ok bool) {
	if ok = row >= 0 && row < len(m.rows) && col >= 0 && col < len(m.columns); ok {
		m.rows[row][col] = val
		m.columns[col][row] = val
	}
	return
}
