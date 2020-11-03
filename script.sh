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
	banner Paim
#-------------   Menu Principal Início   -----------#
	echo "-----------------------------------------------------"
	echo "      1 - Português"
	echo "      2 - English"
	echo "      d - Doação"
	echo "      e - Donation"
	echo "      x - Sair"
	echo "-----------------------------------------------------"
	read OPCAO
# Usuário ira escolher um número da lista que será lido pela (read) OPCAO
# Que será redirecionado conforme sua escolha (Ex: Digitar 1 será redirecionado
# para a opção 1 da lista abaixo)
case $OPCAO in
	1 ) Portugues;;
	2 ) English;;
	d ) Doacao;;
	e ) Donation;;
        x ) echo; echo; echo ".........Bye Bye........."; sleep 2; clear; exit 0;;
	* ) echo; echo; echo "Opção inválida - Invalid option"; sleep 3; Principal;;
esac
}
#-------------   Menu Principal Fim   -----------#

#-------------   1 - Português Inicio   -----------#

Portugues ()
{
	
		clear
		sudo chmod +x Portugues.sh
		./Portugues.sh 2>/dev/null
}

#-------------   1 - Português Fim   -----------#

#-------------   2 - English Begin   -----------#
English ()
{
		clear
	
		sudo chmod +x English.sh
		./English.sh 2>/dev/null
		
}
#-------------   2 - English End   -----------#


#-------------   10 - Doação Português Início   -----------#

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

#-------------   10 - Doação Português Fim   -----------#
#-------------   11- Donatio English Begin   -----------#

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

#-------------   11 - Donation End   -----------#

Principal
