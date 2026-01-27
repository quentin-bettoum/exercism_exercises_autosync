use std::ops::Rem;

// the PhantomData instances in this file are just to stop compiler complaints
// about missing generics; feel free to remove them

/// A Matcher is a single rule of fizzbuzz: given a function on T, should
/// a word be substituted in? If yes, which word?
pub struct Matcher<T> {
    matcher: Box<dyn Fn(T) -> bool>,
    subs: String,
}

impl<T> Matcher<T> {
    pub fn new<F, S>(matcher: F, subs: S) -> Self
    where
        F: Fn(T) -> bool + 'static,
        S: Into<String>,
    {
        Self {
            matcher: Box::new(matcher),
            subs: subs.into(),
        }
    }
}

/// A Fizzy is a set of matchers, which may be applied to an iterator.
///
/// Strictly speaking, it's usually more idiomatic to use `iter.map()` than to
/// consume an iterator with an `apply` method. Given a Fizzy instance, it's
/// pretty straightforward to construct a closure which applies it to all
/// elements of the iterator. However, we're using the `apply` pattern
/// here because it's a simpler interface for students to implement.
///
/// Also, it's a good excuse to try out using impl trait.
pub struct Fizzy<T> {
    matchers: Vec<Matcher<T>>,
}

impl<T> Fizzy<T>
where
    T: Copy + ToString,
{
    pub fn new() -> Self {
        Self { matchers: vec![] }
    }

    // feel free to change the signature to `mut self` if you like
    #[must_use]
    pub fn add_matcher(mut self, matcher: Matcher<T>) -> Self {
        self.matchers.push(matcher);
        self
    }

    /// map this fizzy onto every element of an iterator, returning a new iterator
    pub fn apply<I>(self, iter: I) -> impl Iterator<Item = String>
    where
        I: Iterator<Item = T>,
    {
        iter.map(move |item| {
            // let result = self
            //     .matchers
            //     .iter()
            //     .filter(|matcher| (matcher.matcher)(item))
            //     .fold(String::new(), |mut result, matcher| {
            //         result.push_str(&matcher.subs);
            //         result
            //     });

            let mut result = String::new();

            for matcher in &self.matchers {
                if (matcher.matcher)(item) {
                    result.push_str(&matcher.subs);
                }
            }

            if result.is_empty() {
                item.to_string()
            } else {
                result
            }
        })
    }
}

/// convenience function: return a Fizzy which applies the standard fizz-buzz rules
pub fn fizz_buzz<T>() -> Fizzy<T>
where
    T: Rem<Output = T> + ToString + PartialEq + From<u8> + Copy,
{
    // NOTE: 5.into() will do T::from(5)
    Fizzy::new()
        .add_matcher(Matcher::new(|n: T| n % T::from(3) == T::from(0), "fizz"))
        .add_matcher(Matcher::new(|n: T| n % 5.into() == 0.into(), "buzz"))
}
