# Check for proper input value
if [[ "{query}" =~ ^[0-5]* ]]; then

	# Grab interesting data for Notification
	infoline=$(osascript -e 'tell application "iTunes" to "" & album of current track & " by " & artist of current track')
	track=$(osascript -e 'tell application "iTunes" to name of current track')

	# Get "stars" from numerical value
	case "{query}" in
		0.*) stars="½☆☆☆☆"; rating=10 ;;
		1) stars="★☆☆☆☆"; rating=20 ;;
		1.*) stars="★½☆☆☆"; rating=30 ;;
		2) stars="★★☆☆☆"; rating=40 ;;
		2.*) stars="★★½☆☆"; rating=50 ;;
		3) stars="★★★☆☆"; rating=60 ;;
		3.*) stars="★★★½☆"; rating=70 ;;
		4) stars="★★★★☆"; rating=80 ;;
		4.*) stars="★★★★½"; rating=90 ;;
		5) stars="★★★★★"; rating=100 ;;
		*) stars="• • • • •"; rating=0 ;;
	esac

	# Set rating of the current track to user input
	osascript -e "tell application \"iTunes\" to set rating of current track to $rating"

	echo "$track  $stars"
	echo "$infoline"
else
	echo "❌ Rating not Valid
     Nothing modified"
fi