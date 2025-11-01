(module
  (memory (export "mem") 1)

  ;; pre-built byte strings
  (data (i32.const 0) "One for ")      ;; 8 bytes
  (data (i32.const 8) "you")            ;; 3 bytes
  (data (i32.const 11) ", one for me.") ;; 13 bytes
  ;; total static length = 24

  (func (export "twoFer") (param $off i32) (param $len i32) (result i32 i32)
    (local $base i32)
    (local.set $base (i32.const 24))

    ;; copy "One for "
    (memory.copy (local.get $base) (i32.const 0) (i32.const 8))

    (if (i32.eqz (local.get $len)) ;; if empty name, copy "you"
      (then
        (memory.copy (i32.add (local.get $base) (i32.const 8))
                     (i32.const 8) (i32.const 3))
        (local.set $len (i32.const 3)))
      (else ;; else, copy provided name
        (memory.copy (i32.add (local.get $base) (i32.const 8))
                     (local.get $off) (local.get $len))))

    ;; copy ", one for me."
    (memory.copy
      (i32.add (i32.add (local.get $base) (i32.const 8)) (local.get $len))
      (i32.const 11) (i32.const 13))

    (return (local.get $base)
            (i32.add (i32.const 21) (local.get $len)))
  )
)
