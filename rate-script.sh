# Check for proper input value
if [[ "{query}" =~ (^([0-5]\.*)|up|down|high|low|\+|\-) ]]; 
	then

	# Check if iTunes is running and playing a song
	if [ $(osascript -e 'if application "iTunes" is running then return true') ]; 	then
		iTunesPlaying=$(osascript -e 'tell application "iTunes" to if player state is playing then return true')
	fi

	if [[ $iTunesPlaying == true ]]; then

		# Grab interesting data for Notification
		infoline=$(osascript -e 'tell application "iTunes" to "" & album of current track & " by " & artist of current track')
		track=$(osascript -e 'tell application "iTunes" to name of current track')
		currentRating=$(osascript -e 'tell application "iTunes" to get rating of current track')

		# Get "stars" from numerical value
		case "{query}" in
			0.*) rating=10 ;;
			1) rating=20 ;;
			1.*) rating=30 ;;
			2) rating=40 ;;
			2.*) rating=50 ;;
			3) rating=60 ;;
			3.*) rating=70 ;;
			4) rating=80 ;;
			4.*) rating=90 ;;
			5) rating=100 ;;
			5.*) rating=100 ;;
			*) rating=0 ;;
		esac

		# Get "stars"  from string value
		case "{query}" in
			up|high|\+)
				if (("$currentRating" > 80));then
					rating=100
				else 
					rating=$((currentRating+20))
				fi ;;
			down|low|\-)
				if (($currentRating < 20)); then
					rating=0
				else 
					rating=$((currentRating-20))
				fi ;;
		esac
		## Convert to star ratings
		case $rating in
			10) stars="½☆☆☆☆";;
			20) stars="★☆☆☆☆" ;;
			30) stars="★½☆☆☆" ;;
			40) stars="★★☆☆☆" ;;
			50) stars="★★½☆☆" ;;
			60) stars="★★★☆☆" ;;
			70) stars="★★★½☆" ;;
			80) stars="★★★★☆" ;;
			90) stars="★★★★½" ;;
			100) stars="★★★★★" ;;
			*) stars="• • • • •" ;;
		esac


		# Set rating of the current track to user input
		osascript -e "tell application \"iTunes\" to set rating of current track to $rating"

		echo "$track  $stars"
		echo "$infoline"
	fi
else
	echo "❌ Rating not Valid
     Nothing modified"
fi