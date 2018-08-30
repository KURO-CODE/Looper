#!/bin/bash

#  :::         ...         ...   ::::::::::. .,:::::: :::::::..   
#  ;;;      .;;;;;;;.   .;;;;;;;. `;;;```.;;;;;;;'''' ;;;;``;;;;  
#  [[[     ,[[     \[[,,[[     \[[,`]]nnn]]'  [[cccc   [[[,/[[['  
#  $$'     $$$,     $$$$$$,     $$$ $$$""     $$""""   $$$$10334c    
# o88oo,.__"888,_ _,88P"888,_ _,88P 888o      888oo,__ 888b "88bo,
# """"YUMMM  "YMMMMMP"   "YMMMMMP"  YMMMb     """"YUMMMMMMM   "W""
#                 FFmpeg Automate By Kuro-Code


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                           
#        ~ Looper ~                            
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Type: Multimedia
# CoDeD: bY KURO-CODE
# DaTe: 8/29/2018
# Dev: Bash
# Ver: 1.0
#
#~~~~~~~~~~~~~~~~~ INFO ~~~~~~~~~~~~~~~~~~~~
#
# Automate FFmpeg.
#
#	+ Video to gif
#   + Video to Mp3
#   + Screenshot
#   + Screenshot and sound
#   + Video cut
#   + Sound off
#   + Add sound 
#
#     *** Requirements ***
#   - FFmpeg
#
#********************************************

#**** Version ****
Ver="1.0"

#**** Colors ****
W="\033[1;37m"
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
EC="\033[0m"

#~~~~ VAR ~~~~
SCRIPT="Checker"
FFMPG="ffmpeg"

#~~~~ Logo ~~~~
LOGO() {
echo -e "
${Y}  :::         ...         ...   ::::::::::. .,:::::: :::::::..   
  ;;;      .;;;;;;;.   .;;;;;;;. \`;;;\`\`\`.;;;;;;;'''' ;;;;\`\`;;;;  
  [[[     ,[[     \[[,,[[     \[[,\`]]nnn]]'  [[cccc   [[[,/[[['  
  $\$'     $\$$,     $\$$\$$\$,     $\$$ $\$$\"\"     $\$\"\"\"\"   $\$$\$$$c    
 o88oo,.__\"888,_ _,88P\"888,_ _,88P 888o      888oo,__ 888b \"88bo,
 \"\"\"\"YUMMM  \"YMMMMMP\"   \"YMMMMMP\"  YMMMb     \"\"\"\"YUMMMMMMM   \"W\"\"
            ${G} FFmpeg Automate${W} By${R} Kuro${W}-${R}Code${Y} Version${W}: $Ver\n"
}

#~~~~ Menus ~~~~
function Main() {
	Place="Main"
	clear
	LOGO
	echo -e "${W}
	 [ M A I N  M E N U ] 

   [1]${G} Video To Gif${W}     [5]${G} Screenshot${W}
   [2]${G} Video To MP3${W}     [6]${G} Screenshot + sound${W}
   [3]${G} Video Cut${W}        [7]${G} Add Sound${W}
   [4]${G} Sound Off${W}        [${Y}9${W}]${Y} Info${W}

   [${R}0${W}]${R} Exit${EC}\n"
	read -p " Select: " OPT
	case $OPT in 
		1) Video_To_Gif;;
		2) Video_To_MP3;;
		3) Video_Cut;;
		4) Sound_Off;;
		5) Screenshot;;
		6) Screenshot;;
		7) Add_Sound;;
		9) INFO;;
		0) EXIT;;
	esac
}

function Video_To_Gif() {
	Place="Video_To_Gif"
	clear
	LOGO
	read -p " Video file: " FVideo
	Check_Video_File
	Script
	clear
	LOGO
	CHECKER_Video
	echo -e "${R}▶${Y} Video Time${W}: $V"
	echo -e "${Y} Example${W}:${G} 00${W}:${G}00${W}:${G}00${Y} (Hours:Minutes:Seconds)${W}"
	read -p " Timer start: " Start_Timer
	clear
	LOGO
	echo -e "${Y} Durée du Gif${W},${Y} Example${W}:${G} 10${W}"
	read -p " Gif Timer: " Timer
	clear
	LOGO
	echo -e "${Y} Size${W},${Y} Example${W}:${G} 500${W}"
	read -p " Size of Gif: " SIZE
	clear
	LOGO
	echo -e "${Y} Output file${W},${Y} Example${W}:${G} Image${W}"
	read -p " Output: " OUT  
	clear
	LOGO
	Gif_Extract
	Kill
	rm -f $SCRIPT
	Main
}

function Video_To_MP3() {
	Place="Video_To_MP3"
	clear
	LOGO
	read -p " Video file: " FVideo
	Check_Video_File
	Script
	clear
	LOGO
	CHECKER_Video
	echo -e "${G}▶${Y} Video Time${W}: $V"
	echo -e "${Y} Output file${W},${Y} Example${W}:${G} Music${W}"
	read -p " Output: " OUT 
	Sound_Extract
	Kill
	rm -f $SCRIPT 
	Main
}

function Video_Cut() {
	Place="Video_Cut"
	clear
	LOGO
	read -p " Video file: " FVideo
	Check_Video
	Script
	clear
	LOGO
	CHECKER_Video
	echo -e "${G}▶${Y} Video Time${W}: $V"
	echo -e "${Y} Example${W}:${G} 00${W}:${G}00${W}:${G}00${W}.${G}00${Y} (Hours:Minutes:Seconds.Miliseconds)${W}"
	read -p " Timer start: " Start_Timer
	clear
	LOGO
	echo -e "${G}▶${Y} Video Time${W}: $V"
	echo -e "${Y} Example${W}:${G} 00${W}:${G}00${W}:${G}00${W}.${G}00${Y} (Hours:Minutes:Seconds.Miliseconds)${W}"
	read -p " Timer End: " End_Timer
	clear
	LOGO
	echo -e "${Y} Output file${W},${Y} Example${W}:${G} Video.mp4${W}"
	read -p " Output: " OUT
	clear
	LOGO
	VCut
	Kill
	rm -f $SCRIPT
	Main
}

function Sound_Off() {
	Place="Sound_Off"
	clear
	LOGO
	read -p " Video file: " FVideo
	Check_Video
	clear
	LOGO
	echo -e "${Y} Output file, Example${W}:${G} Video.mp4${W}"
	read -p " Output: " OUT
	clear
	LOGO
	OFF
	Kill
	Main
}

function Add_Sound() {
	Place="Add_Sound"
	clear
	LOGO
	read -p " Audio file: " FAudio
	Check_Audio
	clear
	LOGO
	read -p " Video file: " FVideo
	Check_Video
	Script
	CHECKER_Audio
	CHECKER_Video
	clear
	LOGO
	echo -e "${G}▶${Y} Audio Time${W}: $A"
	echo -e "${R}▶${Y} Video Time${W}: $V"
	echo -e "${W}▷${Y} Example${W}:${G} 00${W}:${G}00${W}:${G}00${W}.${G}00${Y} (Hours:Minutes:Seconds.Miliseconds)${W}\n"
	read -p " Start: " Start_Timer
	clear
	LOGO
	echo -e "${Y} Output file, Example${W}:${Y} Video.mp4${W}"
	read -p " Output: " VSOUT
	VOUT="NewVideo.mp4"
	VCut
}

#~~~~ Video Cut ~~~~
function VCut() {
	if [ "$OPT" -eq "3" ]; then
		xterm -T "Video Cut" -geometry 70x06+0+0 -e "$FFMPG -i $FVideo -ss $Start_Timer -t $End_Timer -c:v copy -c:a copy  $OUT"
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Recording Completed${W} [${Y}!${W}]"
		sleep 3
#		Main
	elif [ "$OPT" -eq "7" ]; then
		xterm -T "Video Cut" -geometry 70x06+0+0 -e "$FFMPG -i $FVideo -ss $Start_Timer -t $A -c:v copy -c:a copy  $VOUT"
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Recording Completed${W} [${Y}!${W}]"
		sleep 3
		Kill &&
		sleep 3
		Add
		Kill
		rm -f $VOUT
		rm -f $SCRIPT
		Main
	fi
}

#~~~~ Sound Off ~~~~
function OFF() {
	xterm -T "Sound Off" -geometry 70x06+0+0 -e "$FFMPG -i $FVideo -c copy -an $OUT"
}

function Screenshot() {
	Place="Screenshot"
	SR=`xdpyinfo | grep dimensions |awk '{print $2}'`
	if [ "$OPT" -eq "5" ]; then
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Screenshot Window${W}:${R} Stop Recording${W}: [${G}Ctrl+C${W}]"
		xterm -T "Screenshot" -geometry 70x06+0+0 -e "$FFMPG -f x11grab -r 30 -s $SR -i :0.0 -vcodec libx264 out.mkv" 
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Recording Completed${W} [${Y}!${W}]"
		sleep 3
		Main
	elif [ "$OPT" -eq "6" ]; then
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Screenshot Window${W}:${R} Stop Recording${W}: [${G}Ctrl+C${W}]"
		xterm -T "Screenshot + Sound" -geometry 70x06+0+0 -e "$FFMPG -f alsa -ac 2 -i pulse -f x11grab -r 30 -s  $SR -i :0.0 -acodec pcm_s16le -vcodec libx264 bureau.mkv" 
		clear
		LOGO
		echo -e "${W} [${Y}!${W}]${G} Recording Completed${W} [${Y}!${W}]"
		sleep 3
		Main
	fi
}

#~~~~ Automation ~~~~
function Gif_Extract() {
	xterm -T "Gif Extract" -geometry 70x06+0+0 -e "$FFMPG -ss $Start_Timer -t $Timer -i $FVideo -vf scale=$SIZE:-1 $OUT.gif" 
}

function Sound_Extract() {
	xterm -T "Extract" -geometry 70x06+0+0 -e "$FFMPG -i $FVideo -vn -ar 44100 -ac 2 -ab 256k -f mp3 $OUT.mp3"
}

#~~~~ Add Sound ~~~~
function Add() {
	xterm -T "Insertion" -geometry 70x06+0+0 -e "$FFMPG -i $VOUT -i $FAudio -c copy -map 0:0 -map 1:0 $VSOUT"
}

#~~~~ Check ~~~~
function Check_Video_File() {
	if [ ! -f "$FVideo" ]; then
	    echo -e " [${R}x${W}]$GR...$R""N$W""ot Exist$EC"
	    sleep 2
	    Main 
	fi
}

function Check_Audio_File() {
	if [ ! -f "$FAudio" ]; then
	    echo -e " [${R}x${W}]$GR...$R""N$W""ot Exist$EC"
	    sleep 2
	    Main
	fi
}

function Check_Dep() {
	clear
	LOGO
	echo -ne "FFmpeg....."
	if ! hash ffmpeg 2>/dev/null; then
		echo -e "Not installed [${R}x${W}]${EC}"
		sleep 3
	else
		echo -e "[${G}✔${W}]${EC}"
	fi
	sleep 0.25
	echo -ne "Xterm....."
	if ! hash xterm 2>/dev/null; then
		echo -e "Not installed [${R}x${W}]${EC}"
		sleep 3
		EXIT
	else
		echo -e "[${G}✔${W}]${EC}"
	fi
	sleep 3
}

function CHECKER_Video() {

		V=`perl $SCRIPT $FVideo | grep duration: |awk '{print $2}' |sed 's/increasing/ /g'`
}

function CHECKER_Audio() {

		A=`perl $SCRIPT $FAudio |grep duration: |awk '{print $2}'`
}
#~~~~ Kill ~~~~
function Kill() {
	pkill xterm 
}

#~~~~ Script ~~~~
function Script() {
	echo "#!/usr/bin/perl -w
use strict;
use warnings;

use IPC::Open3;

# example
my \$filename  = \$ARGV[0];
my %videoInfo = videoInfo(\$filename);
print \"duration: \" . \$videoInfo{'duration'} . \"\n\";

#
# returns media information in a hash
sub videoInfo {
	# ffmpeg command
	my \$ffmpeg = '/usr/bin/ffmpeg';

	my %finfo = (
				  'duration'     => \"00:00:00.00\",

	);

	my \$file = shift;

	# escaping characters
	\$file =~ s/(\W)/\\\\\$1/g;

	open3( \"</dev/null\", \">/dev/null\", \*ERPH, \"\$ffmpeg -i \$file\" ) or die \"can't run \$ffmpeg\n\";
	my @res = <ERPH>;

	# parse ffmpeg output
	foreach (@res) {
        print;

		# duration
		if (m!Duration: ([0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9])!) {
			\$finfo{'duration'} = \$1;
		}

	}

	my \$tenths  = substr( \$finfo{'duration'}, 9, 2 );
	my \$seconds = substr( \$finfo{'duration'}, 6, 2 );
	my \$minutes = substr( \$finfo{'duration'}, 3, 2 );
	my \$hours   = substr( \$finfo{'duration'}, 0, 2 );

	return %finfo;
}" > $SCRIPT
}

#~~~~ Info ~~~~
function INFO() {
	clear
	LOGO
	echo -e "
${W}    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃                           ┃
    ┃${G}   Name${W}: Looper            ┃
    ┃${G}   Date${W}: 8/29/2018         ┃
    ┃${G}   Type${W}: FFmpeg automate   ┃
    ┃${G}   Dev${W}: Bash               ┃
    ┃${G}   Ver${W}: $Ver                ┃
    ┃${G}   Coder${W}: Kuro-Code        ┃
    ┃                           ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

${Y}  Return to Main menu, press ${R}[ENTER]${W}."
  read -p ""
  Main
}

#~~~~ EXIT ~~~~
function EXIT() {
	clear
	if [ ! -f "$SCRIPT" ]; then
		LOGO
		echo -e "${W} Thanks for using Looper\n"
		sleep 1
		echo -e " [${R}✔${W}]${G} Closing ${W}[${R}✔${W}]${EC}"
		sleep 3
		clear
		exit
	else
		rm -f $SCRIPT
		EXIT
	fi
		
}

#~~~~ Hard Exit ~~~~
function cap_traps() {
	case $Place in
		"Main") EXIT;;
		"Video_To_Gif") EXIT;;
		"Video_To_MP3") EXIT;;
		"Screenshot") EXIT;;
		"Video_Cut") EXIT;;
		"Sound_Off") EXIT;;
		"Add_Sound") EXIT;;
		"INFO") EXIT;;
	esac 
}

for x in SIGINT SIGHUP INT SIGTSTP; do
	trap_cmd="trap \"cap_traps $x\" \"$x\""
	eval "$trap_cmd"
done

#~~~~ START ~~~~
Check_Dep
Main 
