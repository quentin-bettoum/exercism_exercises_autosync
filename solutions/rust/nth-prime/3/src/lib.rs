pub fn nth(n: u32) -> u32 {
    (2..).filter(|&nbr| is_prime(nbr)).nth(n as usize).unwrap()
}

fn is_prime(nbr: u32) -> bool {
    if nbr == 2 {
        return true;
    }
    if nbr % 2 == 0 {
        return false;
    }

    let limit = nbr.isqrt();
    !(3..=limit).step_by(2).any(|x| nbr % x == 0)
}
