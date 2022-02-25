#/bin/sh
PACKAGES="ImageMagick xclip i3 i3status lightdm"

echo "Script currently does not function."
read -p "WARNING! Running this will replace your configs with links to configs in here. Are you sure you want to do that? (y/N): " prompt
if [[ ! ${prompt:0:1} =~ ^[Yy]$ ]]
then
	exit 1
fi

declare -A osInfo;
osInfo[/etc/redhat-release]="yum"
osInfo[/etc/arch-release]="pacman"
osInfo[/etc/SuSE-release]="zypper"
osInfo[/etc/debian_version]="apt-get"

packageMan=apt-get

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
	packageMan=${osInfo[$f]}
    fi
done

echo "Installing '${PACKAGES}' with ${packageMan}. Will need sudo permission..."

case $packageMan in
	"yum")
		sudo yum install ${PACKAGES}
		;;
	"pacman")
		sudo pacman -S ${PACKAGES}
		;;
	"zypper")
		sudo zypper in ${PACKAGES}
		;;
	*)
		sudo apt-get install ${PACKAGES}
		;;
esac

