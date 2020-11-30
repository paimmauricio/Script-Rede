#!/bin/bash
##################################
#
# Author: Maurício Paim - paim.mauricio@gmail.com
# Version: 2.3
# Date: 10/8/2020
# Network Script
# When using the script you assume
# ALL responsibility for its use
#
###################################

# ------------------ Colors Begin ------------------ #

# variables
colStandard="\033[0m"
black="\033[0;30m"
red="\033[0;31m"
green="\033[0;32m"
brown="\033[0;33m"
blue="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
lightgray="\033[0;37m"
blackBlack="\033[1;30m"
lightred="\033[1;31m"
lightgreen="\033[1;32m"
yellow="\033[1;33m"
lightblue="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
white="\033[1;37m"

# ------------------ End colors ------------------ #


Main ()
{
			clear	
# ------------- Main Menu Begin ----------- #
	echo "----------------------------------------------------- "
	echo "1 - TCP Dump"
	echo "2 - NMAP"
	echo "3 - NSLookUP"
	echo "4 - Nikto"
	echo "5 - MasScan"
	echo "6 - Recognition"
	echo "7 - Softwares"
	echo "8 - IP Information"
	echo "9 - Social Media Information"
	echo "d - Donation"
	echo "x - Exit"
	echo "----------------------------------------------------- "
	echo -n "Choose one of the options:"
				read OPTION
	# User will choose a number from the list that will be read by (read) OPTION
	# Which will be redirected according to your choice (Ex: Entering 1 will be redirected
	# for option 1 in the list below)
	case $OPTION in
		1 ) TCPDump;;
		2 ) NMAP;;
		3 ) NSLookUP;;
		4 ) Nikto;;
		5 ) MasScan;;
		6 ) Recognition;;
		7 ) Software;;
		8 ) IPs;;
		9 ) Media;;
		d ) Donation;;
		x ) echo; echo; echo "......... Bye Bye ........."; sleep 2; clear; exit 0;;
		* ) echo; echo; echo "Invalid option"; sleep 3; Main;;
	esac
}
# ------------- Main Menu End ----------- #

# ------------- 1 - TCP Dump Begin ----------- #

TCPDump ()
{
			clear	
	echo
	echo
	echo
	echo
	echo
	echo
	echo "------------------------------------------"
	echo "Choose the network card"
	echo "------------------------------------------"
	echo
	ip addr show
	echo
	echo "------------------------------------------"
	echo
	echo "------------------------------------------"
	echo "1 - Card nº 1 - With log"
	echo "2 - Card nº 2 - With log"
	echo "3 - ard nº 1 - Without log"
	echo "4 - Card nº 2 - Without log"
	echo "5 - Show network cards"
	echo -e "6 - \033[01;31mDelete \033[0m\033[01;5;31mALL \033[0m LOG files"
	echo "7 - Main Menu"
	echo "------------------------------------------"
	echo
	echo "Choose an Option:"
				read CARD
	echo
	case $CARD in
		1 )
	clear	
		echo
		echo "Enter a name for the log file:"
						read LOG;
		echo
		echo
			if [ ! -d "~/Script/TCPDump" ]; then
		echo "------------------------------------------"
		echo "Directory does not exist and will be created"
        	        			echo "------------------------------------------"
        	        			echo
        	        			echo "------------------------------------------"
        	        			echo "Creating directory"
        	        			echo "------------------------------------------"
        	        			echo
			sudo mkdir -p -m 777 ~/Script/TCPDump/
			sudo touch ~/Script/TCPDump/$LOG
			sudo chmod -R 777 ~/Script/TCPDump/$LOG
			fi;
			CARD1=$(sudo ip addr show | grep '^ 1:' | cut -d : -f2 );
		echo
		echo "------------------------------------------"
			echo "Chosen plaque was:"$CARD1;
		echo "------------------------------------------"
		echo
		echo "------------------------------------------"
		echo "Creating log file ....."
		echo "------------------------------------------"
		echo
			sudo tcpdump -vv -i $CARD1 >> ~/Script/TCPDump/$LOG;
		echo
		echo "------------------------------------------"
		echo "Log file created successfully ....."
		echo "------------------------------------------"
		echo
		echo "------------------------------------------"
		echo "Do you want to see the log file?"
		echo "Type y or n"
		echo "------------------------------------------"
			read RESP
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
			read RESP
			echo
			done
			if [ "$RESP" =  "y" ]; then
				sudo cat ~/Script/TCPDump/$LOG | less
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
							read
				TCPDump;
			fi
			if [ "$RESP" =  "n" ]; then
	echo
	echo "------------------------------------------"
	echo "Returning to the TCP Dump menu"
	echo "------------------------------------------"
					sleep 1; TCPDump;
			fi;;
		2 )
	clear	
		echo
		echo "Enter a name for the log file:"
						read LOG;
		echo
		echo
			if [ ! -d "~/Script/TCPDump" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "~/Script/TCPDump/"
			echo "------------------------------------------"
			echo
				sudo mkdir -p -m 777 ~/Script/TCPDump/
				sudo touch ~/Script/TCPDump/$LOG
				sudo chmod -R 777 ~/Script/TCPDump/$LOG
			fi;
				CARD2=$(sudo ip addr show | grep '^2: ' | cut -d : -f2);
			echo
			echo
				sleep 2
		clear	
			echo
			echo "------------------------------------------"
			echo "Chosen card was:"$CARD2;
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating log file ....."
			echo "------------------------------------------"
			echo
				sudo tcpdump -vv -i $CARD2 >> ~/Script/TCPDump/$LOG;
			echo
			echo "------------------------------------------"
			echo "Log file created successfully ....."
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Do you want to see the log file?"
			echo "Type y or n"
			echo "------------------------------------------"
			read RESP
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do

			echo
			echo
			clear
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" = "y" ]; then
			sudo cat ~/Script/TCPDump/$LOG | less
	echo
	echo 			
	echo "------------------------------------------"
	echo "Press ENTER to continue"
	echo "------------------------------------------"
	echo
	echo
								read
					TCPDump;
				fi
				if [ "$RESP" = "n" ]; then
	echo
	echo "------------------------------------------"
	echo "Returning to the TCP Dump menu"
	echo "------------------------------------------"
					sleep 1; TCPDump;
					fi;;
					3 )
	clear	
		echo
			CARD1=$(sudo ip addr show | grep '^ 1:' | cut -d : -f2 );
		echo "------------------------------------------"
		echo
		echo "Chosen plaque was:"$CARD1;
		echo
		echo "------------------------------------------"
		echo
			sudo tcpdump -vv -i $CARD1;
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
						read
			TCPDump;;
					4 )
	clear	
		echo
			CARD2=$(ip addr show | grep '^2:' | cut -d : -f2 );
		echo
		echo "------------------------------------------"
		echo
		echo "Chosen card was:"$CARD2;
		echo
		echo "------------------------------------------"
		echo
			sudo tcpdump -vv -i $CARD2;
			sleep 3; TCPDump;;
					5 )
	clear	
			ip addr show;
		echo
		echo
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
						read
			TCPDump;;
		6)
	clear	
		echo "------------------------------------------"
		echo "List of files to be deleted"
		echo "------------------------------------------"
		echo
			cd ~/Script/TCPDump/
			pwd
		echo
			cd ->/dev/null
		echo
			ls -lah ~/Script/TCPDump/
		echo
		echo
		echo "------------------------------------------"
		echo "Do you really want to delete the file (s)?"
		echo "Type y or n"
		echo "------------------------------------------"
						read RESP
		echo
		echo
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
							read RESP
			done
			if [ "$RESP" = "y" ]; then
			echo
			echo
			echo "------------------------------------------"
			echo "Deleting LOG files"
			echo "------------------------------------------"
			echo
				rm -rf ~/Script/TCPDump/*
			echo
			echo
			echo "------------------------------------------"
			echo "Deleted LOG files"
			echo "------------------------------------------"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			TCPDump;
			fi
			if [ "$RESP" = "n" ]; then
			echo
			echo "Returning to the TCP Dump menu"
			sleep 1; TCPDump;
			fi;
			TCPDump;;
		7) Main;;
		*) echo "Invalid option"; sleep 2; TCPDump;;
esac
}

# ------------- 1 - TCP Dump End ----------- #

# ------------- 2 - NMAP Begin ----------- #
NMAP ()
{
	clear
	echo
	echo
	echo
	echo
	echo
	echo
	echo "-------------------------------------------"
	echo "NMAP"
	echo "-------------------------------------------"
	echo
	echo
	echo "------------------------------------------"
	echo "1 - IPV 4 - Standard"
	echo "2 - IPV 4 - Complete"
	echo "3 - IPV 4 - Check if host is UP"
	echo "4 - SSL - SSL Search"
	echo "5 - read collection file"
	echo -e "6 - \033[01;31mDelete\033[0m \033[01;5;31mALL \033[0m LOG files"
	echo "7 - Main Menu"
	echo "------------------------------------------"
	echo
	read NUM
	case $NUM in
		1 )
		clear	
		echo
		echo "------------------------------------------"
		echo "Default"
		echo
		echo "Enter the destination IP or website:"
		echo
		echo "------------------------------------------"
		echo
		read DESTINATION;
		echo
			if [ ! -d "~/Script/NMAP/" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
			sudo mkdir -p -m 777 ~/Script/NMAP/
			fi;
		echo
		echo "------------------------------------------"
		echo "The collection file is: "~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_standard.txt
		echo "------------------------------------------"
		echo
			sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_standard.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_standard.txt
			sudo nmap $DESTINATION >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_standard.txt
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
		read
		NMAP;;
		2 )
		clear
		echo
		echo "------------------------------------------"
		echo "Complete"
		echo
		echo "Enter the destination IP or website:"
		echo
		echo "------------------------------------------"
		echo
		read DESTINATION;
		echo
			if [ ! -d "~/Script/NMAP" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
				sudo mkdir -p -m 777 ~/Script/NMAP
			echo
			fi;
		echo
		echo "The collection file is:"~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_complete.txt;
		echo
			sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_complete.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_complete.txt
			sudo nmap -A -R -T4 $DESTINATION >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_complete.txt
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
		read
		NMAP;;
		3 )
		clear	
		echo
		echo "------------------------------------------"
		echo "HOST UP"
		echo "Enter the destination IP or website:";
		echo
		echo "------------------------------------------"
		echo
		read DESTINATION;
		echo
			if [ ! -d "~/Script/NMAP" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
				sudo mkdir -m 777 -p ~/Script/NMAP
			fi;
		echo
		echo "The collection file is:"~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_UP.txt
		echo
			sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_UP.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_UP.txt
			sudo nmap -sP -R -T4 $DESTINATION >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_UP.txt
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
		read
		NMAP;;
		4 )
		clear
		echo
		echo "------------------------------------------"
		echo
		echo "SSL"
		echo "Enter IP or Website without WWW"
		echo
		echo "------------------------------------------"
		echo
		read IP;
		echo
		echo "------------------------------------------"
		echo
		echo "SSL"
		echo "Enter the door"
		echo
		echo "------------------------------------------"
		echo
		read DOOR;
		echo
			if [ ! -d "~/Script/NMAP" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
				sudo mkdir -m 777 -p ~/Script/NMAP
			echo
			fi;
		echo
		echo "The collection file is:"~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_ssl.txt;
		echo
			sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_ssl.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_ssl.txt
			sudo nmap -vv --script ssl-cert, ssl-enum-ciphers -p $PORT $DESTINATION >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_ssl.txt
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
		read
		NMAP;;
		5 )
		clear
		echo
		echo
		echo "------------------------------------------"
		echo
		echo "			Read collected files"
		echo
		echo "------------------------------------------"
		echo
		echo "------------------------------------------"
		echo "1 - Standard"
		echo "2 - Complete"
		echo "3 - Host UP"
		echo "4 - SSL"
		echo "5 - NMAP menu"
		echo "------------------------------------------"
		echo
		read NUM
			if [ $NUM -eq "1" ]; then
			echo
			echo "------------------------------------------"
			echo "Default"
			echo "------------------------------------------"
			echo
				cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_standard.txt
				   
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			echo
			read;
			NMAP
			read;
			elif [ $NUM -eq "2" ]; then
			echo
			echo "------------------------------------------"
			echo "Complete"
			echo "------------------------------------------"
			echo
				cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_complete.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			echo
			read;
			NMAP
			read;
			elif [ $NUM -eq "3" ]; then
			echo
			echo "------------------------------------------"
			echo "HOSTs UP"
			echo "------------------------------------------"
			echo
				cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_UP.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read;
			NMAP
			read;
			elif [ $NUM -eq "4" ]; then
			echo
			echo "------------------------------------------"
			echo "SSL"
			echo "------------------------------------------"
			echo
				cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINATION"_ssl.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read;
			NMAP
			read;
			elif [ $NUM -ne "1, 2, 3, 4" ]; then
			clear	
			echo
			echo "Invalid option"; sleep 3; Donation;
			fi
			read; NMAP;;
		6)
		clear	
		echo "------------------------------------------"
		echo "List do files to be deleted"
		echo "------------------------------------------"
		echo
			cd ~/Script/NMAP/
			pwd
		echo
			cd ->/dev/null
		echo
			ls -lah ~/Script/NMAP/
		echo
		echo
		echo "------------------------------------------"
		echo "Do you really want to delete the file (s)?"
		echo "Type y or n"
		echo "------------------------------------------"
		read RESP
		echo
		echo
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" = "y" ]; then
			echo
			echo
			echo "------------------------------------------"
			echo "Deleting LOG files"
			echo "------------------------------------------"
			echo
				rm -rf ~/Script/NMAP/*
			echo
			echo
			echo "------------------------------------------"
			echo "Deleted LOG files"
			echo "------------------------------------------"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			NMAP;
			fi
			if [ "$RESP" = "n" ]; then
			echo
			echo "Returning to the NMAP menu"
			sleep 1; NMAP;
			fi;
			NMAP;;
		7)clear; Main;;
		*)clear; echo; echo "Invalid option"; sleep 3; NMAP;;
esac
}
# ------------- 2 - NMAP End ----------- #

# ------------- 3 - NSLookUP Begin ----------- #
NSLookUP ()
{
			clear	
	echo "-------------------------------------------"
	echo "NSLookUP"
	echo "-------------------------------------------"
	echo
	echo
	echo "-------------------------------------------"
	echo "1 - Standard NSLookUP"
	echo "2 - Standard NSLookUP - Saving"
	echo "3 - NSLookUP MX, NS and SOA"
	echo "4 - NSLookUP MX, NS and SOA - Saving"
	echo -e "5 - \033[01;31mDelete \033[0m \033[01;5;31mALL \033[0m LOG files"
	echo "6 - Main Menu"
	echo "-------------------------------------------"
	echo
	read NUM
	case $NUM in
		1 )
		clear	
		echo
		echo "------------------------------------------"
		echo
		echo "Enter the IP or website to search for";
		echo
		echo "------------------------------------------"
		read PESQ
		echo
		echo
		echo "-------------------------------------------"
		echo "Searching site:"$PESQ;
		echo "-------------------------------------------"
		echo
			nslookup -all $PESQ;
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
		echo "------------------------------------------"
		echo
		read
		clear	
		NSLookUP;;
		2 )
		clear	
		echo
		echo "------------------------------------------"
		echo
		echo "Enter the IP or website to search for";
		echo
		echo "------------------------------------------"
						read PESQ
		echo
		echo
		echo
			if [ ! -d "~/Script/NSLookUP" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
				sudo mkdir -m 777 -p ~/Script/NSLookUP/
				
			fi;

		echo
		echo
		echo "-------------------------------------------"
		echo "Searching site:"$PESQ;
		echo "-------------------------------------------"
		echo
			
				sudo touch ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
				sudo chmod -R 777 ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
				sudo nslookup -all $PESQ >> ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
		echo
		echo "------------------------------------------"
		echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
				NSLookUP;;
			3 )
			clear
			echo
			echo "------------------------------------------"
			echo
			echo "Type mx, ns or soa";
			echo
			echo "------------------------------------------"
			read TYPE
			echo
			echo "------------------------------------------"
			echo
			echo "Enter the website (www) for search";
			echo
			echo "------------------------------------------"
			read PESQ
			echo
			echo "-------------------------------------------"
			echo "Searching"$TYPE "of the site:"$PESQ;
			echo "-------------------------------------------"
			echo
			nslookup -type=$TYPE $PESQ;
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
			NSLookUP;;
			4 )
			clear
			echo
			echo "------------------------------------------"
			echo
			echo "Type mx, ns or soa";
			echo
			echo "------------------------------------------"
			read TYPE
			echo
			echo "------------------------------------------"
			echo
			echo "Enter the website (www) for search";
			echo
			echo "------------------------------------------"
			read PESQ
			echo
			echo
			echo
			echo
			if [ ! -d "~/Script/NMAP" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
				sudo mkdir -m 777 -p ~/Script/NSLookUP/
			fi;
			echo
			echo
			echo "-------------------------------------------"
			echo "Searching site:"$PESQ;
			echo "-------------------------------------------"
			echo
				sudo nslookup -type=$TYPE $PESQ >> ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup_mx_ns_soa.txt;
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
			NSLookUP;;
			5 )
			clear
			echo "------------------------------------------"
			echo "List of files to be deleted"
			echo "------------------------------------------"
			echo
			cd ~/Script/NSLookUP/
			pwd
			echo
			cd ->/dev/null
			echo
			ls -lah ~/Script/NSLookUP/
			echo
			echo
			echo "------------------------------------------"
			echo "Do you really want to delete the file (s)?"
			echo "Type y or n"
			echo "------------------------------------------"
			read RESP
			echo
			echo
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" =  "y" ]; then
			echo
			echo
			echo "------------------------------------------"
			echo "Deleting LOG files"
			echo "------------------------------------------"
			echo

			rm -rf ~/Script/NSLookUP/*.*
			echo
			echo
			echo "------------------------------------------"
			echo "Deleted LOG files"
			echo "------------------------------------------"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			NMAP;
			fi
			if [ "$RESP" =  "n" ]; then
			echo
			echo "Returning to the NSLookUP menu"
			sleep 1; NSLookUP;
			fi;
			NSLookUP;;
			6 ) clear; Main;;
			* )echo; echo; echo "Invalid option"; sleep 3; clear; NSLookUP;;
esac
}
# ------------- 3 - NSLookUP End ----------- #

# ------------- 4 - Nikto Begin ----------- #

Nikto ()
{
			clear
			echo "-------------------------------------------"
			echo "Nikto"
			echo "-------------------------------------------"
			echo
			echo
			echo "-------------------------------------------"
			echo "1 - Search"
			echo "2 - Update"
			echo -e "3 - \033[01;31mDelete \033[0m \033[01;5;31mALL \033[0m LOG files"
			echo "4 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			case $NUM in
			1 )
			clear
			echo
			echo "------------------------------------------"
			echo
			echo "Which HOST to check?";
			echo
			echo "------------------------------------------"
			read HOST
			echo
			echo
			echo
			if [ ! -d "~/Script/NIKTO" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
			sudo mkdir -m 777 -p ~/Script/NIKTO/LOG
			fi;
        
			if [ ! -d "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml" ]; then
			touch ~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml;
			echo
			echo "Folder "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml "created successfully";
			echo
			else
			echo
			echo "Directory "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml "already exists";
			echo
			fi;
			echo
			echo "The file will be saved to "~/Script/NIKTO/LOG
			echo
			echo "-------------------------------------------"
			echo "Searching -> "$HOST;
			echo "-------------------------------------------"
			echo
			cd ~/Script/NIKTO/nikto/program
			./nikto.pl -h $HOST -output ~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml;
			cd -
 			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
			Nikto;;
			2 )
			clear
			echo
			echo "-------------------------------------------"
			echo "Updating Nikto"
			echo "-------------------------------------------"
			echo
			cd ~/Script/NIKTO/
			sudo rm -rf nikto
			sudo git clone https://github.com/sullo/nikto
			cd -
			echo
			echo
			echo "-------------------------------------------"
			echo "Update complete"
			echo "-------------------------------------------"
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			echo
			read
			clear
			Nikto;;
			3 )
			clear
			echo "------------------------------------------"
			echo "List of files to be deleted"
			echo "------------------------------------------"
			echo
			cd ~/Script/NIKTO/LOG/
			pwd
			echo
			cd ->/dev/null
			echo
			ls -lah ~/Script/NIKTO/LOG/
			echo
			echo
			echo "------------------------------------------"
			echo "Do you really want to delete the file (s)?"
			echo "Type y or n"
			echo "------------------------------------------"
			read RESP
			echo
			echo
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" =  "y" ]; then
			echo
			echo
			echo "------------------------------------------"
			echo "Deleting LOG files"
			echo "------------------------------------------"
			echo
			rm -rf ~/Script/NIKTO/LOG/*.xml
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Nikto;
			fi
			if [ "$RESP" =  "n" ]; then
			echo
			echo "Returning to the NIKTO menu"
			sleep 1; Nikto;
			fi;
			Nikto;;
			4 ) Main;;
			* ) echo "Invalid option"; sleep 3; Nikto;;
 esac
}
# ------------- 4 - Nikto End ----------- #



# ------------- 5 - MasScan Begin ----------- #

MasScan ()
{
			clear
			echo "-------------------------------------------"
			echo "MasScan"
			echo "-------------------------------------------"
			echo
			echo
			echo "-------------------------------------------"
			echo "1 - Simple scan"
			echo -e "2 - \033[01;31mDelete \033[0m \033[01;5;31mALL \033[0m the Pause.conf File (s)"
			echo "3 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			case $NUM in
			1 )
			clear
			echo
			echo "-------------------------------------------"
			echo "Simple scan"
			echo "-------------------------------------------"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo
			echo "Enter the IP or range to be scanned"
			echo
			echo "------------------------------------------"
			echo
			echo
			read IP
			echo
			if [ ! -d "~/Script/MasScan" ]; then
			sudo mkdir -p -m 777 ~/Script/MasScan/
			fi;
			if [ ! -d "~/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf" ]; then
			touch ~/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf;
			fi;
			echo
			echo "------------------------------------------"
			echo "The file will be saved to "~/Script/MasScan/
			echo "------------------------------------------"
			echo
			echo
			echo "------------------------------------------"
			echo "Enter 0-65535 port (s)"
			echo "------------------------------------------"
			read PORT
			sudo masscan $IP --ports $PORT --resume ~/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
			MasScan;;

			2 )
			clear
			echo "------------------------------------------"
			echo "List of files to be deleted"
			echo "------------------------------------------"
			echo
			cd ~/Script/MasScan/
			pwd
			echo
			cd ->/dev/null
			echo
			ls -lah ~/Script/MasScan/
			echo
			echo
			echo "------------------------------------------"
			echo "Do you really want to delete the file (s)?"
			echo "Type y or n"
			echo "------------------------------------------"
			read RESP
			echo
			echo
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			clear
			echo
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" =  "y" ]; then
			clear
			echo
			echo
			echo
			rm -rf ~/Script/MasScan/*.*
			echo
			echo
			echo "------------------------------------------"
			echo "Deleted LOG files"
			echo "------------------------------------------"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			MasScan;
			fi
			if [ "$RESP" =  "n" ]; then
			echo
			echo "Returning to the MasScan menu"
			sleep 1; MasScan;
			fi;
			MasScan;;
			3 ) Main;;
			* )echo "Invalid option"; sleep 3; MasScan;;
esac
}
# ------------- 5 - MasScan End ----------- #

# ------------- 6 - Begin Recognition ----------- #
Recognition ()
{
			clear
			echo "-------------------------------------------"
			echo "WEB recognition"
			echo "-------------------------------------------"
			echo
			echo "-------------------------------------------"
			echo "1 - Run the WEB recognition"
			echo "2 - Read the results"
			echo "3 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			case $NUM in
			1 )
			clear
			echo "-------------------------------------------"
			echo "Performing Recognition"
			echo "-------------------------------------------"
			echo
			echo "Enter the IP:"
			read IP
			if [ "$IP" == "" ]
				then
					echo "You forgot your IP address or Site !!"
					echo "Example: 192.168.1 / www.test.com"
					sleep 1; Recognition;
			fi
			if [ ! -d "~/Script/Recognition" ]; then
			sudo mkdir -p -m 777 ~/Script/Recognition/
			fi;
			if [ ! -d "~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt" ]; then
				touch ~/Script/Recognition/$(date +%d-%m-%Y)__"$IP"_recognition.txt;
				echo
				echo "Folder "~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt "successfully created";
				echo
			else
				echo
				echo "Folder "~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt "already exists";
				echo
			fi;
			echo >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			printf " ----- NMAP -----" >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo "Running Nmap ..."
			sudo nmap $IP >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			printf " ----- Gobuster -----" >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo "Running Gobuster ..."
			gobuster dir -u http://$IP -w /usr/share/dirb/wordlists/common.txt -t 20 >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			printf " ----- WhatWeb -----" >> ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo "Running WhatWeb ..."
			whatweb -v -a 3 $IP
			sleep 3; Recognition;;
			2 )
			clear
			echo "-------------------------------------------"
			echo "			reading Results"
			echo "-------------------------------------------"
			echo
			cat ~/Script/Recognition/$(date +%d-%m-%Y)_"$IP"_recognition.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Recognition;;
			3 ) Main;;
			* )echo "Invalid option"; sleep 3; Recognition;;
esac
}
# ------------- 6 - End Recognition ----------- #

# ------------- 7 - Softwares Begin ----------- #

Software ()
{
			clear
			echo "-------------------------------------------"
			echo "Softwares"
			echo "-------------------------------------------"
			echo
			echo
			echo "-------------------------------------------"
			echo "1 - Software search"
			echo "2 - Install software"
			echo "3 - Install script software"
			echo -e "4 - \033[01;5;31mRemove \033[0m software"
			echo -e "5 - \033[01;5;31mRemove \033[0m script software"
			echo "6 - Update all software"
			echo "7 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			case $NUM in
			1 )
			clear
			echo "-------------------------------------------"
			echo "Search software"
			echo "-------------------------------------------"
			echo
			echo "Enter the name of the program to be searched"
			read PROG
			echo
			echo "Do you want to pause the search?"
			echo "Type [y]es or [n]o"
			read RESP
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			echo
			echo "Invalid option. Type y or n"
			read RESP
			done
			if [ "$RESP" =  "y" ]; then
			sudo apt search $PROG | less
			sleep 3; Software;
			fi
			if [ "$RESP" =  "n" ]; then
			echo
			echo "Returning to the TCP Dump menu"
			echo
			sudo apt search $PROG
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;
			fi;;
			2 )
			clear
			echo "-------------------------------------------"
			echo "Install software"
			echo "-------------------------------------------"
			echo
			echo "Enter the name of the program to be installed"
			read PROG
			echo
			echo "-------------------------------------------"
			echo ".............. Updating .................."
			echo "-------------------------------------------"
			echo
			sudo apt update
			echo
			echo "-------------------------------------------"
			echo ".............. Updated ..................."
			echo "-------------------------------------------"
			echo
			echo "-------------------------------------------"
			echo ".......... Installed "$PROG" .............."
			echo "-------------------------------------------"
			echo
			sudo apt install $PROG -y | sudo apt install -f -y;
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;;
			3 )
			clear
			echo "-------------------------------------------"
			echo "Install script software"
			echo "-------------------------------------------"
			echo
			echo "-------------------------------------------"
			echo "curl whatweb masscan tcpdump nmap gobuster dnsutils"
			echo "-------------------------------------------"
			echo "Do you really want to install?"
			read RESP
			while [ "$RESP" != "y" -a "$RESP" != "n" ]; do
			clear
			echo
			echo
			echo
			echo "-------------------------------------------"
			echo "Invalid option. Type y or n"
			echo "-------------------------------------------"
			echo
			echo
			read RESP
			done
			if [ "$RESP"="y" ]; then
			sudo apt update -y && sudo apt install curl whatweb masscan tcpdump nmap gobuster dnsutils -y && sudo apt install -f -y;
			echo
			if [ ! -d "~/Script/NIKTO" ]; then
			echo "------------------------------------------"
			echo "Directory does not exist and will be created"
			echo "------------------------------------------"
			echo "~/Script/NIKTO/"
			echo "------------------------------------------"
			echo "Creating directory"
			echo "------------------------------------------"
			echo
			sudo mkdir -p -m 777 ~/Script/NIKTO/
			cd ~/Script/NIKTO
			sudo git clone https://github.com/sullo/nikto
			clear
			sleep 3; Software;
			fi
			if [ "$RESP"="n" ]; then
			echo "You give up the installation ...."
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;
			fi
			Software;
			fi;;
			4 )
			clear
			echo "-------------------------------------------"
			echo "Remove software"
			echo "-------------------------------------------"
			echo
			echo "Do you really want to remove it?"
			read RESP
			if [ $RESP="y" -o $RESP="y" ]; then
			echo "What software?"
			read SOFT
			sudo apt removes $SOFT -y | sudo apt purge $SOFT -y | sudo apt install -f -y | sudo apt update
			sleep 3; Software;
			else
			echo "You gave up on removal"
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;
			fi;;
			5 )
			clear
			echo "-------------------------------------------"
			echo "Remove software from the script"
			echo "-------------------------------------------"
			echo
			echo "-------------------------------------------"
			echo "masscan nikto tcpdump nmap dnsutils"
			echo "-------------------------------------------"
			echo
			echo "Do you really want to remove it?"
			read RESP
			if [ $RESP=s ]; then
			sudo apt remove curl whatweb masscan gobuster tcpdump nmap dnsutils -y | sudo apt purge curl whatweb masscan gobuster tcpdump nmap dnsutils -y | sudo apt install -f -y | sudo apt update | sudo cd Script/NIKTO | sudo rm -rf nikto | cd -
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;
			else
			echo "You gave up on the removal ...."
			sleep 3; Software;
			fi;;
			6 )
			clear
			echo "-------------------------------------------"
			echo "Updating software list"
			echo "-------------------------------------------"
			echo
			sudo apt update -y
			echo
			echo "-------------------------------------------"
			echo "Updating all software"
			echo "-------------------------------------------"
			echo
			sudo apt full-upgrade -y
			echo
			echo "-------------------------------------------"
			echo "Removing obsolete software"
			echo "-------------------------------------------"
			echo
			sudo apt autoremove -y
			echo
			echo "-------------------------------------------"
			echo "Fixing broken software"
			echo "-------------------------------------------"
			echo
			sudo apt install -f -y
			echo
			echo
			echo "-------------------------------------------"
			echo "			clearing local cache"
			echo "-------------------------------------------"
			echo
			sudo apt autoclean | sudo apt clean
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			Software;;
			7 ) Main;;
			* ) echo "Invalid option"; sleep 3; Software;;
esac
}

# ------------- 7 - End Software ----------- #

# ------------- 8 - IP Information Begin ----------- #

IPs ()
{
			clear
			echo "-------------------------------------------"
			echo "IP Information"
			echo "-------------------------------------------"
			echo
			echo
			while true
			do
			echo "-------------------------------------------"
			echo "1 - External IP - Real"
			echo "2 - Internal IP - Local/System"
			echo "3 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			if [[ "$NUM" = "1" ]]
			then
# ------------- External IP Information Begin ----------- #

IP_EXTERNAL=$(wget -qO- http://ipecho.net/plain)
country=$(curl ipinfo.io/"$IP_EXTERNAL"/country 2>/dev/null)
loc=$(curl ipinfo.io/"$IP_EXTERNAL"/loc 2>/dev/null)
city=$(curl ipinfo.io/"$IP_EXTERNAL"/city 2>/dev/null)
org=$(curl ipinfo.io/"$IP_EXTERNAL"/org 2>/dev/null)
postal=$(curl ipinfo.io/"$IP_EXTERNAL"/postal 2>/dev/null)
region=$(curl ipinfo.io/"$IP_EXTERNAL"/region 2>/dev/null)
hostname=$(curl ipinfo.io/"$IP_EXTERNAL"/hostname 2>/dev/null)
time_zone=$(curl ipinfo.io/"$IP_EXTERNAL"/timezone 2>/dev/null)
			clear
			echo -e "External IP: \033[01;5;31m $IP_EXTERNAL \033[0m"
			echo -e "Country: $country"
			echo -e "Region: $region"
			echo -e "Location: $loc"
			echo -e "City: $city"
			echo -e "Postal: $postal"
			echo -e "Hostname: $hostname"
			echo -e "Organization: $org"
			echo -e "Time zone: $time_zone"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
IPs;
# ------------- External IP Information End ----------- #
elif [[ "$NUM" = "2" ]]
then
			echo
			echo
			echo "------------------------------------------"
			echo "Internal IP and System Information"
			echo "------------------------------------------"
			echo
			echo

# ------------- Internal IP Information Begin ----------- #

IP_INTERNAL=$(hostname -I | awk '{print $1}' 2>/dev/null)
SO1=$(sudo lsb_release -a 2>/dev/null)
SO2=$(sudo getconf LONG_BIT 2>/dev/null)
SO3=$(sudo uptime 2>/dev/null)
SO4=$(sudo dmidecode -t 1, 12, 15, 23, 32 2>/dev/null)
BIOS=$(sudo dmidecode -t 0, 13 2>/dev/null)
PROCESSOR=$(sudo dmidecode -t 4 2>/dev/null)
STATISTICS=$(sudo mpstat 2>/dev/null)
MEMORY=$(sudo dmidecode -t 5, 6, 16, 17 2>/dev/null)
			clear
			echo "------------------------------------------ "
	echo -e "    \033[01;31mIP Local\033[0m: \033[44;1;5;37m\n\t$IP_INTERNAL\033[0m"
	echo  "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e "     \033[01;31mSistema 1\033[0m: \033[44;1;37m\n\t$SO1\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e "     \033[01;31mSistema 2\033[0m: \033[44;1;37m\n\t$SO2\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e "     \033[01;31mSistema 3\033[0m: \033[44;1;37m\n\t$SO3\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e "     \033[01;31mSistema 4\033[0m: \033[44;1;37m\n\t$SO4\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e " \033[01;31mBios\033[0m: \033[44;1;37m\n\t$BIOS\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e " \033[01;31mProcessador\033[0m: \033[44;1;37m\n\t$PROCESSADOR\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e " \033[01;31mEstatistica do Processador\033[0m:\n\t$ESTATISTICA\033[0m"
	echo "------------------------------------------ "
	echo
	echo
	echo "------------------------------------------ "
	echo -e -n " \033[01;31mProcessador\033[0m: \033[44;1;37m\n\t$MEMORIA\033[0m"
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
IPs;
elif [[ "$NUM" = "3" ]]
then
			clear
Main;
elif [[ "$NUM" -ne "1, 2, 3" ]]
then
			clear
			echo
			echo "Invalid option"; sleep 3; Donation;
fi
done

# ------------- Internal IP Information End ----------- #
}

# ------------- 8 - End IP Information ----------- #

# ------------- 9 - Social Media Information Begin ----------- #
Media ()
{
			clear
			echo "-------------------------------------------"
			echo "Social Media Information"
			echo "Sherlock"
			echo "-------------------------------------------"
			echo
			echo
while true
do
			echo "-------------------------------------------"
			echo "1 - Install Sherlock"
			echo "2 - Using TOR network"
			echo -e "3 - \033[01;5;31mNo\033[0m using TOR net"
			echo "4 - Main Menu"
			echo "-------------------------------------------"
			echo
			read NUM
			clear
if [[ "$NUM" = "1" ]]
then
# ------------- Install Sherlock ----------- #
if [ ! -d "~/sherlock" ]
then
cd ~/Script
sudo git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
sudo python3 -m pip install -r requirements.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
Media;
fi
# ------------- Via TOR ----------- #
elif [[ "$NUM" = "2" ]]
then
cd ~/Script/sherlock
			echo
			echo
			echo -e "Enter the name of the user to be searched."
			read USER
			echo
			clear
			echo
			echo
sudo python3 sherlock --tor $USER
sudo mv $USER.txt ~/Desktop
			clear
			echo
			echo -e "\033[1;36m$USER.txt\033[0m Saved to \033[1;36m ~/Desktop \033[0m"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
Media;
# ------------- NO TOR ----------- #
elif [[ "$NUM" = "3" ]]
then
cd ~/Script/sherlock
			echo
			echo
			echo -e "Enter the name of the user to be searched."
			read USER
			echo
			clear
			echo
			echo
sudo python3 sherlock $USER
			clear
sudo mv $USER.txt ~/Desktop
			echo
			echo -e "\033[1;36m$USER.txt\033[0m Saved to \033[1;36m ~/Desktop \033[0m"
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Press ENTER to continue"
			echo "------------------------------------------"
			read
			clear
Media;

# ------------- Back to Main Menu ----------- #
elif [[ "$NUM" = "4" ]];
then
			clear
Main;
elif [[ "$NUM" -ne "1, 2, 3, 4" ]]
then
			clear
			echo
			echo "Invalid option"; sleep 3; Media;
fi
done

}
# ------------- 9 - Social Media Information End ----------- #

# ------------- 10 - Donation Start ----------- #

Donation ()
{
			clear	
	echo
	echo
	echo "------------------------------------------- "
	echo "                  Donation                    "
	echo "------------------------------------------- "
	echo
	echo
	echo "----------------------------------------------------------------- "
	echo "This account is located in Brazil."
	echo "For me to receive your coffee, the transfer works only in two ways:"
	echo "First: TransferWise (https://transferwise.com/), it's free."
	echo "Second: PayPal"
	echo "But, if you know anoter way, be my ghest ;) "
	echo "My e-mail is: paim.mauricio@gmail.com"
	echo "----------------------------------------------------------------- "
	while true
		do
		echo "Se você gostou do meu script e quiser, pode me pagar um café."
		echo -e "1 - QR Code \033[01;34mPayPal\033[0mm"
		echo -e "2 - Site \033[01;34mPayPal\033[0m"
		echo "3 - Bank data (Bank transfer)"
		echo "4 - Back"
		echo "Choose an Option: "
						read DONATION
			if [[ "$DONATION" = "1" ]]
				then
	echo
	echo
			clear	
	echo
	echo
	echo " Your browser will open next!"
					sleep 3
	echo
	echo
					gio open "https://github.com/paimmauricio/Script-Rede/blob/main/QRs/QR_Code_PayPal.png" 2>/dev/null
			clear	
					Donation;
			elif [[ "$DONATION" = "2" ]]
				then
	echo
	echo
			clear	
	echo
	echo
	echo " Your browser will open next!"
					sleep 3
	echo
	echo
					gio open "https://www.paypal.com/donate?hosted_button_id=YJNX67EAAHNCU" 2>/dev/null
			clear	
					Donation;
			
			elif [[ "$DONATION" = "3" ]]
				then
			clear	
	echo
	echo
	echo -e "\033[01;35m				 Branch\033[0m : \033[44;1;37m 0001 \033[0m"
	echo -e "\033[01;35mChecking account  / Current account\033[0m : \033[44;1;37m281087-1 \033[0m"
	echo -e "\033[01;35m 	Bank 260 - Nu Pagamentos S.A. (Nubank) \033[0m"
	echo
	echo
	echo
	echo "------------------------------------------"
	echo "Press ENTER to continue"
	echo "------------------------------------------"
								read
	echo
	echo
			clear	
					Donation;
			elif [[ "$DONATION" = "4" ]]
				then
			clear	
					Principal;
			elif [[ "$DONATION" -ne "1,2,3,4" ]]
				then
			clear	
	echo
	echo "Invalid option"; sleep 3; Donation;
			fi
done
}

# ------------- 10 - End Donation ----------- #

Main
