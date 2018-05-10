function version () {
	run ${BATS_TEST_DIRNAME}/../version ${@}
}

@test "newer" {
  version isnewer 0.0.1 v0.0.2
  [ "$status" -eq 0 ]
}

@test "older" {
  version isnewer v1.0.1 0.0.2
  [ "$status" -eq 2 ]
}
