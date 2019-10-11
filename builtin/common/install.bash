function install_force () {
	echo install ${PACKAGE}
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
		if [ -x "${PACKAGE_FILE}" ]; then
			if ! "${PACKAGE_FILE}" --test > /dev/null 2>&1; then
				PACKAGE="${PACKAGE}" install_force
			fi
		else
			PACKAGE="${PACKAGE}" install_force
		fi
	fi
}
