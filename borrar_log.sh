#!/bin/bash

#
# Descripcion: Permite borrar los LOG del PC
# 
# Version: 1.0 
# Fecha: 25-07-2022
# Autor: Ing. Anibal Tillero Olarte 
#
echo '-----------------------------------';
echo ' PERMITE  BORRANDO LOS LOG DE LINUX ';
echo '-----------------------------------';


function logWarn() {
	START='\033[01;33m'
	END='\033[00;00m'
	MESSAGE=${@:-""}
	echo -e "${START}${MESSAGE}${END}"
}

function logInfo() {
	START='\033[01;32m'
	END='\033[00;00m'
	MESSAGE=${@:-""}
	echo -e "${START}${MESSAGE}${END}"
}

function logError() {
	START='\033[01;31m'
	END='\033[00;00m'
	MESSAGE=${@:-""}
	echo -e "${START}${MESSAGE}${END}"
}

function logNormal() {
        MESSAGE=${@:-""}
        echo -e "${MESSAGE}"
}


clear


logError '=========================================';
logError ' A D V E R T E N C I A:                  ';
logError '=========================================';
logError 'Requiere permiso de superusuario         ';
logError '=========================================';

echo '';

logWarn '-----------------------------------------';
logWarn ' Este scrip bash permite borrar todos los ';
logWarn ' LOG historicos del disco duro del PC.   ';
logWarn '-----------------------------------------';


echo '';

echo "¿Quieres eliminar los archivos LOG ? "

echo '';

echo "Seleccione las opciones";
echo '';

select sn in "Si" "No"; do
    case $sn in
        Si ) 
            
            logWarn 'Procesando /var/log....';

            #sudo -i

            find /var/log -type f -delete

            apt autoclean  
 
            apt autoremove

            logInfo  '--------------------------------';
            logInfo ' Se eliminaron los LOG con exito ';
            logInfo '---------------------------------';

	    
	    logInfo  '----------------------------------------------------------------------------';
            logInfo ' Para buscar y listar los paquetes que han sido eliminados, pero no purgados ';
            logInfo ' dpkg --list | grep ^rc                                                      ';
            logInfo '-----------------------------------------------------------------------------';

            
           # Puedes eliminar paquetes no depurados (todos)
             sudo apt purge `dpkg --list | grep ^rc | awk '{ print $2; }'`


            break;;
        
         No  ) 
            logInfo '-------------------------';
            logInfo ' Se cancelo el proceso   ';
            logInfo '-------------------------';    
            exit;;
    esac
done

