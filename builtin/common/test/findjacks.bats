function findjacks () {
	run ${BATS_TEST_DIRNAME}/../findjacks ${@}
}

@test "builtin" {
  findjacks builtin pallet current
  [ "$status" -eq 0 ]
  [ "$output" = "builtin" ]
}

@test "com.github" {
  findjacks com.github pallet version
  [ "$status" -eq 0 ]
  [ "$output" = "github" ]
}

@test "invalid" {
  findjacks invalid invalid invalid
  [ "$status" -eq 0 ]
}

@test "badargs" {
  findjacks invalid
  [ "$status" -eq 1 ]
}
