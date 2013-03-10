## Description
Rate iTunes Track is an [Alfred 2](http://www.alfredapp.com) workflow designed to allow for easy access to rate the currently playing track in iTunes.


## Installation

"Rate iTunes Track.alfredworkflow" is the only file required to use the workflow. Just download and open the .workflow file to install within Alfred 2. (This will not work with Alfred 1.X)  

Added the bash scripts separately for reference and historical purposes, and to track changes to the individual scripts. You can also rename the .alfredworkflow extension to .zip, and extract normally.


## Usage

Invoke Alfred 2, and type `rate <rating>` where `rating` is a number from 0-5. 
A selection of 0 clears the track rating. Now also supports half ratings such as 0.5, 1.5, 2.5, 3.5 or 4.5 to give the appropriate half star rating. 

**Note**: Run the following command in Terminal to enable half stars within iTunes before enabling the workflow.

`defaults write com.apple.iTunes allow-half-stars -bool TRUE`

