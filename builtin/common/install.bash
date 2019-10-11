function install_force () {
	set +u
	if [ -z ${INSTALL_TEST+x} ]; then
		set -u
		INSTALL_TEST=0
	fi
	set -u
	
	if [[ "${INSTALL_TEST}" = "1" ]]; then
		echo install ${PACKAGE}
	else
		${COMMON_DIR}/install ${PACKAGE}
	fi
}
	
function install () {
	PACKAGE=${1}
	
	PACKAGE_FILE="${COMMON_DIR}/packages/${PACKAGE}"
	if [ -x "${PACKAGE_FILE}" ]; then
		COMMAND="$("${PACKAGE_FILE}" --command)"
	else
		COMMAND="${PACKAGE}"
	fi
	
	if (! which ${COMMAND} > /dev/null 2>&1) || ([[ "${INSTALL_NATIVE}" = "1" ]] && [[ $(which ${COMMAND}) = *"/cygdrive/"* ]]); then
		PACKAGE="${PACKAGE}" install_force
	elif [ -x "${PACKAGE_FILE}" ] && (! "${PACKAGE_FILE}" --test > /dev/null 2>&1); then
		PACKAGE="${PACKAGE}" install_force
	fi
}
