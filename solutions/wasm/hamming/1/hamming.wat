(module
  (memory (export "mem") 1)

  ;;
  ;; Calculate the hamming distance between two strings.
  ;;
  ;; @param {i32} firstOffset - The offset of the first string in linear memory.
  ;; @param {i32} firstLength - The length of the first string in linear memory.
  ;; @param {i32} secondOffset - The offset of the second string in linear memory.
  ;; @param {i32} secondLength - The length of the second string in linear memory.
  ;;
  ;; @returns {i32} - The hamming distance between the two strings or -1 if the
  ;;                  strings are not of equal length.
  ;;
  (func (export "compute") 
    (param $firstOffset i32) (param $firstLength i32) (param $secondOffset i32) (param $secondLength i32) (result i32)

    (local $distance i32)
    (local $i i32)

    ;; if string lengths are not equal, return -1
    (if (i32.ne (local.get $firstLength) (local.get $secondLength))
      (then (return (i32.const -1)))
    )

    ;; Loop through each byte position
    (loop $loop
      ;; If we've reached the end, return the distance
      (if (i32.ge_u (local.get $i) (local.get $firstLength))
        (then (return (local.get $distance)))
      )

      ;; Load bytes and compare; increment distance if they differ
      (local.set $distance
        (i32.add (local.get $distance)
          (i32.ne
            (i32.load8_u (i32.add (local.get $firstOffset) (local.get $i)))
            (i32.load8_u (i32.add (local.get $secondOffset) (local.get $i)))
          )
        )
      )

      ;; $i++
      (local.set $i (i32.add (local.get $i) (i32.const 1)))

      ;; Continue loop
      (br $loop)
    )

    ;; The loop includes a return when the index reaches the string length,
    ;; so it should always exit via that return.
    ;; However, WebAssembly require all code paths in a function to terminate with a return or trap,
    ;; preventing undefined behavior if the loop somehow doesn't exit as expected.
    ;; This is why we need to write this line.
    unreachable
  )
)
