# Check for proper input value
if [[ "{query}" =~ [0-5] ]]; then

	# Grab interesting data for Notification
	infoline=$(osascript -e 'tell application "iTunes" to "" & album of current track & " by " & artist of current track')
	track=$(osascript -e 'tell application "iTunes" to name of current track')

	# Set rating of the current track to user input
	osascript -e 'tell application "iTunes" to set rating of current track to {query} * 20'

	# Get "stars" from numerical value
	case "{query}" in
		1) stars="★☆☆☆☆" ;;
		2) stars="★★☆☆☆" ;;
		3) stars="★★★☆☆" ;;
		4) stars="★★★★☆" ;;
		5) stars="★★★★★" ;;
		*) stars="• • • • •" ;;
	esac
	echo "$track  $stars"
	echo "$infoline"
else
	echo "❌ Rating not Valid
     Nothing modified"
fi