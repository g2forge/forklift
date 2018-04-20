BATS_WAREHOUSE="sstephenson/bats"
BATS_VERSION="v0.4.0"

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

@test "path" {
  jack path com.github ${BATS_WAREHOUSE} ${BATS_VERSION}
  [ "$status" -eq 0 ]
  [ "$(basename $output)" = "${BATS_VERSION}" ]
}

@test "update" {
  jack update com.github ${BATS_WAREHOUSE} ${BATS_VERSION}
  [ "$status" -eq 0 ]
}
