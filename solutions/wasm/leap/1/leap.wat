(module
  ;;
  ;; Determine if a year is a leap year
  ;;
  ;; @param {i32} year - The year to check
  ;;
  ;; @returns {i32} 1 if leap year, 0 otherwise
  ;;
  (func (export "isLeap") (param $year i32) (result i32)
    (local $divisible_by4 i32)
    (local $divisible_by100 i32)
    (local $divisible_by400 i32)

    (local.set $divisible_by4
      (i32.eqz
        (i32.rem_s
          (local.get $year)
          (i32.const 4)
        )
      )
    )

    (local.set $divisible_by100
      (i32.eqz
        (i32.rem_s
          (local.get $year)
          (i32.const 100)
        )
      )
    )

    (local.set $divisible_by400
      (i32.eqz
        (i32.rem_s
          (local.get $year)
          (i32.const 400)
        )
      )
    )

    (i32.or
      (local.get $divisible_by400)
      (i32.and
        (local.get $divisible_by4)
        (i32.eqz
          (local.get $divisible_by100)
        )
      )
    )
  )
)
