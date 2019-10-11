load ../install

@test "install_already" {
	INSTALL_NATIVE=0 run install which
	[ "$output" = "" ]
}

@test "install_now" {
	INSTALL_NATIVE=0 run install foobar
	[ "$output" = "install foobar" ]
	INSTALL_NATIVE=1 run install foobar
	[ "$output" = "install foobar" ]
}

@test "install_native" {
	INSTALL_NATIVE=1 run install powershell
	[ "$output" = "install powershell" ]
}
