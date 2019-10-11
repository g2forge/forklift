load ../install

@test "install_already" {
	INSTALL_TEST=1 INSTALL_NATIVE=0 run install which
	[ "$output" = "" ]
}

@test "install_now" {
	INSTALL_TEST=1 INSTALL_NATIVE=0 run install foobar
	[ "$output" = "install foobar" ]
	INSTALL_TEST=1 INSTALL_NATIVE=1 run install foobar
	[ "$output" = "install foobar" ]
}

@test "install_native" {
	INSTALL_TEST=1 INSTALL_NATIVE=1 run install powershell
	[ "$output" = "install powershell" ]
}

@test "install_scripted" {
	INSTALL_TEST=1 INSTALL_NATIVE=1 run install git
	[ "$output" = "" ]
}

@test "git_command" {
	run ${BATS_TEST_DIRNAME}/../packages/git --command
	[ "$status" -eq 0 ]
	[ "$output" = "git" ]
}

@test "git_test" {
	run ${BATS_TEST_DIRNAME}/../packages/git --test
	[ "$status" -eq 0 ]
}