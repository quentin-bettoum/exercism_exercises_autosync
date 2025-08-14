pub fn map<F, A, R>(input: Vec<A>, mut f: F) -> Vec<R>
where
    F: FnMut(A) -> R,
{
    let mut mapped = Vec::new();
    for x in input {
        mapped.push(f(x));
    }
    mapped
}
