## Description
Rate iTunes Track is an [Alfred 2](http://www.alfredapp.com) workflow designed to allow to allow the user to easily rate the currently playing track in iTunes.

To enable half star ratings, issue the following command from within Terminal.

`defaults write com.apple.iTunes allow-half-stars -bool TRUE`

## Installation

"Rate iTunes Track.alfredworkflow" is the only file required to use the workflow. Just download and open the .workflow file to install within Alfred 2.

## Usage

Invoke Alfred 2, and type `rate <rating>` where `rating` is a number from 0-5. 
A selection of 0 clears the track rating. Now also supports half ratings such as 0.5, 1.5, 2.5, 3.5 or 4.5 to give the appropriate half star rating. 

Two panels will be shown, the top panel is where the rating is entered. The bottom panel only shows the current track information. If selected, nothing will happen. Separated into two panels for rating reliability. (The query wasn't passed properly if the Applescript didn't execute completely)


## Project Notes##

Added the bash scripts separately for reference and historical purposes, and to track changes to the individual scripts. You can also rename the .alfredworkflow extension to .zip, and extract normally.
