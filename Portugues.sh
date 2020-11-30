#!/bin/bash
#################################
#
# Autor: Maurício Paim - paim.mauricio@gmail.com
# Versão: 2.3
# Data: 08/10/2020
# Script Rede
# Ao usar o script você assume
# TODA a responsabilidade por seu uso 
#
##################################

#------------------  Cores Início  ------------------#

# variaveis
corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

#------------------  Cores Fim  ------------------#


Principal ()
{
	clear
#-------------   Menu Principal Início   -----------#
	echo "-----------------------------------------------------"
	echo "      1 - TCP Dump"
	echo "      2 - NMAP"
	echo "      3 - NSLookUP"
	echo "      4 - Nikto"
	echo "      5 - MasScan"
	echo "      6 - Reconhecimento"
	echo "      7 - Softwares"
	echo "      8 - Informações de IP"
	echo "      9 - Informações de Mídias Sociais"
	echo "      d - Doação"
	echo "      x - Sair"
	echo "-----------------------------------------------------"
	echo -n "Escolha uma das opções: "
	read OPCAO
# Usuário ira escolher um número da lista que será lido pela (read) OPCAO
# Que será redirecionado conforme sua escolha (Ex: Digitar 1 será redirecionado
# para a opção 1 da lista abaixo)
case $OPCAO in
	1 ) TCPDump;;
	2 ) NMAP;;
	3 ) NSLookUP;;
	4 ) Nikto;;
	5 ) MasScan;;
	6 ) Reconhecimento;;
	7 ) Software;;
	8 ) IPs;;
	9 ) Midias;;
	d ) Doacao;;
        x ) echo; echo; echo ".........Bye Bye........."; sleep 2; clear; exit 0;;
	* ) echo; echo; echo "Opção inválida"; sleep 3; Principal;;
esac
}
#-------------   Menu Principal Fim   -----------#

#-------------   1 - TCP Dump Inicio   -----------#

TCPDump ()
{
	clear
	echo
	echo
	echo
	echo
	echo
	echo
	echo "------------------------------------------ "
	echo "Escolha a placa de rede"
	echo "------------------------------------------ "
	echo
		ip addr show
	echo
	echo "------------------------------------------ "
	echo
	echo "------------------------------------------"
	echo "1 - Placa nº 1 - Com log"
	echo "2 - Placa nº 2 - Com log"
	echo "3 - Placa nº 1 - Sem log"
	echo "4 - Placa nº 2 - Sem log"
	echo "5 - Mostrar placas de redes"
	echo -e "6 - \033[01;31mApagar\033[0m \033[01;5;31mTODOS\033[0m arquivos de LOG"
	echo "7 - Menu Principal"
	echo "------------------------------------------ "
	echo
	echo "Escolha uma Opção: "
	read PLACA
	echo
case $PLACA in
	1 )
		clear
		echo
		echo "Digite um nome para o arquivo de log: "
		read LOG;
		echo
		echo
		if [ ! -d "~/Script/TCPDump" ]; then
                echo "------------------------------------------ "
                echo " Diretório não existe e será criado        "
                echo "------------------------------------------ "
                echo
                echo "------------------------------------------ "
                echo " Criando diretório                         "
                echo "------------------------------------------ "
                echo
		sudo mkdir -p -m 777 ~/Script/TCPDump/
		sudo touch ~/Script/TCPDump/$LOG
		sudo chmod -R 777 ~/Script/TCPDump/$LOG
		fi;
		PLACA1=$(sudo ip addr show | grep '^1: ' | cut -d : -f2);
		echo
		echo "------------------------------------------ "
		echo "Placa escolida foi :"$PLACA1;
		echo "------------------------------------------ "
		echo
		echo "------------------------------------------ "
		echo "Criando arquivo de log....."
		echo "------------------------------------------ "
		echo
		sudo tcpdump -vv -i $PLACA1 >> ~/Script/TCPDump/$LOG;
		echo
		echo "------------------------------------------ "
		echo "Arquivo de log criado com sucesso....."
		echo "------------------------------------------ "
		echo
		echo "------------------------------------------ "
		echo "Deseja ver o arquivo de log?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
			echo
		done
		if [ "$RESP" = "s" ]; then
			sudo cat ~/Script/TCPDump/$LOG |less
			echo
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			TCPDump;
		fi
		if [ "$RESP" = "n" ]; then
			echo

			echo "------------------------------------------ "
			echo "Voltando para o menu do TCP Dump"
			echo "------------------------------------------ "
			sleep 1; TCPDump;
		fi;;
	2 )
		clear
		echo
		echo "Digite um nome para o arquivo de log: "
		read LOG;
		echo
		echo
		if [ ! -d "~/Script/TCPDump" ]; then
			echo "------------------------------------------ "
			echo " Diretório não existe e será criado        "
			echo "------------------------------------------ "
			echo
			echo "------------------------------------------ "
			echo "         ~/Script/TCPDump/                 "
			echo "------------------------------------------ "
			echo
			sudo mkdir -p -m 777 ~/Script/TCPDump/
			sudo touch ~/Script/TCPDump/$LOG
			sudo chmod -R 777 ~/Script/TCPDump/$LOG
		fi;
			PLACA2=$(sudo ip addr show | grep '^2: ' | cut -d : -f2);
		echo
		echo
		sleep 2
		clear
		echo
		echo "------------------------------------------ "
		echo "Placa escolida foi :"$PLACA2;
		echo "------------------------------------------ "
		echo
		echo "------------------------------------------ "
		echo "Criando arquivo de log....."
		echo "------------------------------------------ "
		echo
		sudo tcpdump -vv -i $PLACA2 >> ~/Script/TCPDump/$LOG;
		echo
		echo "------------------------------------------ "
		echo "Arquivo de log criado com sucesso....."
		echo "------------------------------------------ "
		echo
		echo "------------------------------------------ "
		echo "Deseja ver o arquivo de log?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
			echo
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
		done
		if [ "$RESP" = "s" ]; then
			sudo cat ~/Script/TCPDump/$LOG |less
			echo
			echo		echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			echo
			echo
			read
			TCPDump;
		fi
		if [ "$RESP" = "n" ]; then
			echo
			echo "------------------------------------------ "
			echo "Voltando para o menu do TCP Dump"
			echo "------------------------------------------ "
			sleep 1; TCPDump;
		fi;;
	3 )
		clear
		echo
		PLACA1=$(sudo ip addr show | grep '^1: ' | cut -d : -f2);
		echo "------------------------------------------ "
		echo
		echo "Placa escolida foi :"$PLACA1;
		echo
		echo "------------------------------------------ "
		echo
		sudo tcpdump -vv -i $PLACA1;
		echo
		echo "------------------------------------------ "
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------ "
		read
		TCPDump;;
	4 )
		clear
		echo
		PLACA2=$(ip addr show | grep '^2: ' | cut -d : -f2);
		echo
		echo "------------------------------------------ "
		echo
		echo "Placa escolida foi :"$PLACA2;
		echo
		echo "------------------------------------------ "
		echo
		sudo tcpdump -vv -i $PLACA2;
		sleep 3; TCPDump;;
	5 )
		clear
		ip addr show;
		echo
		echo
		echo
		echo "------------------------------------------ "
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------ "
		echo
		read
		TCPDump;;
	6 )
		clear
		echo "------------------------------------------ "
		echo "  Lista de arquivos que serão deletados    "
		echo "------------------------------------------ "
		echo
		cd ~/Script/TCPDump/
		pwd
		echo
		cd - >/dev/null
		echo
		ls -lah ~/Script/TCPDump/
		echo
		echo
		echo "------------------------------------------ "
		echo "Deseja realmente deletar o(s) arquivo(s)?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		echo
		echo
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
			done
		if [ "$RESP" = "s" ]; then
			echo
			echo
			echo "------------------------------------------ "
			echo "        Apagando arquivos de LOG           "
			echo "------------------------------------------ "
			echo

			rm -rf ~/Script/TCPDump/*
			echo
			echo
			echo "------------------------------------------ "
			echo "       Arquivos de LOG deletados   "
			echo "------------------------------------------ "
			echo
			echo
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			read
			TCPDump;
		fi
		if [ "$RESP" = "n" ]; then
			echo
			echo "Voltando para o menu do TCP Dump"
			sleep 1;TCPDump;
		fi;
		TCPDump;;
		7 ) Principal;;
		* ) echo "Opção inválida"; sleep 2; TCPDump;;
esac
}

#-------------   1 - TCP Dump Fim   -----------#

#-------------   2 - NMAP Inicio   -----------#
NMAP ()
{
		clear
		echo
		echo
		echo
		echo
		echo
		echo
		echo "------------------------------------------- "
		echo "                    NMAP                    "
		echo "------------------------------------------- "
		echo
		echo
		echo "------------------------------------------ "
		echo "1 - IPV 4 - Padrão"
		echo "2 - IPV 4 - Completo"
		echo "3 - IPV 4 - Verifica se host está UP"
		echo "4 - SSL - Pesquisa SSL"
		echo "5 - Ler arquivo de coleta"
		echo -e "6 - \033[01;31mApagar\033[0m \033[01;5;31mTODOS\033[0m arquivos de LOG"
		echo "7 - Menu Principal"
		echo "------------------------------------------ "
		echo
		read NUM
		case $NUM in
			1 )
				clear
				echo
				echo "------------------------------------------ "
				echo
				echo "           Padrão               "
				echo "Digite o IP ou site de destino: "
				echo
				echo "------------------------------------------ "
				echo
				read DESTINO;
				echo
				if [ ! -d "~/Script/NMAP/" ]; then
				echo "------------------------------------------ "
				echo " Diretório não existe e será criado        "
				echo "------------------------------------------ "
				echo
				echo "------------------------------------------ "
				echo " Criando diretório                         "
				echo "------------------------------------------ "
				echo
				sudo mkdir -p -m 777 ~/Script/NMAP/
				fi;
				echo
				echo "------------------------------------------ "
				echo "O arquivo de coleta é: ~/Script/NMAP/"$(date +%d-%m-%Y)"_"$DESTINO"_padrao.txt"
				echo "------------------------------------------ "
				echo
				sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_padrao.txt
				sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_padrao.txt
				sudo nmap $DESTINO >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_padrao.txt
				echo
				echo "------------------------------------------ "
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------ "
				echo
				read
				NMAP;;
			2 )
				clear
				echo
				echo "------------------------------------------ "
				echo
				echo "          Completo"
				echo "Digite o IP ou site de destino: "
				echo
				echo "------------------------------------------ "
				echo
				read DESTINO;
				echo
				if [ ! -d "~/Script/NMAP" ]; then
					echo "------------------------------------------ "
					echo " Diretório não existe e será criado        "
					echo "------------------------------------------ "
					echo
					echo "------------------------------------------ "
					echo " Criando diretório                         "
					echo "------------------------------------------ "
					echo
					sudo mkdir -p -m 777 ~/Script/NMAP
					echo
				fi;
					echo
					echo "O arquivo de coleta é: "~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_completo.txt;
					echo
					sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_completo.txt
					sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_completo.txt
					sudo nmap -A -R -T4 $DESTINO >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_completo.txt
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					echo
					read
					NMAP;;
		3 )
			clear
			echo
			echo "------------------------------------------ "
			echo "            HOST UP "
			echo "Digite o IP ou site de destino: ";
			echo
			echo "------------------------------------------ "
			echo
			read DESTINO;
			echo
			if [ ! -d "~/Script/NMAP" ]; then
				echo "------------------------------------------ "
				echo " Diretório não existe e será criado        "
				echo "------------------------------------------ "
						echo
						echo "------------------------------------------ "
						echo " Criando diretório                         "
						echo "------------------------------------------ "
						echo
				sudo mkdir -m 777 -p ~/Script/NMAP
			fi;
			echo
			echo "O arquivo de coleta é: " ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_UP.txt
			echo
			sudo touch  ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_UP.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_UP.txt
			sudo nmap -sP -R -T4 $DESTINO >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_UP.txt
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			echo
			read
			NMAP;;

		4 )
			clear
			echo
			echo "------------------------------------------ "
			echo
			echo "          SSL"
			echo "Digite o IP ou Site sem WWW"
			echo
			echo "------------------------------------------ "
			echo
			read IP;
			echo
			echo "------------------------------------------ "
			echo
			echo "     SSL"
			echo "Digite a porta "
			echo
			echo "------------------------------------------ "
			echo
			read PORTA;
			echo
			if [ ! -d "~/Script/NMAP" ]; then
				echo "------------------------------------------ "
				echo " Diretório não existe e será criado        "
				echo "------------------------------------------ "
				echo
				echo "------------------------------------------ "
				echo " Criando diretório                         "
				echo "------------------------------------------ "
				echo
				sudo mkdir -m 777 -p ~/Script/NMAP
				echo
			fi;
			echo
			echo "O arquivo de coleta é: "~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_ssl.txt;
			echo
			sudo touch ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_ssl.txt
			sudo chmod -R 777 ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_ssl.txt
			sudo nmap -vv --script ssl-cert,ssl-enum-ciphers -p $PORTA $DESTINO >> ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_ssl.txt
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			echo
			read
			NMAP;;
	5 )
		clear
		echo
		echo
		echo
		echo
		echo
		echo
		echo
		echo "------------------------------------------ "
		echo
		echo " Ler arquivos coletados     "
		echo
		echo "------------------------------------------ "
		echo
		echo "------------------------------------------ "
		echo " 1 - Padrão"
		echo " 2 - Completo"
		echo " 3 - Host UP"
		echo " 4 - SSL"
		echo " 5 - Menu NMAP"
		echo "------------------------------------------ "
		echo
		read NUM
		if [ $NUM -eq "1" ]; then
			echo
			echo "------------------------------------------ "
			echo "                   Padrão                  "
			echo "------------------------------------------ "
			echo
			cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_padrao.txt
			echo
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			echo
			read;
			NMAP
			read;
		elif [ $NUM -eq "2" ]; then
			echo
			echo "------------------------------------------ "
			echo "                 Completo                  "
			echo "------------------------------------------ "
			echo
			cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_completo.txt
			echo
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			echo
			read;
			NMAP
			read;
		elif [ $NUM -eq "3" ]; then
			echo
			echo "------------------------------------------ "
			echo "               HOSTs UP                    "
			echo "------------------------------------------ "
			echo
			cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_UP.txt
			echo
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			read;
			NMAP
			read;
		elif [ $NUM -eq "4" ]; then
			echo
			echo "------------------------------------------ "
			echo "               SSL                    "
			echo "------------------------------------------ "
			echo
			cat ~/Script/NMAP/$(date +%d-%m-%Y)_"$DESTINO"_ssl.txt
			echo
			echo
			echo "------------------------------------------ "
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------ "
			read;
			NMAP
			read;
		elif [ $NUM -ne "1, 2, 3, 4" ]; then

			clear
			echo
			echo "Opção inválida"; sleep 3; Doacao;

		fi
			read; NMAP;;
	6 )
		clear
		echo "------------------------------------------ "
		echo "  Lista de arquivos que serão deletados    "
		echo "------------------------------------------ "
		echo
		cd ~/Script/NMAP/
		pwd
		echo
		cd - >/dev/null
		echo
		ls -lah ~/Script/NMAP/
		echo
		echo
		echo "------------------------------------------ "
		echo "Deseja realmente deletar o(s) arquivo(s)?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		echo
		echo
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do		
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
		done
		if [ "$RESP" = "s" ]; then
		echo
		echo
		echo "------------------------------------------ "
		echo "        Apagando arquivos de LOG           "
		echo "------------------------------------------ "
		echo

		rm -rf ~/Script/NMAP/*
		echo
		echo
		echo "------------------------------------------ "
		echo "       Arquivos de LOG deletados   "
		echo "------------------------------------------ "
		echo
		echo
		echo
		echo "------------------------------------------ "
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------ "
		read
		NMAP;
		fi
		if [ "$RESP" = "n" ]; then
		echo
		echo "Voltando para o menu do NMAP"
		sleep 1;NMAP;
		fi;
		NMAP;;

		7 ) clear; Principal;;
		* ) clear; echo; echo "Opção inválida"; sleep 3; NMAP;;
esac
}
#-------------   2 - NMAP Fim   -----------#

#-------------   3 - NSLookUP Inicio   -----------#
NSLookUP ()
{
	clear

	echo "------------------------------------------- "
	echo "                NSLookUP                    "
	echo "------------------------------------------- "
	echo
	echo
	echo "------------------------------------------- "
	echo "1 - NSLookUP Padrão"
	echo "2 - NSLookUP Padrão - Salvando"
	echo "3 - NSLookUP MX, NS e SOA"
	echo "4 - NSLookUP MX, NS e SOA - Salvando"
	echo -e "5 - \033[01;31mApagar\033[0m \033[01;5;31mTODOS\033[0m arquivos de LOG"
	echo "6 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 )
			clear
			echo
			echo "------------------------------------------ "
			echo
			echo "Digite o IP ou site para pesquisa";
			echo
			echo "------------------------------------------ "
			read PESQ
			echo
			echo
			echo "------------------------------------------- "
			echo "    Pesquisando site: "$PESQ;
			echo "------------------------------------------- "
			echo
			nslookup -all $PESQ;
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			echo
			read
			clear
			NSLookUP;;
	2 )
		clear
		echo
		echo "------------------------------------------ "
		echo
		echo "Digite o IP ou site para pesquisa";
		echo
		echo "------------------------------------------ "
		read PESQ
		echo
		echo
		echo
		if [ ! -d "~/Script/NSLookUP" ]; then
			echo "------------------------------------------ "
			echo " Diretório não existe e será criado        "
			echo "------------------------------------------ "
			echo
			echo "------------------------------------------ "
			echo " Criando diretório                         "
			echo "------------------------------------------ "
			echo
			sudo mkdir -m 777 -p ~/Script/NSLookUP/
		fi;
			echo
			echo
			echo "------------------------------------------- "
			echo "    Pesquisando site: "$PESQ;
			echo "------------------------------------------- "
			echo
				sudo touch ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
				sudo chmod -R 777 ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
				sudo nslookup -all $PESQ >> ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup.txt
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			clear
			NSLookUP;;
	3 )
		clear
		echo
		echo "------------------------------------------ "
		echo
		echo "Digite mx, ns ou soa";
		echo
		echo "------------------------------------------ "
		read TIPO
		echo
		echo "------------------------------------------ "
		echo
		echo "Digite o site (www) para pesquisa";
		echo
		echo "------------------------------------------ "
		read PESQ
		echo
		echo "------------------------------------------- "
		echo "    Pesquisando " $TIPO " do site: "$PESQ;
		echo "------------------------------------------- "
		echo
		nslookup -type=$TIPO $PESQ;
		echo
		echo "------------------------------------------"
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------"
		read
		clear
		NSLookUP;;
	4 )
		clear
		echo
		echo "------------------------------------------ "
		echo
		echo "Digite mx, ns ou soa";
		echo
		echo "------------------------------------------ "
		read TIPO
		echo
		echo "------------------------------------------ "
		echo
		echo "Digite o site (www) para pesquisa";
		echo
		echo "------------------------------------------ "
		read PESQ
		echo
		echo
		echo
		echo
		if [ ! -d "~/Script/NMAP" ]; then
			echo "------------------------------------------ "
			echo " Diretório não existe e será criado        "
			echo "------------------------------------------ "
			echo
			echo "------------------------------------------ "
			echo " Criando diretório                         "
			echo "------------------------------------------ "
			echo
			sudo mkdir -m 777 -p ~/Script/NSLookUP/
		fi;
		echo
		echo
		echo "------------------------------------------- "
		echo "    Pesquisando site: "$PESQ;
		echo "------------------------------------------- "
		echo
			sudo nslookup -type=$TIPO $PESQ >> ~/Script/NSLookUP/$(date +%d-%m-%Y)_"$PESQ"_nslookup_mx_ns_soa.txt;
		echo
		echo "------------------------------------------"
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------"
		read
		clear
		NSLookUP;;
	5 )
		clear
		echo "------------------------------------------ "
		echo "  Lista de arquivos que serão deletados    "
		echo "------------------------------------------ "
		echo
		cd ~/Script/NSLookUP/
		pwd
		echo
		cd - >/dev/null
		echo
		ls -lah ~/Script/NSLookUP/
		echo
		echo
		echo "------------------------------------------ "
		echo "Deseja realmente deletar o(s) arquivo(s)?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		echo
		echo
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
		done
		if [ "$RESP" = "s" ]; then
			echo
			echo
			echo "------------------------------------------ "
			echo "        Apagando arquivos de LOG           "
			echo "------------------------------------------ "
			echo

			rm -rf ~/Script/NSLookUP/*.*
			echo
			echo
			echo "------------------------------------------ "
			echo "       Arquivos de LOG deletados   "
			echo "------------------------------------------ "
			echo
			echo
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			NMAP;
		fi
		if [ "$RESP" = "n" ]; then
			echo
			echo "Voltando para o menu do NSLookUP"
			sleep 1;NSLookUP;
		fi;
			NSLookUP;;
	6 )
		clear;
		Principal;;
	* ) echo; echo; echo "Opção inválida"; sleep 3; clear; NSLookUP;;
esac
}
#-------------   3 - NSLookUP Fim   -----------#

#-------------   4 - Nikto Inicio   -----------#

Nikto ()
{
	clear
	echo "------------------------------------------- "
	echo "                Nikto                       "
	echo "------------------------------------------- "
	echo
	echo
	echo "------------------------------------------- "
	echo "1 - Pesquisar"
	echo "2 - Atualizar"
	echo -e "3 - \033[01;31mApagar\033[0m \033[01;5;31mTODOS\033[0m arquivos de LOG"
	echo "4 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 )
			clear
			echo
			echo "------------------------------------------ "
			echo
			echo "Qual o HOST a ser verificado?";
			echo
			echo "------------------------------------------ "
			read HOST
			echo
			echo
			echo
			if [ ! -d "~/Script/NIKTO" ]; then
				echo "------------------------------------------ "
				echo " Diretório não existe e será criado        "
				echo "------------------------------------------ "
				echo
				echo "------------------------------------------ "
				echo " Criando diretório                         "
				echo "------------------------------------------ "
				echo
				sudo mkdir -m 777 -p ~/Script/NIKTO/LOG
			fi;
        
			if [ ! -d "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)nikto.xml" ]; then
				touch ~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml;
				echo
				echo "Pasta "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml "criada com sucesso";
				echo
			else
				echo
				echo "Diretório "~/Script/NIKTO/LOG/$(date +%d-%m-%Y)_"$HOST"_nikto.xml" já exite";
				echo
			fi;
			echo
			echo "O arquivo será salvo em " ~/Script/NIKTO/LOG/
			echo
			echo "------------------------------------------- "
			echo "Pesquisando -> " $HOST;
			echo "------------------------------------------- "
			echo
			cd ~/Script/NIKTO/nikto/program       
			./nikto.pl -h $HOST -output ~/Script/NIKTO/$(date +%d-%m-%Y)_"$HOST"_nikto.xml;
			cd -
 
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			clear
			Nikto;;
	2 )
		clear
		echo
		echo "------------------------------------------- "
		echo "             Atualizando Nikto              "
		echo "------------------------------------------- "
		echo
			cd ~/Script/NIKTO/
			sudo rm -rf nikto
			sudo git clone https://github.com/sullo/nikto
			cd -
		echo
		echo
		echo "------------------------------------------- "
		echo "             Atualização concluída          "
		echo "------------------------------------------- "
		echo
		echo
		echo "------------------------------------------"
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------"
		echo
		read
		clear
		Nikto;;
	3 )
		clear
		echo "------------------------------------------ "
		echo "  Lista de arquivos que serão deletados    "
		echo "------------------------------------------ "
		echo
		cd ~/Script/NIKTO/LOG/
		pwd
		echo
		cd - >/dev/null
		echo
		ls -lah ~/Script/NIKTO/LOG/
		echo
		echo
		echo "------------------------------------------ "
		echo "Deseja realmente deletar o(s) arquivo(s)?"
		echo "   Digite s ou n"
		echo "------------------------------------------ "
		read RESP
		echo
		echo
		while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
			echo
			echo "Opção inválida. Digite s ou n"
			read RESP
		done
		if [ "$RESP" = "s" ]; then
		echo
		echo
		echo "------------------------------------------ "
		echo "        Apagando arquivos de LOG           "
		echo "------------------------------------------ "
		echo
		rm -rf ~/Script/NIKTO/LOG/*.xml
		echo
		echo "------------------------------------------"
		echo "Aperte o ENTER pra continuar"
		echo "------------------------------------------"
		read
		Nikto;
		fi
		if [ "$RESP" = "n" ]; then
		echo
		echo "Voltando para o menu do Nikto"
		sleep 1;Nikto;
		fi;
		Nikto;;
	4 ) Principal;;
	* ) echo "Opção inválida"; sleep 3; Nikto;;
 esac
}
#-------------   4 - Nikto Fim   -----------#



#-------------   5 - MasScan Inicio   -----------#

MasScan ()
{
	clear
	echo "------------------------------------------- "
	echo "                MasScan                       "
	echo "------------------------------------------- "
	echo
	echo
	echo "------------------------------------------- "
	echo "1 - Scan simples"
	echo -e "2 - \033[01;31mApagar\033[0m \033[01;5;31mTODOS\033[0m o(s) Arquivo(s) pause.conf"
	echo "3 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 )
			clear
			echo
			echo "------------------------------------------- "
			echo "             Scan simples                   "
			echo "------------------------------------------- "
			echo
			echo
			echo
			echo "------------------------------------------ "
			echo
			echo "Digite o IP ou range a ser scaneado"
			echo
			echo "------------------------------------------ "
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
			echo "------------------------------------------ "
			echo "O arquivo será salvo em " ~/Script/MasScan/
			echo "------------------------------------------ "
			echo
			echo
			echo "------------------------------------------ "
			echo "Digite a(s) porta(s) de 0-65535"
			echo "------------------------------------------ "
			read PORT
			sudo masscan $IP --ports $PORT --resume ~/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf
			echo
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			clear
			MasScan;;

		2 )
			clear
			echo "------------------------------------------ "
			echo "  Lista de arquivos que serão deletados    "
			echo "------------------------------------------ "
			echo
			cd ~/Script/MasScan/
			pwd
			echo
			cd - >/dev/null
			echo
			ls -lah ~/Script/MasScan/
			echo
			echo
			echo "------------------------------------------ "
			echo "Deseja realmente deletar o(s) arquivo(s)?"
			echo "   Digite s ou n"
			echo "------------------------------------------ "
			read RESP
			echo
			echo
			while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
				echo
				clear
				echo "Opção inválida. Digite s ou n"
				read RESP
			done
			if [ "$RESP" = "s" ]; then
				echo
				clear
				echo
				rm -rf ~/Script/MasScan/*.*
				echo
				echo
				echo "------------------------------------------ "
				echo "       Arquivos de LOG deletados   "
				echo "------------------------------------------ "
				echo
				echo
				echo
				cho "------------------------------------------"
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------"
				read
				MasScan;
			fi
			if [ "$RESP" = "n" ]; then
				echo
				echo "Voltando para o menu do MasScan"
				sleep 1; MasScan;
			fi;
			MasScan;;
		3 ) Principal;;
		* ) echo "Opção inválida"; sleep 3; MasScan;;
esac
}
#-------------   5 - MasScan Fim   -----------#

#-------------   6 - Reconhecimento Inicio   -----------#
Reconhecimento ()
{
	clear
	echo "------------------------------------------- "
	echo "             Reconhecimento WEB             "
	echo "------------------------------------------- "
	echo
	echo "------------------------------------------- "
	echo " 1 - Rodar o reconhecimento WEB"
	echo " 2 - Ler os resultados"
	echo " 3 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 )
			clear
			echo "------------------------------------------- "
			echo "       Exeutando Reconhecimento             "
			echo "------------------------------------------- "
			echo
			echo "Digite o IP ou Site: "
			echo "Exemplo: 192.168.1/ www.teste.com.br"
			read IP
			if [ "$IP" == "" ]
				then
					echo "Você esqueceu o endereço IP ou Site!!"
					echo "Exemplo: 192.168.1/ www.teste.com.br"
				fi
			if [ ! -d "~/Script/Reconhecimento" ]; then
				sudo mkdir -p -m 777 ~/Script/Reconhecimento/
			fi;
			if [ ! -d "~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt" ]; then
				touch ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt;
				echo
				echo "Pasta "~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt" criada com sucesso";
				echo
			else
				echo
				echo "Pasta "~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt;" já exite";
				echo
				fi;
			touch ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt;
			echo >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			printf " ----- NMAP -----" >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo "Running Nmap ..."
			sudo nmap $IP >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			printf " ----- Gobuster -----" >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo "Running Gobuster ..."
			gobuster dir -u http://$IP -w /usr/share/dirb/wordlists/common.txt -t 20 >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			printf " ----- WhatWeb -----" >> ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo "Running WhatWeb ..."
			whatweb -v -a 3 $IP
			sleep 3; Reconhecimento;;
		2 )
			clear
			echo "------------------------------------------- "
			echo "             Lendo Resultados               "
			echo "------------------------------------------- "
			echo
			cat ~/Script/Reconhecimento/$(date +%d-%m-%Y)_"$IP"_reconhecimento.txt
			echo
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			Reconhecimento;;
		3 ) Principal;;
		* ) echo "Opção inválida"; sleep 3; Reconhecimento;;
esac
}
#-------------   6 - Reconhecimento Fim   -----------#

#-------------   7 - Softwares Inicio   -----------#

Software ()
{
	clear
	echo "------------------------------------------- "
	echo "                Sotwares                    "
	echo "------------------------------------------- "
	echo
	echo
	echo "------------------------------------------- "
	echo "1 - Pesquisa software"
	echo "2 - Instalar software"
	echo "3 - Instalar softwares do script"
	echo -e "4 - \033[01;5;31mRemover\033[0m software"
	echo -e "5 - \033[01;5;31mRemover\033[0m softwares do script"
	echo "6 - Atualizar todos os software"
	echo "7 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 )
			clear
			echo "------------------------------------------- "
			echo "             Pesquisa software              "
			echo "------------------------------------------- "
			echo
			echo "Digite o nome do programa a ser pesquisado"
			read PROG
			echo
			echo "Quer pausar a pesquisa?"
			echo "Digite [s]im ou [n]ão"
			read RESP
			while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
				echo
				echo "Opção inválida. Digite s ou n"
				read RESP
				done
			if [ "$RESP" = "s" ]; then
				sudo apt search $PROG | less
				sleep 3; Software;
			fi
			if [ "$RESP" = "n" ]; then
				echo
				echo "Voltando para o menu do TCP Dump"
				echo
				sudo apt search $PROG
				echo "------------------------------------------"
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------"
				read
				Software;
			fi;;
		2 )
			clear
			echo "------------------------------------------- "
			echo "             Instalar software              "
			echo "------------------------------------------- "
			echo
			echo "Digite o nome do programa a ser instalado"
			read PROG
			echo
			echo "------------------------------------------- "
			echo "..............Atualizando.................. "
			echo "------------------------------------------- "
			echo
			sudo apt update
			echo
			echo "------------------------------------------- "
			echo "..............Atualizado................... "
			echo "------------------------------------------- "
			echo
			echo "------------------------------------------- "
			echo "Instalado "$PROG"                           "
			echo "------------------------------------------- "
			echo
			sudo apt install $PROG -y |sudo apt install -f -y;
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			Software;;
		3 )
			clear
			echo "------------------------------------------- "
			echo "   Instalar softwares do script             "
			echo "------------------------------------------- "
			echo
			echo "------------------------------------------- "
			echo "curl whatweb masscan gobuster tcpdump nmap dnsutils"
			echo "------------------------------------------- "
			echo "Deseja realmente instalar?"
			read RESP
			while [ "$RESP" != "s" -a "$RESP" != "n" ]; do
				clear
				echo
				echo
				echo
				echo "------------------------------------------- "
				echo "     Opção inválida. Digite s ou n"
				echo "------------------------------------------- "
				echo
				echo
				read RESP
			done
			if [ $RESP = s ]; then
				sudo apt update -y && sudo apt install curl whatweb masscan gobuster tcpdump nmap dnsutils -y && sudo apt install -f -y;
				echo
				if [ ! -d "~/Script/NIKTO" ]; then
					echo "------------------------------------------ "
					echo " Diretório não existe e será criado        "
					echo "------------------------------------------ "
					echo " ~/Script/NIKTO/ "
					echo "------------------------------------------ "
					echo " Criando diretório                         "
					echo "------------------------------------------ "
					echo
					sudo mkdir -p -m 777 ~/Script/NIKTO/
					cd ~/Script/NIKTO
					sudo git clone https://github.com/sullo/nikto
					clear
					sleep 3; Software;
				fi
				if [ "$RESP" = "n" ]; then
					echo "Você desistiu da instalação...."
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					read
					Software;
				fi
				Software;
			fi;;
		4 )
			clear
			echo "------------------------------------------- "
			echo "   Remover software         "
			echo "------------------------------------------- "
			echo
			echo "Deseja realmente remover?  "
			read RESP
			if [ $RESP="s" -o $RESP="S" ]; then
				echo "Qual software?"
				read SOFT
				sudo apt remove $SOFT -y | sudo apt purge $SOFT -y | sudo apt install -f -y |sudo apt update
				sleep 3; Software;
			else
				echo "Você desistiu da remoção"
				echo
				echo "------------------------------------------"
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------"
				read
				Software;
			fi;;
		5 )
			clear
			echo "------------------------------------------- "
			echo "   Remover softwares do script              "
			echo "------------------------------------------- "
			echo
			echo "------------------------------------------- "
			echo "masscan nikto tcpdump nmap dnsutils"
			echo "------------------------------------------- "
			echo
			echo "Deseja realmente remover?"
			read RESP
			if [ $RESP = s ]; then
				sudo apt remove curl whatweb masscan gobuster tcpdump nmap dnsutils -y |sudo apt purge curl whatweb masscan gobuster tcpdump nmap dnsutils -y | sudo apt 					install -f -y | sudo apt update | cd Script/NIKTO | sudo rm -rf nikto | cd -
				echo
				echo "------------------------------------------"
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------"
				read
				Software;
			else
				echo "Você desistiu da remoção...."
				sleep 3; Software;
			fi;;
		6 )
			clear
			echo "------------------------------------------- "
			echo "   Atualizando lista de softwares           "
			echo "------------------------------------------- "
			echo
			sudo apt update -y
			echo
			echo "------------------------------------------- "
			echo "   Atualizando todos os softwares           "
			echo "------------------------------------------- "
			echo
			sudo apt full-upgrade -y
			echo
			echo "------------------------------------------- "
			echo "   Removendo softwares obsoletos            "
			echo "------------------------------------------- "
			echo
			sudo apt autoremove -y
			echo
			echo "------------------------------------------- "
			echo "   Corrigindo softwares quebrados           "
			echo "------------------------------------------- "
			echo
			sudo apt install -f -y
			echo
			echo
			echo "------------------------------------------- "
			echo "   Limpando cache local                     "
			echo "------------------------------------------- "
			echo
			sudo apt autoclean |sudo apt clean
			echo
			echo "------------------------------------------"
			echo "Aperte o ENTER pra continuar"
			echo "------------------------------------------"
			read
			Software;;
		7 ) Principal;;
		* ) echo "Opção inválida"; sleep 3; Software;;
esac
}

#-------------   7 - Softwares Fim   -----------#

#-------------   8 - Informações do IP Início   -----------#

IPs ()
{
	clear
	echo "------------------------------------------- "
	echo "                Infomações IP               "
	echo "------------------------------------------- "
	echo
	echo
	while true
		do
			echo "------------------------------------------- "
			echo "1 - IP Externo - Real"
			echo "2 - IP Interno - Local/Sistema"
			echo "3 - Menu Principal"
			echo "------------------------------------------- "
			echo
			read NUM
			if [[ "$NUM" = "1" ]]
			then
#-------------    Informações do IP Externo Início   -----------#

				IP_EXTERNO=$(wget -qO- http://ipecho.net/plain)
				pais=$(curl ipinfo.io/"$IP_EXTERNO"/country 2>/dev/null)
				loc=$(curl ipinfo.io/"$IP_EXTERNO"/loc 2>/dev/null)
				cidade=$(curl ipinfo.io/"$IP_EXTERNO"/city 2>/dev/null)
				org=$(curl ipinfo.io/"$IP_EXTERNO"/org 2>/dev/null)
				postal=$(curl ipinfo.io/"$IP_EXTERNO"/postal 2>/dev/null)
				regiao=$(curl ipinfo.io/"$IP_EXTERNO"/region 2>/dev/null)
				hostname=$(curl ipinfo.io/"$IP_EXTERNO"/hostname 2>/dev/null)
				fuso=$(curl ipinfo.io/"$IP_EXTERNO"/timezone 2>/dev/null)
				clear
				echo -e "  IP Externo: \033[01;5;31m$IP_EXTERNO\033[0m"
				echo -e "      País: $pais"
				echo -e "      Região: $regiao"
				echo -e " Localização: $loc"
				echo -e "      Cidade: $cidade"
				echo -e "      Postal: $postal"
				echo -e "    Hostname: $hostname"
				echo -e " Organização: $org"
				echo -e "Fuso Horario: $fuso"
				echo
				echo
				echo
				echo "------------------------------------------"
				echo "Aperte o ENTER pra continuar"
				echo "------------------------------------------"
				read
				clear
				IPs;
#-------------    Informações do IP Externo Fim   -----------#

			elif [[ "$NUM" = "2" ]]
				then
					echo
					echo
					echo "------------------------------------------ "
					echo "Informações do IP Interno e Sistema "
					echo "------------------------------------------ "
					echo
					echo

#-------------    Informações do IP Interno Início   -----------#

					IP_INTERNO=$(hostname -I | awk '{print $1}' 2>/dev/null)
					SO1=$(sudo lsb_release -a 2>/dev/null)
					SO2=$(sudo getconf LONG_BIT 2>/dev/null)
					SO3=$(sudo uptime 2>/dev/null)
					SO4=$(sudo dmidecode -t 1, 12, 15, 23, 32 2>/dev/null)
					BIOS=$(sudo dmidecode -t 0, 13 2>/dev/null)
					PROCESSADOR=$(sudo dmidecode -t 4 2>/dev/null)
					ESTATISTICA=$(sudo mpstat 2>/dev/null)
					MEMORIA=$(sudo dmidecode -t 5, 6, 16, 17 2>/dev/null)
					clear
					echo "------------------------------------------ "
					echo -e "    \033[01;31mIP Local\033[0m: \033[44;1;5;37m\n\t$IP_INTERNO\033[0m"
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
					echo "------------------------------------------ "
					echo
					echo
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					read
					clear
					IPs;
			elif [[ "$NUM" = "3" ]]
				then
					clear
					Principal;
			elif [[ "$NUM" -ne "1, 2, 3" ]]
				then
					clear
					echo
					echo "Opção inválida"; sleep 3; Doacao;
			fi
	done

#-------------    Informações do IP Interno Fim   -----------#
}

#-------------   8 - Informações do IP Fim   -----------#

#-------------   9 - Informações de Midias Sociais Início -----------#
Midias ()
{
	clear
	echo "------------------------------------------- "
	echo "       Infomações de Mídias Sociais         "
	echo "                 Sherlock                   "
	echo "------------------------------------------- "
	echo
	echo
	while true
		do
			echo "------------------------------------------- "
			echo "1 - Instalar Sherlock"
			echo "2 - Usando rede TOR"
			echo -e "3 - \033[01;5;31mNão\033[0m usando rede TOR"
			echo "4 - Menu Principal"
			echo "------------------------------------------- "
			echo
			read NUM
			clear
			if [[ "$NUM" = "1" ]]
				then
#-------------  Instalar Sherlock  -----------#
				if [ ! -d "~/sherlock" ]
					then
						cd ~/Script
						sudo git clone https://github.com/sherlock-project/sherlock.git
						cd sherlock
						sudo python3 -m pip install -r requirements.txt
						echo
						echo
						echo "------------------------------------------"
						echo "Aperte o ENTER pra continuar"
						echo "------------------------------------------"
						read
						clear
						Midias;
				fi
#-------------  Via TOR  -----------#
			elif [[ "$NUM" = "2" ]]
				then
					cd ~/Script/sherlock
					echo
					echo
					echo -e "Digite o nome do usuário a ser pesquisado. "
					read USER
					echo
					clear
					echo
					echo
					sudo python3 sherlock --tor $USER
					sudo mv $USER.txt ~/Desktop
					clear
					echo
					echo -e "\033[1;36m$USER.txt\033[0m Salvo em \033[1;36m ~/Desktop \033[0m" 
					echo
					echo
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					read
					clear
					Midias;
#-------------  SEM TOR  -----------#
			elif [[ "$NUM" = "3" ]]
				then
					cd ~/Script/sherlock
					echo
					echo
					echo -e "Digite o nome do usuário a ser pesquisado. "
					read USER
					echo
					clear
					echo
					echo
					sudo python3 sherlock $USER
					clear
					sudo mv $USER.txt ~/Desktop
					echo
					echo -e "\033[1;36m$USER.txt\033[0m Salvo em \033[1;36m ~/Desktop \033[0m" 
					echo
					echo
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					read
					clear
					Midias;

#-------------  Voltar ao Menu Principal  -----------#
			elif [[ "$NUM" = "4" ]];
				then
					clear
					Principal;
			elif [[ "$NUM" -ne "1, 2, 3, 4" ]]
				then
					clear
					echo
					echo "Opção inválida"; sleep 3; Midias;
			fi
	done

}
#-------------   9 - Informações de Midias Sociais Fim -----------#

#-------------   10 - Doação Início   -----------#

Doacao ()
{
	clear
	echo
	echo
	echo "------------------------------------------- "
	echo "                  Doação                    "
	echo "------------------------------------------- "
	echo
	echo
	while true
		do
			echo "Se você gostou do meu script e quiser, pode me pagar um café."
			echo -e "1 - Ver QR Code \033[01;33mMercado Livre\033[0m"
			echo -e "2 - Ver QR Code \033[01;35mNubank\033[0m"
			echo -e "3 - Ver QR Code \033[01;34mPayPal\033[0m"
			echo -e "4 - Ver Site \033[01;34mPayPal\033[0m"
			echo "5 - Ver dados bancários (transferência)"
			echo "6 - Voltar"
			echo "Digite o número da opção: "
			read DOACAO
			if [[ "$DOACAO" = "1" ]]
				then
					echo
					echo
					clear
					echo
					echo
					echo " Seu navegador irá abrir em seguida!"
					sleep 3
					echo
					echo
					gio open "https://github.com/paimmauricio/Script-Rede/blob/main/QRs/QR_Code_ML.pdf" 2>/dev/null
					clear
					Doacao;
			elif [[ "$DOACAO" = "2" ]]
				then
					echo
					echo
					clear
					echo
					echo
					echo " Seu navegador irá abrir em seguida!"
					sleep 3
					echo
					echo
					gio open "https://github.com/paimmauricio/Script-Rede/blob/main/QRs/QR_Code_Nubank.pdf" 2>/dev/null
					clear
					Doacao;
			elif [[ "$DOACAO" = "3" ]]
				then
					echo
					echo
					clear
					echo
					echo
					echo " Seu navegador irá abrir em seguida!" 
					sleep 3
					echo
					echo
					gio open "https://github.com/paimmauricio/Script-Rede/blob/main/QRs/QR_Code_PayPal.png" 2>/dev/null
					clear
					Doacao;
			elif [[ "$DOACAO" = "4" ]]
				then
					echo
					echo
					clear
					echo
					echo
					echo " Seu navegador irá abrir em seguida!"
					sleep 3
					echo
					echo
					gio open "https://www.paypal.com/donate?hosted_button_id=YJNX67EAAHNCU" 2>/dev/null
					clear
					Doacao;
			elif [[ "$DOACAO" = "5" ]]
				then
					clear
					echo
					echo
					echo -e "\033[01;35mAgência\033[0m : \033[44;1;37m 0001 \033[0m"
					echo -e "\033[01;35m   C/C\033[0m : \033[44;1;37m281087-1 \033[0m"
					echo -e "\033[01;35m Banco 260 - Nu Pagamentos S.A. (Nubank) \033[0m"
					echo
					echo
					echo
					echo "------------------------------------------"
					echo "Aperte o ENTER pra continuar"
					echo "------------------------------------------"
					read
					echo
					echo
					clear
					Doacao;
			elif [[ "$DOACAO" = "6" ]]
				then
					clear
					Principal;
			elif [[ "$DOACAO" -ne "1,2,3,4,5,6" ]]
				then
					clear
					echo
					echo "Opção inválida"; sleep 3; Doacao;
			fi
done
}

#-------------   10 - Doação Fim   -----------#

Principal
