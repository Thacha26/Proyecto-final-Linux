# INSTALACIÓN

En este archivo se esxplicará como instalar la terminal.

## Requisitos previos

- Se requiere tener un usuario y contraseña en el sistema operativo de la computadora en la que se va a instalar el programa, de lo contrario, no se podrá ingresar a la terminal.

- Haber clonado el repositorio previamente.

- Música descargada previamente y sabaer en que carpeta se encuentra.

- (De preferencia) Tener instalado mpg123, de lo contrario se le preguntará al usuario si desea instalarla, de ser así, se instala y ejecuta de manera automática.

## Clonar el repositorio

1. Dirigirse al repositorio "Proyecto-final-Linux"

2. En el apartado de <> Code, seleccionar el enlace **SSH** o **HTTPS**.

3. Dirigirse a la terminal y escribir:

```

git clone link_del_repositorio
```

Donde se deberá de pegar el link del repositorio seleccionado.


Crear un entorno virtual

## Instalar dependencias

**NO es necesario instalar ninguna dependencia**

## Configurar el entorno

**NO es necesario configurar el entorno**

## Ejecutar el proyecto

Se debe de escribir:

```
./Main.sh
```

Si se desea ingresar a la terminal

```
./nombre_del_archivo.sh
```
Si por el contrario se desea probar un archivo a la vez.

## Problemas comunes

- [ ] Ingresar un usuario o contraseña erróneos:

Se debe de ingresar el mismo usuario que se tiene en el sistema operativo, así como la misma contraseña que se usa para ingresar.

- [ ] No escribir **./** o **.sh** al final del nombre del archivo

- [ ] tratar de escribir cd:

Solo se debe de escribir el nombre del archivo al que se desea ingresar, por ejemplo, si se desea ingresar al archivo de **ayuda**, únicamente se debe de escribir ayuda

- [ ] No escribir correctamente las rutas:

Si al  momento de querer ingresar al reproductor de música, aparece un mensaje de error, lo más probable es que la ruta esté mal ingresada.

- [ ] Si hay algún error con los permisos, dar permiso con **chmod +x mi_script.sh**
