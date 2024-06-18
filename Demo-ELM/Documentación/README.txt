En esta DEMO he pensado en realizar un Portfolio con mis proyectos con un apartado de Contacto con mis links asociados.
Todo el código ha sido desarrollado utilizando el IDE VisualStudioCode en Windows 11.

----- COMANDOS PARA INICIALIZAR EL PROYECTO ----- 
El único comando que debemos poner es: 
	- elm init
Nos crea el archivo .json del proyecto donde se guardan todas las dependencias que utilizamos en el proyecto. Si no está creado
al ejecutar el comando, el mismo ELM nos dice si quiere que lo cree por nosotros. 
También crea las carpetas de nuestro proyecto:
	- /src --> Donde incluimos nuestros archivos .elm
	- /elm-stuff --> Donde se crean todos los archivos y directorios que necesitaremos para desarrollar el proyecto correctamente.

----- COMANDOS PARA VISUALIZAR ----- 
Todos estos comandos se deben realizar en un terminal abierto en el directorio de nuestro proyecto
Los archivos .js y .html ya se encuentran dentro del proyecto, pero en el caso de que estuviese vacio y quisieramos crearlos 
deberiamos ejecutar los siguientes comandos:
	- elm make "nombreDelArchivo.elm" --output "nombreDelArchivoJS.js" (Podemos cambiar el nombre al archivo .js para que sea más intuitivo)
	- Debemos crear nuestro archivo .html con la estructura que queramos para poder asociarle el archivo .js que acabamos de crear

Una vez creados los archivos sólo tenemos que ir a la carpeta donde tengamos el proyecto y abrir los archivos .html en nuestro navegador para poder 
ver nuestra implementación.

Otra opción es usar el localhost para visualizar un archivo .elm. Es muy útil ya que nos indica si hay errores en nuestro código, y en el caso de que no haya, 
nos permite ver como está quedando nuestro archivo. Si no incluimos CSS en nuestro archivo, este se verá tal cual en plano. 

elm reactor --> Nos permite ver nuestro proyecto en el localhost:8000 donde podemos acceder a los archivos .html para ver nuestra web
		    Si abrimos nuestro archivo .elm (en la carpeta /src) veremos nuestra web sin CSS.


----- PAQUETES INSTALADOS ----- 

HTTP --> elm install elm/http
Regex --> elm install elm/regex --> Nos permite trabajar con expresiones regulares
CSS --> elm install elm/css --> Nos permite incluir CSS directamente en nuestro archivo .elm. Es muy útil para ver en el reactor el aspecto que tendrá nuestro programa con CSS
VirtualDom --> elm install elm/virtual-dom --> Utilizado para renderizar el HTML del código más rapido y escribir el código usando funciones ELM 
Html.Styled --> elm install elm-lang/html --> Utilizado para incluir el CSS al archivo Signup.elm.

----- ANOTACIONES EXTRA ----- 
Como pequeña reflexión personal, durante el desarrollo de esta prueba he visto el gran potencial de ELM, un lenguaje con el que nunca había trabajado y que he tomado 
un reto personal. Como primera impresión del lenguaje veo que tiene una curva de aprendizaje considerable. La DEMO es bastante sencilla y soy consciente de que es muy mejorable tanto a niveles estéticos como de código. He tratado de incluir también algunas implementaciones más pero tampoco quería que quedase un código con mucha "rebujina". 
El desarrollo del código está basado en los ejemplos de la bibliografía del ELM, a la que he intentado sacarle el máximo partido en muy poco tiempo.
Cualquier duda, sugerencias o ayuda estaría encantado de recibirlas, lo que más me gustaría es aprender de mis errores para mejorarlos en proximas ocasiones.

De nuevo me gustaría darle las gracias por la oportunidad brindada ,el interés mostrado y la experiencia obtenida.


