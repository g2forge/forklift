load ../../../common/config
PALLETTEST_WAREHOUSE="${FL_WAREHOUSE}"
PALLETTEST_VERSION="pallet-test"

function jack () {
	run ${BATS_TEST_DIRNAME}/../jack ${@} 2> /dev/null
}

@test "no arguments" {
	jack
	[ "$status" -eq 1 ]
}

@test "help" {
	jack --help
	[ "$status" -eq 0 ]
}

@test "testBadGHE" {
	jack test com.example pallet version
	[ "$status" -eq 1 ]
}

@test "path" {
	jack path com.github ${BATS_WAREHOUSE} ${BATS_VERSION}
	[ "$status" -eq 0 ]
	[ "$(basename "${lines[-1]}")" = "${BATS_VERSION}" ]
}

@test "update" {
	jack update com.github ${BATS_WAREHOUSE} ${BATS_VERSION}
	[ "$status" -eq 0 ]
}

@test "scripts" {
	run echo $(${BATS_TEST_DIRNAME}/../jack path com.github ${PALLETTEST_WAREHOUSE} ${PALLETTEST_VERSION} 2>/dev/null)
	[ "$status" -eq 0 ]
	[ "$(basename "${lines[-1]}")" = "${PALLETTEST_VERSION}" ]
	
	run ~/.forklift/bin/forklift-test
	[ "$status" -eq 0 ]
	[ "$output" = "Hello, World!" ]
	
	jack delete com.github ${PALLETTEST_WAREHOUSE} ${PALLETTEST_VERSION}
	[ "$status" -eq 0 ]
	[ ! -f ~/.forklift/bin/forklift-test ]
}