# PetHelp
PetHelp es una aplicación JSP que te permite almacenar, editar y eliminar datos de tus mascotas y recordatorios. Funciona como agenda personal, mostrando sólo los resultados del usuario registrado. Esta aplicación usa encriptación de contraseñas mediante MD5.
![PetHelp Index](https://github.com/torrespedrob/PetHelp/blob/master/pethelp_index.png)
## Estructura
Consiste de 3 páginas principales: **index**, **lista de mascotas** y **lista de recordatorios**. Un usuario no logueado solo tendrá acceso al index, y en caso de quere acceder a otra página, será redireccionado y no se cargarán los contenidos de esta. Los usuarios logueados solo podrán ver sus contenidos, y no los de otros usuarios.
## Base de datos
Dispone de 3 tablas: **usuario**, **mascota** y **recordatorio**. Un usuario puede tener o no mascotas o recordatorios (al registrarse no tendrá ninguno de ellos). A una mascota le corresponde un usuario, y un recordatorio le corresponde a un usuario. La base de datos incluye datos de ejemplo para poder demostrar el correcto funcionamiento de la aplicación.
## Funciones principales
* Crear usuarios o loguearse como uno ya existente. Darse de baja.
* Encriptación de contraseñas mediante MD5.
* Crear nuevas mascotas, modificarlas o eliminarlas.
* Crear recordatorios, modificarlos o eliminarlos.
* Impedir el acceso a usuarios no registrados y limitar las opciones de los registrados.
