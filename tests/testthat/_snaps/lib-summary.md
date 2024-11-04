# lib_summary fails appropriately

    Code
      lib_summary(sizes = "foo")
    Condition
      Error in `lib_summary()`:
      ! You supplied "foo" to `sizes`. It should be a <logical> value, not a string.

---

    Code
      lib_summary(sizes = 12)
    Condition
      Error in `lib_summary()`:
      ! You supplied 12 to `sizes`. It should be a <logical> value, not a number.

