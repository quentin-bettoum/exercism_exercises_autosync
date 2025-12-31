pub fn factors(mut n: u64) -> Vec<u64> {
    let mut i = 2;
    let mut prime_factors: Vec<u64> = Vec::default();

    while i <= n {
        while n.is_multiple_of(i) {
            n /= i;
            prime_factors.push(i);
        }
        i += 1;
    }

    prime_factors
}
