pub fn nth(n: u32) -> u32 {
    (2..).filter(|&nbr| is_prime(nbr)).nth(n as usize).unwrap()
}

fn is_prime(nbr: u32) -> bool {
    if nbr == 2 {
        return true;
    }
    if nbr.is_multiple_of(2) {
        return false;
    }

    let limit = nbr.isqrt();
    (3..=limit).step_by(2).all(|x| !nbr.is_multiple_of(x))
}
