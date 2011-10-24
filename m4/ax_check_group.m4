AC_DEFUN([AX_CHECK_GROUP],[

_groupresult=""
for grouptest in $2; do
	AC_MSG_CHECKING([for group $grouptest])

	if getent group $grouptest > /dev/null; then
			_groupresult=$grouptest
			break
	fi
done
if test "x$_groupresult" != "x"; then
	$1=$_groupresult
	AC_MSG_RESULT([yes])
else
	$1=$3
	AC_MSG_RESULT([no])
fi
dnl
])
