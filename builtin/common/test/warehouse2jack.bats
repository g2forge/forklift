function warehouse2jack () {
	run ${BATS_TEST_DIRNAME}/../warehouse2jack ${1}
}

@test "builtin" {
  warehouse2jack builtin
  [ "$status" -eq 0 ]
  [ "$output" = "builtin" ]
}

@test "github" {
  warehouse2jack com.github
  [ "$status" -eq 0 ]
  [ "$output" = "github" ]
}

@test "invalid" {
  warehouse2jack invalid
  [ "$status" -eq 1 ]
}
