function pallet2jack () {
	run ${BATS_TEST_DIRNAME}/../pallet2jack ${@}
}

@test "builtin" {
  pallet2jack builtin pallet current
  [ "$status" -eq 0 ]
  [ "$output" = "builtin" ]
}

@test "com.github" {
  pallet2jack com.github pallet version
  [ "$status" -eq 0 ]
  [ "$output" = "github" ]
}

@test "invalid" {
  pallet2jack invalid invalid invalid
  [ "$status" -eq 1 ]
}

@test "badargs" {
  pallet2jack invalid
  [ "$status" -eq 1 ]
}
