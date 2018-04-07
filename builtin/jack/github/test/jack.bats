function jack () {
	run ${BATS_TEST_DIRNAME}/../jack ${@}
}

@test "no arguments" {
  jack
  [ "$status" -eq 1 ]
}

@test "help" {
  jack --help
  [ "$status" -eq 0 ]
}
