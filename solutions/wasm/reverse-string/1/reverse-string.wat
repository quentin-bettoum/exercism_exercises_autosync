(module
  (memory (export "mem") 1)

  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32)
    (local $half i32)
    (local $left i32)
    (local $right i32)
    (local $a i32)
    (local $b i32)

    ;; when the string is empty, we just return offset, length
    (if (i32.eqz (local.get $length))
      (then
        (return (local.get $offset) (local.get $length))
      )
    )

    ;; half = length / 2
    (local.set $half (i32.shr_u (local.get $length) (i32.const 1)))
    (local.set $i (i32.const 0))

    (block $done
      (loop $loop
        (br_if $done (i32.ge_u (local.get $i) (local.get $half)))

        ;; left = offset + i
        (local.set $left (i32.add (local.get $offset) (local.get $i)))

        ;; right = offset + length - 1 - i
        (local.set $right
          (i32.sub
            (i32.add (local.get $offset) (local.get $length))
            (i32.add (i32.const 1) (local.get $i))
          )
        )

        ;; a = load8(left); b = load8(right)
        (local.set $a (i32.load8_u (local.get $left)))
        (local.set $b (i32.load8_u (local.get $right)))

        ;; store swapped bytes
        (i32.store8 (local.get $left) (local.get $b))
        (i32.store8 (local.get $right) (local.get $a))

        ;; i++
        (local.set $i (i32.add (local.get $i) (i32.const 1)))

        (br $loop)
      )
    )

    (local.get $offset)
    (local.get $length)
  )
)
