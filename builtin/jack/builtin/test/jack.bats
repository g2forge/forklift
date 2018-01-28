function jack () {
	run ${BATS_TEST_DIRNAME}/../jack ${@}
}

@test "path" {
  jack path builtin common current
  [ "$status" -eq 0 ]
  [ "$output" = "$(cd ${BATS_TEST_DIRNAME}/../../../common && pwd -P)" ]
}

@test "no arguments" {
  jack
  [ "$status" -eq 1 ]
}

@test "bad warehouse" {
  jack invalid common current
  [ "$status" -eq 1 ]
}

@test "bad version" {
  jack builtin common invalid
  [ "$status" -eq 1 ]
}
