# Flutter

¿Qué es Flutter? Flutter es un SDK portable, open source framework y UI Widget Library, está fuertemente isnpirado en react, su objetivo es crear hermosas aplicaciones compiladas de forma nativa para móviles con una sola base de código.

Los Widget son las piezas de una interfaz como los botones, campos de texto, etc. Flutter provee un amplio rango de widgets que pueden ser usados para construir una interfaz de usuario. Otra ventaja es que podemos usar widgets de terceros o incluso crear nuestros propios widgets, empaquetarlos y compartirlos con otros desarrolladores en `pub.dev`.

Con Flutter tambien podemos crear aplicaciones incluso para la web, escritorio y embebidos.

## Estrucutra de un proyecto Flutter

- **.dart_tool**: Contiene archivos de configuración para el proyecto.
- **.idea**: Contiene archivos de configuración para el IDE, en el caso de que estemos usando IntelliJ.
- **android**: Contiene el proyecto de Android.
- **ios**: Contiene el proyecto de iOS.
- **lib**: Contiene el código fuente de la aplicación, es en donde escribiremos la mayor parte del código de Flutter.
- **test**: Contiene los archivos de test.
- **web**: Contiene el proyecto de la web.
- **pubspec.yaml**: Contiene la información del proyecto, como el nombre, versión, dependencias, etc.

## Hola mundo en Flutter

Toda aplicación de Flutter tiene en su main una ejecución de un Widget principal, esto comando es `runApp()` y recibe como parámetro el Widget principal de la aplicación.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Myapp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Hola mundo',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Hola mundo'),
                ),
                body: Center(
                    child: Text('Hola mundo'),
                ),
            ),
        );
    }
}
```