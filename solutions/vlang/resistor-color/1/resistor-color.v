module main

const colors = [
	'black',
	'brown',
	'red',
	'orange',
	'yellow',
	'green',
	'blue',
	'violet',
	'grey',
	'white',
]

fn color_code(color string) int {
	return colors.index(color)
}

// NOTE: Below is a solution with enums
// It's a bit more complicated, because the tests are checking we have
// an array of colors, so I had to find how to create that from the enum

// enum ResistorColor as u8 {
// 	black
// 	brown
// 	red
// 	orange
// 	yellow
// 	green
// 	blue
// 	violet
// 	grey
// 	white
// }

// pub fn color_code(color string) int {
// 	code := ResistorColor.from(color) or { ResistorColor.black }
// 	return int(code)
// }

// const colors = colors()

// pub fn colors() []string {
// 	mut all := []string{}
// 	$for c in ResistorColor.values {
// 		all << c.name
// 	}
// 	return all
// }
