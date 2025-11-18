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

// pub fn nth(n: u32) -> u32 {
//     let mut prime_count = 0;
//     let mut prime: u32 = 0;
//     let mut i = 0;

//     while prime_count < n + 1 {
//         let mut x = 2;

//         while x <= i {
//             if x < i && i % x == 0 {
//                 break;
//             }

//             if x == i {
//                 prime = i;
//                 prime_count += 1;
//             }

//             x += 1;
//         }

//         i += 1;
//     }

//     prime
// }
