pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {
    let mut primes: Vec<u64> = vec![];
    let mut not_primes: Vec<u64> = vec![];

    for v in 2..=upper_bound {
        if not_primes.contains(&v) {
            continue;
        }

        primes.push(v);

        for x in (v..=upper_bound).step_by(v as usize) {
            not_primes.push(x);
        }
    }

    primes
}
