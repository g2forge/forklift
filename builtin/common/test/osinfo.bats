function osinfo () {
	run ${BATS_TEST_DIRNAME}/../osinfo ${@}
}

@test "distro" {
  osinfo -d
  [ "$status" -eq 0 ]
  [ "$output" != "Unknown" ]
}

@test "version" {
  osinfo -v
  [ "$status" -eq 0 ]
  [ "$output" != "Unknown" ]
}

@test "architecture" {
  osinfo -a
  [ "$status" -eq 0 ]
  [ "$output" != "Unknown" ]
}
