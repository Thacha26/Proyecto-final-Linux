# Contribuciones 

Esta es una guía para las personas que desean hacer alguna contribución.

## Requisitos a instalar

- Necesitarás tener una cuenta de git
- A demás se debe de tener conocimientos previos en shell scripting

## Como clonar y configurar el proyecto

Clonar el repositorio de git, ya sea con SSH o HTTPS

HTTPS: https://github.com/Thacha26/Proyecto-final-Linux.git

SSH: git@github.com:Thacha26/Proyecto-final-Linux.git

## Convenciones de código

- Realizar comentarios en español
- (Realmente no hay una convención para las varianles, solo que estén en español)

## Formato de commits

```
[USUARIO][ACCIÓN][RAMA] "mensaje"
```

- El mensaje del commit debe de ser explícito, se debe de decir que archivo se modificó y que se modificó del archivo.

- En caso de crear un archivo, se debe de escribir en el commit que hace el archivo.

##  Como abrir un issue o pull request

- ## Issue
    - Ve a la pestaña "Issues"
    - Haz clic en "New Issue"
    - Proporciona información detallada del problema.

- ## Pull request

    - Haz un fork del repositorio
    - Crea una rama con tu contribución (**Nunca trabajar desde la rama principal**)
    - ```git push origin tu-rama```
    - Abre un Pull Request en GitHub
    - Describe los cambios

## Pruebas

Se debe de promar el nuevo archivo o cambio ya sea escribiendo mal a propósito algo o provocando algún error, no seguir instrucciones, etc, de esta forma se evitarán que el usuario tenga problemas al correr el código.