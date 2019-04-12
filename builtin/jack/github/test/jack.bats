BATS_WAREHOUSE="sstephenson/bats"
BATS_VERSION="v0.4.0"
FL_WAREHOUSE="g2forge/forklift"
FL_VERSION="pallet-test"

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

@test "scripts" {
	jack import com.github ${FL_WAREHOUSE} ${FL_VERSION}
	[ "$status" -eq 0 ]
	
	run ~/.forklift/bin/forklift-test
	[ "$status" -eq 0 ]
	[ "$output" = "Hello, World!" ]
	
	jack delete com.github ${FL_WAREHOUSE} ${FL_VERSION}
	[ "$status" -eq 0 ]
	[ ! -f ~/.forklift/bin/forklift-test ]
}