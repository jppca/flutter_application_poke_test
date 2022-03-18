# POKETEST

Proyecto de prueba técnica.

- Versión de Dart: 2.16.1
- Versión de Flutter: 2.10.1

Paquetes utilizados en el proyecto:
  - shared_preferences: ^2.0.13
  - provider: ^6.0.1
  - http: ^0.13.4

### Proceso de instalación de herramientas de desarrollo en Windows 10 para realizar Apps con Flutter.

#### Instalación de Flutter.
- 1-Descargar el archivo .zip del SDK de [Flutter](https://docs.flutter.dev/development/tools/sdk/releasesl)
- 2-Extraer los archivos en la ruta que crea pertinente (Es recomendable dejarlo en la ubicación “C:\flutter” para una configuración más rápida).
- 3-Busque la opción del sistema “Editar las variables de entorno del sistema” y seleccione.
- 5-Da click en la opción de Variables de entorno.
- 6-En Variables del sistema, selecciona la variable Path y luego click en Editar.
- 7-Da click en Nueva y pega la ruta de la carpeta bin de Flutter.
(Si usa la ruta recomendada sería algo como lo siguiente “C:\flutter\bin”)
- 8-Da click en “Aceptar” en las ventanas abiertas durante el proceso anterior.
#### Instalación de Android Studio y SDK para compilación de proyecto en Android.
- 1-Descarga el Instalador de Android Studio.
- 2-Seguir la instalación por defecto dando click en “Next” hasta el apartado de SDK de android.
- 3-Al encontrarse en el punto donde se pide la instalación de SDK de Android da click en el botón que tiene 3 puntos “…”.
- 4-Se abrirá el explorador de archivos.
- 5-Selecciona la ubicación de tu elección para crear un directorio de carpetas para el alojamiento del SDK.
 (Es recomendable dejarlo en la ubicación “C:\Android\SDK\” creando la carpeta Android y SDK )
- 6-Después de la creación del directorio, da click en “Next” hasta llegar a la parte final y da click en “Finish”.
#### Instalar el plugin de Flutter en Android Studio.
- 1-En la ventana Welcome to Android Studio da click en “Configure” y luego en “Plugins”.
- 2-En la barra de búsqueda digita flutter y da click en “Search in repositories”.
- 3-Da click en el que dice “Flutter”, Luego en “Install” y “Accept”.
- 4-Ahora da click en “Restart Android Studio”.
- 5-Se abrirá nuevamente Android Studio.
#### Agregar el SDK de Android a Flutter.
- 1-Abrimos nuevamente las Variables de entorno.
- 2-En Variables del sistema da click en Nueva.
- 3-En Nombre de la variable digita ANDROID_HOME.
- 4-Da click en “Examinar” directorio y selecciona la ruta en donde descargarte el SDK de android.
- 5-Ahora da click en “Aceptar” en las 3 ventanas para guardar cambios.
- 6-Presiona la tecla Windows y en la barra de búsqueda digita cmd y selecciona la Command Prompt o Símbolo del sistema.
- 7-Digita el comando “flutter doctor” y presiona Enter.
- 8-Posiblemente te indicara que falta aceptar las licencias de Android, así que digita el siguiente comando y presiona Enter:
    “flutter doctor --android-licenses”
- 9-Ahora te preguntará si aceptas cada licencia, en la cual debes digitar “Y“ y presionar Enter para cada licencia.
- 10-Cuando hallas aceptado todas las licencias te saldrá un mensaje de aceptación de licencias como respuesta.
#### Crear Emulador de Android en Android Studio.
- 1-En Android Studio da click en Tools > AVD Manager.
- 2-Ahora click en Create Virtual Device.
- 3-Selecciona el dispositivo de su preferencia y da click en "Next".
- 4-Selecciona la imagen del sistema Android y  da click en "Finish".
- 5-Como paso final da click en el botón de Run para ejecutar el Emulador de Android.

### Terminando los pasos anteriores ya es posible el poder trabajar con flutter desde el IDE de Android Studio.

## Comandos importantes que ayudan en configuración de  Dart y Flutter.

<table>
<tr>
  <td> 
      <br>
       Flutter
      <br>
  </td>
  <td> 
      <br>
       Dart
      <br> 
  </td>
 </tr>
  <tr>
  <td> 
      <br>
      Version: flutter --version
      <br>
  </td>
  <td> 
      <br>
       Version: dart --version
      <br> 
  </td>
 </tr>
  <tr>
  <td> 
      <br>
      SDK location: where flutter
      <br>
  </td>
  <td> 
      <br>
       SDK location: where dart
      <br> 
  </td>
 </tr>
  <tr>
  <td> 
      <br>
      Detailed information: flutter doctor -v
      <br>
  </td>
  <td> 
  </td>
 </tr>
  <tr>
  <td> 
      <br>
      SDK location: where flutter
      <br>
  </td>
  <td> 
  </td>
 </tr>
</table>

- [Documentación de apoyo para Flutter](https://docs.flutter.dev/get-started/install)

Señalar que también es posible utilizar Visual Studio Code  como herramienta de desarrollo instalando la extensión de Flutter.

## Puesta en marcha de App  “POKETEST”.

Lo primero es descargar o clonar este  repositorio.

- En caso de utilizar Android Studio abrir el proyecto desde el IDE, seleccionar la carpeta “lib” y buscar el archivo “main.dart” para abrirlo y posteriormente dar click en el boto de “Run” para ejecutar el proyecto en  un  emulador del mismo Android Studio.

- En Visual Studio Code  lo primero es abrir el proyecto posteriormente  acceder a  la carpeta “lib” buscar el archivo  “main.dart”  para abrirlo y  en la barra de herramientas da click en View > Debug > Start Debugging o  da click en F5.
El siguiente paso es seleccionar un emulador previamente creado  en Android Studio  y  presionar Enter para ejecutar el proyecto.

## Resultado obtenido en el proyecto.

- 1-Simulación de inicio de sesión con validaciones.
- 2-Simulación de persistencia en una sesión de usuario.
- 4-simulación de  un cierre de sesión de usuario.
- 3-Consulta a servicio PokeAPI.
- 4-Persistencia de algunos Pokémones.
- 5-Eliminación de Pokémones guardados por usuario.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
