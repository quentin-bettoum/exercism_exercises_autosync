pub fn nth(n: u32) -> u32 {
    let mut prime_count = 0;
    let mut prime: u32 = 0;
    let mut i = 0;

    while prime_count < n + 1 {
        let mut x = 2;

        while x <= i {
            if x < i && i % x == 0 {
                break;
            }

            if x == i {
                prime = i;
                prime_count += 1;
            }

            x += 1;
        }

        i += 1;
    }

    prime
}
