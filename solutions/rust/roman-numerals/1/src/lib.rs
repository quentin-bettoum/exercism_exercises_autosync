use std::{
    collections::HashMap,
    fmt::{Display, Formatter, Result},
    sync::LazyLock,
};

static NUMERAL_VALUES: LazyLock<HashMap<u32, &str>> = LazyLock::new(|| {
    HashMap::from([
        (1, "I"),
        (4, "IV"),
        (5, "V"),
        (9, "IX"),
        (10, "X"),
        (40, "XL"),
        (50, "L"),
        (90, "XC"),
        (100, "C"),
        (400, "CD"),
        (500, "D"),
        (900, "CM"),
        (1000, "M"),
    ])
});

static NUMERAL_KEYS: LazyLock<Vec<&u32>> = LazyLock::new(|| {
    let mut keys: Vec<&u32> = NUMERAL_VALUES.keys().collect();
    keys.sort_unstable_by(|a, b| b.cmp(a));

    keys
});

pub struct Roman(String);

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(f, "{}", self.0)
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        let (_, roman_numeral) =
            NUMERAL_KEYS
                .iter()
                .fold((num, String::new()), |(remaining, roman_numeral), x| {
                    let repeat: u32 = remaining / *x;
                    (
                        remaining - *x * repeat,
                        format!(
                            "{}{}",
                            roman_numeral,
                            NUMERAL_VALUES[x].repeat(repeat as usize)
                        ),
                    )
                });

        Roman(roman_numeral.to_string())
    }
}
