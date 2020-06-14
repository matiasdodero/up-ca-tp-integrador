#!/bin/bash



# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Sucesion de Fibonacci"
    echo "2) Invertir Numero "
    echo "3) Validar Palindromo"
    echo "4) Contar lineas de un Archivo"
	echo "5) Ordenar Numeros"
	echo "6) Contador de Archivos por Tipo"
    echo "7) Salir"
    echo "-------------------------------------------------------------"
}

function salir(){
    NOMBRE=$1 
    echo "Chau $NOMBRE"
    sleep 2
}

function fibonacci(){
	cantidad=$1 
	aux=1
	aux2=1
	echo $aux
	if [ $1 -gt 1 ]
	then
		echo $aux2
	fi
	
	for((i=3;i<=cantidad;i++))
		do	
			val=`expr $aux + $aux2`
			echo $val
			aux=$aux2
			aux2=$val		
		done
}

# ------------------- MAIN ----------------------#
OPCION=0
menu

while true; do
    read -p "Ingresar una opcion: " OPCION 
    case $OPCION in
        1)
			NUM=0
			read -p "Ingresar un numero: " NUM
			fibonacci $NUM ;;		
		2)
			NUM=0
			read -p "Ingresar numero entero: " NUM
			echo $NUM | rev ;;
		3)
			read -p "Ingresar texto: " cadena
			cadenaInvertida=`echo $cadena | rev`
			if [ $cadena = $cadenaInvertida ]
			then
				echo "Es Palindormo"
			else
				echo "NO es Palindormo"
			fi ;;
		4) echo "Ingresar direccion de un archivo de texto"
		read path
		if [ -e $path ]; then
			cant=$(cat ${path} | wc -l)
			echo "$cant"
		else	
			echo "No se encontro el archivo"
		fi
		;; 
		5) 
			echo "Ingresar 5 numeros: " 
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done
				
			echo -e "$numero1\n$numero2\n$numero3\n$numero4\n$numero5" | sort -n ;; 
			
		6)
			read -p "Ingresar un directorio: " path
			if [ -d $path ]
			then
				find $path -type f | sed -n 's/..*\.//p'  |sort |uniq -c
			else
				echo "El directorio no existe" 
			fi	;;
						
        7)  salir `chau`  
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0