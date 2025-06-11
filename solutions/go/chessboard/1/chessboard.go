package chessboard

type File []bool

type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, fileKey string) int {
	var count int
	for _, file := range cb[fileKey] {
		if file {
			count++
		}
	}
	return count
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	var count int
	if rank >= 1 || rank <= 8 {
		index := rank - 1
		for _, file := range cb {
			if index >= 0 && index < len(file) && file[index] {
				count++
			}
		}
	}
	return count
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	var count int
	for _, file := range cb {
		count += len(file)
	}
	return count
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	var count int
	for fileKey := range cb {
		count += CountInFile(cb, fileKey)
	}
	return count
}
