#[macro_export(local_inner_macros)]
macro_rules! hashmap {
    ($($key:expr => $value:expr,)+) => { hashmap!($($key => $value),+) };
    ($($key:expr => $value:expr),*) => {
        {
            let mut map = ::std::collections::HashMap::new();
             $(map.insert($key, $value);)*
             map
        }
    };
}
