#!/bin/bash
#################################
#
# Autor: Maurício Paim - paim.mauricio@gmail.com
# Versão: 1.2
# Data: 04/10/2020
# Script Rede
# Ao usar o script você assume
# TODA a responsabilidade por seu uso
#
##################################
Principal ()
{
	clear
	echo
	echo
  echo
  echo
	echo
	echo
	#-------------   Menu Principal Início   -----------#
	echo "-----------------------------------------------------"
	echo "      1 - TCP Dump"
	echo "      2 - NMAP"
	echo "      3 - NSLookUP"
	echo "      4 - Nikto"
	echo "      5 - MasScan"
	echo "      6 - Reconhecimento"
	echo "      7 - Softwares"
	echo "      8 - Sair"
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
		8 ) echo; echo; echo ".........Bye Bye........."; sleep 2; clear; exit 0;;
		* ) echo; echo; echo "Opção inválida"; sleep 3; Principal;;
	esac
}
#-------------   Menu Principal Fim   -----------#

#-------------   1 - TCP Dump Inicio   -----------#

TCPDump ()
{
	 	clear
		echo "------------------------------------------ "
		echo "Escolha a placa de rede"
		echo "------------------------------------------ "
		echo
		echo
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
		echo "6 - Apagar TODOS arquivos de LOG"
		echo "7 - Menu Principal"
		echo "------------------------------------------ "
		echo
		echo "Escolha uma Opção: "
		read PLACA
		echo
		case $PLACA in
			1 ) clear
			    echo
			    echo "Digite um nome para o arquivo de log: "
			    read LOG;
			    echo
					echo
					if [ ! -d "$HOME/Script/TCPDump" ]; then
		                echo "------------------------------------------ "
		                echo " Diretório não existe e será criado        "
		                echo "------------------------------------------ "
		                echo
		                echo "------------------------------------------ "
		                echo " Criando diretório                         "
		                echo "------------------------------------------ "
		                echo
					    mkdir -p $HOME/Script/TCPDump/
					fi;
			    touch $HOME/Script/TCPDump/$LOG;
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
				sudo tcpdump -i $PLACA1 >> $HOME/Script/TCPDump/$LOG;
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
					 	done
					 	if [ "$RESP" = "s" ]; then
					 	    sudo cat $HOME/Script/TCPDump/$LOG |less
						    echo
						    echo
						    echo "Aperte o ENTER pra continuar"
					        read
					        TCPDump;
					    fi
					    if [ "$RESP" = "n" ]; then
		                    echo
		                    echo "Voltando para o menu do TCP Dump"
						    				sleep 1; TCPDump;
		    			fi;;
		2 ) clear
		    echo
		    echo "Digite um nome para o arquivo de log: "
		    read LOG;
		    echo
				    touch $HOME/Script/TCPDump/$LOG;
				    PLACA2=$(sudo ip addr show | grep '2: ' | cut -d : -f2);
				echo
				echo "------------------------------------------ "
				echo "Placa escolida foi :"$PLACA2;
				echo "------------------------------------------ "
				echo
				echo "------------------------------------------ "
				echo "Criando arquivo de log....."
				echo "------------------------------------------ "
				echo
						sudo tcpdump -i $PLACA2 >> $HOME/Script/TCPDump/$LOG;
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
					 	    sudo cat $HOME/Script/TCPDump/$LOG |less
						    echo
						    echo
						    echo "Aperte o ENTER pra continuar"
								echo
								echo
					        read
					        TCPDump;
					    fi
					    if [ "$RESP" = "n" ]; then
		                    echo
		                    echo "Voltando para o menu do TCP Dump"
						    				sleep 1; TCPDump;
		    			fi;;
		3 ) clear
    		echo
    				PLACA1=$(sudo ip addr show | grep '^1: ' | cut -d : -f2);
				echo "------------------------------------------ "
				echo
				echo "Placa escolida foi :"$PLACA1;
				echo
				echo "------------------------------------------ "
				echo
						sudo tcpdump -i $PLACA1;
				echo
				echo "Aperte o ENTER pra continuar";
		        read
		        TCPDump;;
		4 ) clear
    		echo
		    		PLACA2=$(ip addr show | grep '2: ' | cut -d : -f2);
				echo
				echo "------------------------------------------ "
				echo
				echo "Placa escolida foi :"$PLACA2;
				echo
				echo "------------------------------------------ "
				echo
						sudo tcpdump -i $PLACA2;
				sleep 3; TCPDump;;
		5 ) clear
		    ip addr show;
				echo
				echo
			 	echo
		    echo "Aperte o ENTER pra continuar";
				echo
	        read
	        TCPDump;;
			6 ) clear
					echo "------------------------------------------ "
					echo "  Lista de arquivos que serão deletados    "
					echo "------------------------------------------ "
					echo
						cd $HOME/Script/TCPDump/
						pwd
						echo
						cd - >/dev/null
						echo
						ls -lah $HOME/Script/TCPDump/
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

									rm -rf $HOME/Script/TCPDump/*
								echo
								echo
								echo "------------------------------------------ "
								echo "       Arquivos de LOG deletados	  			 "
								echo "------------------------------------------ "
								echo
								echo
								echo
								echo "Aperte o ENTER pra continuar"
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
	echo "------------------------------------------- "
	echo "                    NMAP                    "
	echo "------------------------------------------- "
	echo
	echo
	echo "------------------------------------------ "
	echo "1 - IPV 4 - Padrão"
	echo "2 - IPV 4 - Completo"
	echo "3 - IPV 4 - Verifica se host está UP"
	echo "4 - Ler arquivo de coleta"
	echo "5 - Limpar TODOS arquivos de LOG"
	echo "6 - Menu Principal"
	echo "------------------------------------------ "
	echo
	read NUM
		case $NUM in
			1 ) clear
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
						if [ ! -d "$HOME/Script/NMAP/" ]; then
	                echo "------------------------------------------ "
	                echo " Diretório não existe e será criado        "
	                echo "------------------------------------------ "
	                echo
	                echo "------------------------------------------ "
	                echo " Criando diretório                         "
	                echo "------------------------------------------ "
	                echo
				    						mkdir -p $HOME/Script/NMAP/
						fi;
	            echo
	            echo "------------------------------------------ "
							echo "O arquivo de coleta é: "$HOME/Script/NMAP/$(date +%d-%m-%Y)_padrao.txt;
							echo "------------------------------------------ "
							echo
							sudo nmap $DESTINO >> $HOME/Script/NMAP/$(date +%d-%m-%Y)_padrao.txt;
							echo
							echo "Aperte o ENTER pra continuar";
							echo
					        read
					        NMAP;;
		2 ) clear
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
					if [ ! -d "$HOME/Script/NMAP" ]; then
                echo "------------------------------------------ "
                echo " Diretório não existe e será criado        "
                echo "------------------------------------------ "
                echo
                echo "------------------------------------------ "
                echo " Criando diretório                         "
                echo "------------------------------------------ "
                echo
						    			mkdir -p $HOME/Script/NMAP
						    echo
					fi;
	      echo
				echo "O arquivo de coleta é: "$HOME/Script/NMAP/$(date +%d-%m-%Y)_completo.txt;
				echo
						sudo nmap -A -R -T4 $DESTINO >> $HOME/Script/NMAP/$(date +%d-%m-%Y)_completo.txt;
				echo
				echo "Aperte o ENTER pra continuar";
				echo
	      read
	      NMAP;;
		3 )	clear
		    echo
		    echo "------------------------------------------ "
		    echo
		    echo "            HOST UP "
		    echo "Digite o IP ou site de destino: ";
		    echo
		    echo "------------------------------------------ "
		    echo
				read DESTINO;
				echo
					if [ ! -d "$HOME/Script/NMAP" ]; then
		                echo "------------------------------------------ "
		                echo " Diretório não existe e será criado        "
		                echo "------------------------------------------ "
		                echo
		                echo "------------------------------------------ "
		                echo " Criando diretório                         "
		                echo "------------------------------------------ "
		                echo
					    						mkdir -p $HOME/Script/NMAP
					fi;
				echo
				echo "O arquivo de coleta é: "$HOME/Script/NMAP/$(date +%d-%m-%Y)_UP.txt;
				echo
						sudo nmap -sP -R -T4 $DESTINO >> $HOME/Script/NMAP/$(date +%d-%m-%Y)_UP.txt;
				echo
				echo "Aperte o ENTER pra continuar";
				echo
	      read
	      NMAP;;
        4 ) clear
				    echo
				    echo "------------------------------------------ "
				    echo
				    echo " 			Ler arquivos coletados"
				    echo
				    echo "------------------------------------------ "
				    echo
				    echo "------------------------------------------ "
				    echo " 1 - Padrão"
				    echo " 2 - Completo"
				    echo " 3 - Host UP"
				    echo " 4 - Menu NMAP"
				    echo "------------------------------------------ "
				    echo
					    read NUM
					    	if [ $NUM -eq "1" ]; then
			           echo
					       echo "------------------------------------------ "
					       echo "                   Padrão                  "
					       echo "------------------------------------------ "
					       echo
						   				cat $HOME/Script/NMAP/$(date +%d-%m-%Y)_padrao.txt
				    		 echo
							   echo
							   echo "------------------------------------------ "
							   echo "				Aperte o ENTER pra continuar"
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
					               cat $HOME/Script/NMAP/$(date +%d-%m-%Y)_completo.txt
						    		 echo
									   echo
									   echo "------------------------------------------ "
									   echo "				Aperte o ENTER pra continuar"
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
						              cat $HOME/Script/NMAP/$(date +%d-%m-%Y)_UP.txt
							    		echo
										  echo
										  echo "------------------------------------------ "
										  echo "			Aperte o ENTER pra continuar"
										  echo "------------------------------------------ "
										  read;
											NMAP
											read;
										else
										  echo
										  echo "------------------------------------------ "
							        echo "            Opção inválida......"
							        echo "------------------------------------------ "
							        echo
							        sleep 2; NMAP;
							        fi
							        read; NMAP;;
		5 )
				clear
				echo "------------------------------------------ "
				echo "  Lista de arquivos que serão deletados    "
				echo "------------------------------------------ "
				echo
					cd $HOME/Script/NMAP/
					pwd
					echo
					cd - >/dev/null
					echo
					ls -lah $HOME/Script/NMAP/
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

								rm -rf $HOME/Script/NMAP/*
							echo
							echo
							echo "------------------------------------------ "
							echo "       Arquivos de LOG deletados	  			 "
							echo "------------------------------------------ "
							echo
							echo
							echo
							echo "Aperte o ENTER pra continuar"
							read
							NMAP;
						fi
							if [ "$RESP" = "n" ]; then
												echo
												echo "Voltando para o menu do NMAP"
												sleep 1;NMAP;
							fi;
							NMAP;;

		6 ) clear; Principal;;
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
	echo "1 - NSLooUP Padrão"
	echo "2 - NSLooUP Padrão - Salvando"
	echo "3 - NSLooUP MX, NS e SOA"
	echo "4 - NSLooUP MX, NS e SOA - Salvando"
	echo "5 - Apagar TODOS arquivos salvos"
	echo "6 - Menu Principal"
	echo "------------------------------------------- "
	echo
	read NUM
	case $NUM in
		1 ) clear
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
				echo "Aperte o ENTER pra continuar";
				echo
	      read
	      clear
	      NSLookUP;;
		2 ) clear
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
					if [ ! -d "$HOME/Script/NSLookUP" ]; then
										echo "------------------------------------------ "
										echo " Diretório não existe e será criado        "
										echo "------------------------------------------ "
										echo
										echo "------------------------------------------ "
										echo " Criando diretório                         "
										echo "------------------------------------------ "
										echo
													mkdir -p $HOME/Script/NSLooUP/
					fi;
				echo
				echo
				echo "------------------------------------------- "
				echo "    Pesquisando site: "$PESQ;
				echo "------------------------------------------- "
				echo
						nslookup -all $PESQ >> $HOME/Script/NSLookUP/$(date +%d-%m-%Y).txt;
				echo
				echo "Aperte o ENTER pra continuar";
	      read
	      clear
	      NSLookUP;;
		3 ) clear
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
				echo "Aperte o ENTER pra continuar";
		    read
		    clear
		    NSLookUP;;
		4 ) clear
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
					if [ ! -d "$HOME/Script/NMAP" ]; then
										echo "------------------------------------------ "
										echo " Diretório não existe e será criado        "
										echo "------------------------------------------ "
										echo
										echo "------------------------------------------ "
										echo " Criando diretório                         "
										echo "------------------------------------------ "
										echo
													mkdir -p $HOME/Script/NSLooUP/
					fi;
				echo
				echo
				echo "------------------------------------------- "
				echo "    Pesquisando site: "$PESQ;
				echo "------------------------------------------- "
				echo
						nslookup -type=$TIPO $PESQ >> $HOME/Script/NSLookUP/$(date +%d-%m-%Y)_nslookup.txt;
				echo
				echo "Aperte o ENTER pra continuar";
		    read
		    clear
		    NSLookUP;;
		5 )
						clear
						echo "------------------------------------------ "
						echo "  Lista de arquivos que serão deletados    "
						echo "------------------------------------------ "
						echo
							cd $HOME/Script/NSLooUP/
							pwd
							echo
							cd - >/dev/null
							echo
							ls -lah $HOME/Script/NSLooUP/
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

										rm -rf $HOME/Script/NSLookUP/*.*
									echo
									echo
									echo "------------------------------------------ "
									echo "       Arquivos de LOG deletados	  			 "
									echo "------------------------------------------ "
									echo
									echo
									echo
									echo "Aperte o ENTER pra continuar"
									read
									NMAP;
								fi
									if [ "$RESP" = "n" ]; then
														echo
														echo "Voltando para o menu do NMAP"
														sleep 1;NSLooUP;
									fi;
									NSLooUP;;
		6 ) clear; Principal;;
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
		echo "3 - Apagar TODOS os arquivos salvos"
		echo "4 - Menu Principal"
		echo "------------------------------------------- "
		echo
		read NUM
		case $NUM in
		    1 ) clear
		        echo
		        echo "------------------------------------------ "
		        echo
		        echo "Qual o HOST a ser verificado?";
		        echo
		        echo "------------------------------------------ "
		        read HOST
		        echo
#		        echo "------------------------------------------ "
#		        echo
#		        echo "Qual o nome do arquivo a ser salvo";
#		        echo
#		        echo "------------------------------------------ "
		        #read ARQ
		        echo
						echo
						if [ ! -d "$HOME/Script/NIKTO" ]; then
											echo "------------------------------------------ "
											echo " Diretório não existe e será criado        "
											echo "------------------------------------------ "
											echo
											echo "------------------------------------------ "
											echo " Criando diretório                         "
											echo "------------------------------------------ "
											echo
														mkdir -p $HOME/Script/NIKTO/
						fi;
		        if [ ! -d "$HOME/Script/NIKTO/$(date +%d-%m-%Y)nikto.xml" ]; then
	                	touch $HOME/Script/NIKTO/$(date +%d-%m-%Y)nikto.txt;
	                echo
	                echo "Pasta "$HOME/Script/NIKTO/$(date +%d-%m-%Y)nikto.xml "criada com sucesso";
	                echo
	         		else
	                echo
	                echo "Diretório "$HOME/Script/NIKTO/$(date +%d-%m-%Y)nikto.xml" já exite";
	                echo
	           fi;
	            echo
			        echo "O arquivo será salvo em " $HOME/Script/NIKTO/
			        echo
			        echo "------------------------------------------- "
			        echo "Pesquisando" $HOST;
			        echo "------------------------------------------- "
			        echo
			        		nikto -h $HOST -output $HOME/Script/NIKTO/$(date +%d-%m-%Y)nikto.xml;
			        echo
			        echo "Aperte o ENTER pra continuar";
			        read
			        clear
			        Nikto;;
		    2 ) clear
	    	    echo
		        echo "------------------------------------------- "
					echo "             Atualizando Nikto              "
					echo "------------------------------------------- "
					echo
								cd /usr/share/golismero/tools/nikto/
								perl ./nikto.pl -update
								cd - >/dev/null
					echo
					echo
					echo "------------------------------------------- "
					echo "             Atualização concluída          "
					echo "------------------------------------------- "
					echo
					echo
					echo "Aperte o ENTER pra continuar";
					echo
			    read
			    clear
			    Nikto;;
					5 )
									clear
									echo "------------------------------------------ "
									echo "  Lista de arquivos que serão deletados    "
									echo "------------------------------------------ "
									echo
										cd $HOME/Script/NIKTO/
										pwd
										echo
										cd - >/dev/null
										echo
										ls -lah $HOME/Script/NIKTO/
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

													rm -rf $HOME/Script/NIKTO/*.*
												echo
												echo
												echo "------------------------------------------ "
												echo "       Arquivos de LOG deletados	  			 "
												echo "------------------------------------------ "
												echo
												echo
												echo
												echo "Aperte o ENTER pra continuar"
												read
												NMAP;
											fi
												if [ "$RESP" = "n" ]; then
																	echo
																	echo "Voltando para o menu do NMAP"
																	sleep 1;NIKTO;
												fi;
												NIKTO;;
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
		echo "2 - Apagar TODOS o(s) Arquivo(s) pause.conf"
		echo "3 - Menu Principal"
		echo "------------------------------------------- "
		echo
		read NUM
		case $NUM in
		    1 ) clear
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
						read IP
						echo
						if [ ! -d "$HOME/Script/MasScan" ]; then
											mkdir -p $HOME/Script/MasScan/
						fi;
		        if [ ! -d "$HOME/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf" ]; then
	                	touch $HOME/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf;
	          fi;
	            echo
							echo "------------------------------------------ "
			        echo "O arquivo será salvo em " $HOME/Script/MasScan/
							echo "------------------------------------------ "
			        echo
						echo
						echo "------------------------------------------ "
						echo "Digite a(s) porta(s) de 0-65535"
						echo
						echo "------------------------------------------ "
						read PORT
								sudo masscan $IP --ports $PORT --resume $HOME/Script/MasScan/$(date +%d-%m-%Y)_"$IP"_paused.conf
						echo
						echo
						echo "Aperte o ENTER pra continuar";
				    read
				    clear
				    MasScan;;

				 2 )
										 clear
										 echo "------------------------------------------ "
										 echo "  Lista de arquivos que serão deletados    "
										 echo "------------------------------------------ "
										 echo
											 cd $HOME/Script/MasScan/
											 pwd
											 echo
											 cd - >/dev/null
											 echo
											 ls -lah $HOME/Script/MasScan/
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

														 rm -rf $HOME/Script/MasScan/*.*
													 echo
													 echo
													 echo "------------------------------------------ "
													 echo "       Arquivos de LOG deletados	  			 "
													 echo "------------------------------------------ "
													 echo
													 echo
													 echo
													 echo "Aperte o ENTER pra continuar"
													 read
													 MasScan;
												 fi
													 if [ "$RESP" = "n" ]; then
																		 echo
																		 echo "Voltando para o menu do NMAP"
																		 sleep 1;MasScan;
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
		1 )clear
			echo "------------------------------------------- "
			echo "       Exeutando Reconhecimento             "
			echo "------------------------------------------- "
			echo
			echo "Digite o IP: "
			read IP
			if [ "$IP" == "" ]
			then
			echo "Você esqueceu o endereço IP!!"
			echo "Exemplo: 192.168.1"
			fi
			if [ ! -d "$HOME/Script/Reconhecimento" ]; then
								mkdir -p $HOME/Script/Reconhecimento/
			fi;
			if [ ! -d "$HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt" ]; then
							touch $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt;
						echo
						echo "Pasta "$HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt" criada com sucesso";
						echo
				else
						echo
						echo "Diretório "$HOME/Script/Reconhecimento/$(date +%d-%m-%Y)paused.conf" já exite";
						echo
			 fi;

			printf "\n----- NMAP -----\n\n" > $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt

			echo "Running Nmap..."
			nmap $IP | tail -n +5 | head -n -3 >> $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt

			while read line
			do
				if [[ $line == *open* ]] && [[ $line == *http* ]]
				then
								echo "Running Gobuster..."
								gobuster dir -u $IP -w /usr/share/wordlists/dirb/common.txt -qz > temp1

				echo "Running WhatWeb..."
				whatweb $IP -v > temp2
				fi
			done < $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt

			if [ -e temp1 ]
			then
				printf "\n----- DIRS -----\n\n" >> $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt
				cat temp1 >> $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txts
				rm temp1
			fi

			if [ -e temp2 ]
			then
				printf "\n----- WEB -----\n\n" >> $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt
				cat temp2 >> $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt
				rm temp2
			fi

sleep 3; Reconhecimento;;

2 )
	clear
	echo "------------------------------------------- "
	echo "             Lendo Resultados               "
	echo "------------------------------------------- "
	echo

		cat $HOME/Script/Reconhecimento/$(date +%d-%m-%Y)_reconhecimento.txt
echo
echo
echo "Aperte o ENTER pra continuar";
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
			echo "4 - Remover software"
			echo "5 - Remover softwares do script"
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
					echo "Quer pausar a pesquisa?
					       Digite [s]im ou [n]ão"
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
						    				echo "Aperte o ENTER pra continuar";
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
					echo "Aperte o ENTER pra continuar";
			    read
			    Software;;
				3 )
					clear
					echo "------------------------------------------- "
					echo "   Instalar softwares do script             "
					echo "------------------------------------------- "
					echo
					echo "Deseja realmente instalar?"
					read RESP
						if [ $RESP = s ]; then
							sudo apt update -y |sudo apt install masscan nikto tcpdump nmap dnsutils -y | sudo apt install -f -y;
						else
							echo "Você desistiu da instalação...."
							echo
							echo "Aperte o ENTER pra continuar";
				      read
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
							echo "Aperte o ENTER pra continuar";
				      read
				      Software;
					fi;;
				5 )
					clear
					echo "------------------------------------------- "
					echo "   Remover softwares do script              "
					echo "------------------------------------------- "
					echo
					echo "Deseja realmente remover?"
					read RESP
						if [ $RESP = s ]; then
							sudo apt remove tcpdump nmap dnsutils masscan nikto -y |sudo apt purge masscan nikto tcpdump nmap dnsutils -y | sudo apt install -f -y | sudo apt update
							echo
							echo "Aperte o ENTER pra continuar";
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
				  echo "Aperte o ENTER pra continuar";
			        read
			        Software;;
				7 ) Principal;;
				* ) echo "Opção inválida"; sleep 3; Software;;

			esac
		}

		#-------------   7 - Softwares Fim   -----------#





Principal