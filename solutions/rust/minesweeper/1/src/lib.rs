pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let rows: Vec<Vec<char>> = minefield.iter().map(|s| s.chars().collect()).collect();
    let height = rows.len();
    let width = if height > 0 { rows[0].len() } else { 0 };

    rows.iter()
        .enumerate()
        .map(|(y, line)| {
            line.iter()
                .enumerate()
                .map(|(x, &ch)| {
                    if ch == '*' {
                        '*'
                    } else {
                        match square_number(&rows, height, width, x, y) {
                            0 => ' ',
                            count => char::from_digit(count, 10).unwrap(),
                        }
                    }
                })
                .collect::<String>()
        })
        .collect()
}

fn square_number(minefield: &[Vec<char>], height: usize, width: usize, x: usize, y: usize) -> u32 {
    let mut count = 0u32;
    let y0 = y as isize;
    let x0 = x as isize;

    for dy in -1isize..=1 {
        for dx in -1isize..=1 {
            if dx == 0 && dy == 0 {
                continue;
            }
            let ny = y0 + dy;
            let nx = x0 + dx;
            if ny >= 0
                && ny < height as isize
                && nx >= 0
                && nx < width as isize
                && minefield[ny as usize][nx as usize] == '*'
            {
                count += 1;
            }
        }
    }

    count
}
