# PetHelp
PetHelp es una aplicación JSP que te permite almacenar, editar y eliminar datos de tus mascotas y recordatorios. Funciona como agenda personal, mostrando sólo los resultados del usuario registrado. Esta aplicación usa encriptación de contraseñas mediante MD5.
* [Vídeo demostración de PetHelp](https://youtu.be/INAXblOiC7k)

![PetHelp Index](https://github.com/torrespedrob/PetHelp/blob/master/pethelp_index.png)
## Estructura
Consiste de 3 páginas principales: **index**, **lista de mascotas** y **lista de recordatorios**. Un usuario no logueado solo tendrá acceso al index, y en caso de quere acceder a otra página, será redireccionado y no se cargarán los contenidos de esta. Los usuarios logueados solo podrán ver sus contenidos, y no los de otros usuarios.
![mascotas](https://github.com/torrespedrob/PetHelp/blob/master/pethelp_mascotas.png)
![recordatorios](https://github.com/torrespedrob/PetHelp/blob/master/pethelp_recordatorios.png)
## Base de datos
Dispone de 3 tablas: **usuario**, **mascota** y **recordatorio**. Un usuario puede tener o no mascotas o recordatorios (al registrarse no tendrá ninguno de ellos). A una mascota le corresponde un usuario, y un recordatorio le corresponde a un usuario. La base de datos incluye datos de ejemplo para poder demostrar el correcto funcionamiento de la  aplicación.

![sql](https://github.com/torrespedrob/PetHelp/blob/master/sql.png)
## Funciones principales
* Crear usuarios o loguearse como uno ya existente. Darse de baja.
* Encriptación de contraseñas mediante MD5.
* Crear nuevas mascotas, modificarlas o eliminarlas.
* Crear recordatorios, modificarlos o eliminarlos.
* Impedir el acceso a usuarios no registrados y limitar las opciones de los registrados.
## Encriptación por MD5
El programa encripta las contraseñas y las compara a la hora de iniciar sesión. De esta forma, la contraseña de ejemplo de Pepe: 1234, no estará en plain text en la base de datos.

![md5](https://github.com/torrespedrob/PetHelp/blob/master/md5.png)
## Capturas
![editar_mascotas](https://github.com/torrespedrob/PetHelp/blob/master/edita_mascota.png)
![editar_recordatorios](https://github.com/torrespedrob/PetHelp/blob/master/edita_recordatorio.png)
![login](https://github.com/torrespedrob/PetHelp/blob/master/nuevologin.png)
![registro](https://github.com/torrespedrob/PetHelp/blob/master/nuevoregistro.png)
## Nueva funcionalidad extra
El programa ahora nos muestra una advertencia si intentamos crear un usuario ya existente, además de no permitir su registro.

![avisoregistro](https://github.com/torrespedrob/PetHelp/blob/master/registroyaexiste.png)

El programa muestra un aviso si el login no se realiza con éxito.

![avisologin](https://github.com/torrespedrob/PetHelp/blob/master/loginfallido.png)

Añadidas nuevas opciones para permitir a los usuarios iniciar sesión en el apartado de registro y permitir a los usuarios registrarse en caso de no tener una cuenta en el apartado de login.

![nuevologin](https://github.com/torrespedrob/PetHelp/blob/master/nuevologin.png)
![nuevoregistro](https://github.com/torrespedrob/PetHelp/blob/master/nuevoregistro.png)
## Tecnologías utilizadas
* [Bootswatch](https://bootswatch.com) - Bootstrap con temas personalizados.
* [Line Awesome](https://icons8.com/line-awesome) - Fuente de iconos Open-source alternativa a Font Awesome.
* [phpmyadmin](https://www.apachefriends.org/es/index.html) - Incluido en Xampp, manejo de la base de datos.
