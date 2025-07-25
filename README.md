# Script para cuidar bateria:D

### Requisitos:
``sudo apt install libnotify-bin``


### Pasos a seguir para utilizar el script:

1. Guardate el script en un lugar fijo, ejemplo:
    
        /home/tu_usuario/scripts/bateria.sh

2. Otorga permisos de ejecucion al archivo:

        chmod +x /home/tu_usuario/scripts/bateria.sh

3. **Crontab** se utiliza para programar tareas automaticas, abri **crontab** con :  

        
        crontab -e

    Selecciona la opcion 1 en:

    ![terminal](Extra/image.png)

    Luego, una vez dentro, agrega esta linea al final:

        */5 * * * * DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/tu_usuario/scripts/bateria.sh

    Obs: verifica que tu UID sea 1000 con ``echo $UID``

    Esto hara que el script ``bateria.sh`` se ejecute cada **5** minutos.
   En caso de querer disminuir o aumentar el tiempo simplemente reemplaza el 5 con el tiempo deseado :)

### Modificaciones posibles:
Yo lo puse para que me avise cuando llega al 78% pero esto puede modificarse simplemente reemplazando el 78 en la linea 14 del script.






