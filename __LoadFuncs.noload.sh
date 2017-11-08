__LoadFuncs__() {
	set -uC &&
	set -o pipefail &&
	{
		local ShToolsDir="$1" &&
		local Dir="$2" &&
		local FuncsNamesSuffix="$3"
	} ||
	{
		>&2 echo "Missing parameter(s)."
		return 1
	}
	local Funcs="$( . "${ShToolsDir}/__GenFuncs.sh" "${Dir}" "${FuncsNamesSuffix}" )" &&
	eval "${Funcs}" ||
	{
		>&2 echo "Error loading functions."
		return 1
	}
}

__LoadFuncs__ "$@"

