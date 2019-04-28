function cache () {
	CACHE_ROOT="${CACHE_ROOT}" run ${BATS_TEST_DIRNAME}/../cache ${@}
}

function setup () {
	CACHE_ROOT=$(mktemp -d)
}

function teardown () {
	rm -rf ${CACHE_ROOT}
}

@test "echo" {
  cache --test echo test
  [ "$status" -eq 1 ]
  cache echo test
  [ "$status" -eq 0 ]
  [ "$output" = "test" ]
  cache --test echo test
  [ "$status" -eq 0 ]
  cache echo test
  [ "$status" -eq 0 ]
  [ "$output" = "test" ]
}

@test "exitcode" {
  cache exit 93
  [ "$status" -eq 93 ]
  cache exit 93
  [ "$status" -eq 93 ]
}