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

Toda app creada con Flutter tiene como pieza básica los Widgets, estos son funciones que dibujan ciertos componentes especificos en pantalla y que pueden ser modificados o configurados mediante argumentos que les pasemos, por ejemplo:

```dart
Text('Hola mundo')
```

En este caso el Widget `Text` recibe como argumento el texto que queremos mostrar en pantalla, pero también podemos pasarle otros argumentos como el color, el tamaño, etc.

Un Widget básico y escencial es el `Scaffold`, este es el que nos permite crear una pantalla con un AppBar y un cuerpo, el cual puede ser cualquier otro Widget.

```dart
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '10',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Clicks',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
```

## El estado de un Widget

El estado de un Widget es la información que este contiene, por ejemplo, el texto que contiene un `Text` o el color de un `Container`. El estado de un Widget puede ser mutable o inmutablel, podemos tener estados globales o locales, etc.

Los Widget `Stateful` permiten tener un estado interno y ciclo de vida como su inicialización y destrucción.

```dart
@override
State<CounterScreen> createState() => _CounterScreenState();
```

De esta forma declaramos un estado, por supuesto tenemos que cambiar el Widget a uno Stateless.

Declaramos un contador de clicks:

```dart
int clickCounter = 0;
```

Y cada vez que presionemos el botón actualizamos el estado para ver los cambios en este reflejados es la pantalla.

```dart
floatingActionButton: FloatingActionButton(
  onPressed: () {
    setState(() {
      clickCounter++;
    });
  },
  child: const Icon(Icons.plus_one),
),
```

Así se veria la pantalla completa nueva:

```dart
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            const Text(
              'Clicks',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
```

## Widgets básicos

### Text

Este Widget se utiliza para mostrar texto en la aplicación:

```dart	
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi Primera App Flutter'),
        ),
        body: Center(
          child: Text(
            '¡Hola, Diego!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

### Container

Este Widget se utiliza para crear un contenedor, el cual puede tener un ancho, alto, color, etc.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Container'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                '¡Hola, Diego!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado el widget `Container` para contener un texto en el centro de la pantalla. Aquí algunas cosas a destacar:

1. `width` y `height`: Establecen el ancho y alto del `Container` en 200 pixeles cada uno.
2. `color`: Establece el color de fondo del `Container` en azul.
3. `child`: Establece el widget hijo del `Container`, en este caso un `Text` con el texto "¡Hola, Diego!".

El `Container` es útil para ajustar el diseño de tus widgets y proporciona un conjunto de propiedades que te permiten personalizar su apariencia.

### Column

El widget ``Column`` es fundamental en Flutter y se utiliza para organizar widgets verticalmente. Puedes pensar en él como una columna en una hoja de cálculo, donde los widgets se apilan uno encima del otro.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Column'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola, Diego!'),
            Text('Bienvenido a Flutter'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Presiona aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado el widget ``Column`` para alinear verticalmente tres widgets: dos textos y un botón. Aquí hay algunas cosas a tener en cuenta:

1. `mainAxisAligment`:  Establecemos la alineación principal para centrar los elementos en la columna. Puedes ajustar esto según tus necesidades.
2. `children`: Dentro de la columna, especificamos una lista de widgets que queremos apilar verticalmente.

Puedes agregar cualquier widget como hijo de ``Column``, y estos se colocarán uno encima del otro en el orden en que los declares. Además, puedes ajustar la alineación, el espacio y otras propiedades para personalizar la apariencia de tu columna.

### Row

Al igual que ``Column``, ``Row`` es esencial y se utiliza para organizar widgets, pero en este caso, los organiza horizontalmente. Puedes imaginarlo como una fila en una hoja de cálculo. Aquí tienes un ejemplo básico:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Row'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.star, size: 50),
            Text('Flutter'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Presiona aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado el widget ``Row`` para alinear horizontalmente tres widgets: un ícono, un texto y un botón. Aquí hay algunas cosas a destacar:

1. `mainAxisAligment`: Establecemos la alineación principal para distribuir uniformemente los elementos en la fila. Puedes ajustar esto según tus necesidades.
2. `children`: Dentro de la fila, especificamos una lista de widgets que queremos alinear horizontalmente.

Al igual que con ``Column``, puedes agregar cualquier widget como hijo de ``Row``, y estos se colocarán uno al lado del otro en el orden en que los declares. Además, puedes ajustar la alineación, el espacio y otras propiedades para personalizar la apariencia de tu fila.

### Errores de overflow

Los errores de overflow son comunes en Flutter cuando el contenido de un widget es demasiado grande para ser mostrado correctamente en el espacio disponible. Aquí hay algunas estrategias comunes para abordar los errores de overflow:

#### Uso de SingleChildScrollView

Si estás experimentando overflow en una columna o fila, puedes envolverla con un ``SingleChildScrollVie``w. Esto permite que el contenido sea desplazable, evitando así errores de overflow. Aquí hay un ejemplo:

```dart
SingleChildScrollView(
  child: Column(
    // tu contenido aquí
  ),
)
```

#### Limitando el tamaño

Asegúrate de que tus widgets tengan tamaños limitados o utiliza propiedades como ``Expanded`` para ocupar el espacio disponible de manera eficiente.

#### Uso de ListView

Si tienes una lista de elementos, considera utilizar un ``ListView`` en lugar de una ``Column`` o ``Row``. Esto permite desplazamiento automático y manejo eficiente de elementos.

#### Uso de FittedBox

Si el desbordamiento es debido al tamaño del widget, puedes utilizar ``FittedBox`` para ajustar automáticamente el tamaño del contenido al espacio disponible.

```dart
FittedBox(
  fit: BoxFit.contain, // ajusta el contenido
  child: YourWidget(),
)
```

#### Uso de Expanded

Si estás trabajando con una ``Column`` y uno de los elementos debería ocupar todo el espacio restante, usa ``Expanded``.

```dart
Column(
  children: [
    Text('Widget 1'),
    Expanded(
      child: Container(
        // Este widget ocupará el espacio restante
      ),
    ),
  ],
)
```

#### Uso de CrossAxisAlignment

Ajusta la alineación cruzada para asegurarte de que los elementos no se desborden.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    // tus widgets aquí
  ],
)
```

Recuerda que la clave es entender por qué ocurre el desbordamiento y elegir la estrategia adecuada según tu diseño y requisitos.

### Flexible

El widget ``Flexible`` es útil cuando trabajas con ``Column`` o ``Row`` y deseas asignar proporciones flexibles del espacio disponible a diferentes hijos. Aquí tienes un ejemplo:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Flexible'),
        ),
        body: Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
                height: 100,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Stack

El widget ``Stack`` se utiliza para apilar varios widgets uno encima del otro. Cada widget en un Stack ocupa toda el área disponible, y los widgets secundarios pueden superponerse.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Stack'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 300,
              width: 300,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              child: Container(
                color: Colors.green,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado un ``Stack`` con tres ``Container`` superpuestos. Aquí algunas cosas a destacar:

1. `Stack`: Contiene una lista de widgets secundarios que se superponen.
2. `Positioned`: Es utilizado para posicionar de manera específica un widget dentro del ``Stack``. Puedes establecer las coordenadas superior, inferior, izquierda y derecha para controlar la posición del widget.

Recuerda que el orden en que colocas los widgets dentro del Stack determina cómo se superponen. Los widgets más cercanos al principio de la lista estarán en la parte inferior y los más cercanos al final estarán en la parte superior.

### Scaffold

El widget ``Scaffold`` proporciona una estructura visual básica para una aplicación. Es comúnmente utilizado como el elemento principal de la interfaz de usuario de la aplicación y contiene varios widgets como ``AppBar``, ``Drawer``, ``BottomNavigationBar``, y más. Aquí hay un ejemplo básico:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi App con Scaffold'),
        ),
        body: Center(
          child: Text('¡Hola, Mundo!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Acción cuando se presiona el botón flotante
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

En este ejemplo:

1. `Scaffold`: Contiene la estructura principal de la aplicación y envuelve otros elementos como ``AppBar``, ``body``, y ``floatingActionButton``.
2. `AppBar`: Es la barra superior que muestra el título de la aplicación.
3. `body`: Es el área principal donde colocas el contenido de la aplicación.
4. `floatingActionButton`: Es un botón flotante que generalmente se utiliza para acciones principales en la aplicación.

Estos son solo algunos de los elementos que puedes incluir en un ``Scaffold``. Dependiendo de tus necesidades, también puedes agregar un ``Drawer`` para un menú lateral, una ``BottomNavigationBar`` para navegación inferior, entre otros.

El ``Scaffold`` es una parte esencial en el desarrollo de aplicaciones Flutter y proporciona una estructura coherente para las aplicaciones móviles.

### SafeArea

El widget ``SafeArea`` es utilizado para garantizar que el contenido de tu aplicación no se vea obstruido por áreas seguras del dispositivo, como la barra de estado o la barra de navegación. Aquí tienes un ejemplo básico:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de SafeArea'),
        ),
        body: SafeArea(
          child: Center(
            child: Text('¡Hola, Mundo!'),
          ),
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos envuelto el contenido de ``Scaffold`` con el widget ``SafeArea``. Esto asegura que el texto "¡Hola, Mundo!" no se coloque debajo de la barra de estado o cualquier área segura en el dispositivo.

``SafeArea`` es especialmente útil cuando trabajas con dispositivos con muescas (notches) o barras de navegación en la parte inferior, ya que garantiza que tu contenido sea visible y no se vea cortado por estas áreas.

Puedes personalizar aún más ``SafeArea`` ajustando propiedades como ``top``, ``bottom``, ``left``, y ``right`` según tus necesidades. Por ejemplo:

```dart
SafeArea(
  top: false, // evita el espacio seguro en la parte superior
  bottom: true, // deja espacio seguro en la parte inferior
  child: YourContentWidget(),
)
```

Esto es útil cuando quieres controlar en qué áreas específicas del dispositivo deseas que ``SafeArea`` tenga efecto.

### SingleChildScrollView 

El widget ``SingleChildScrollView`` es utilizado para envolver un conjunto de widgets y permitir el desplazamiento vertical cuando el contenido es más grande que el área visible. Aquí tienes un ejemplo básico:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de SingleChildScrollView'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              20,
              (index) => Container(
                height: 100,
                width: double.infinity,
                color: index % 2 == 0 ? Colors.blue : Colors.green,
                child: Center(
                  child: Text('Elemento $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado ``SingleChildScrollView`` para envolver una ``Column`` que contiene una lista generada de contenedores. La propiedad ``child`` de ``SingleChildScrollView`` puede contener cualquier widget que necesite ser desplazable.

Alguna cosas a destacar:

1. `child`: Especifica el widget que será desplazable. En este caso, es una ``Column`` con una lista de contenedores.
2. `List.generate`: Es utilizado para generar una lista de contenedores. En este ejemplo, generamos 20 contenedores con diferentes colores.

Recuerda que el ``SingleChildScrollView`` es útil cuando tienes mucho contenido que no cabe en la pantalla y necesitas permitir que el usuario lo desplace para verlo todo.

### ListView

El widget ``ListView`` en Flutter se utiliza para mostrar una lista de widgets, generalmente en una disposición vertical, y permite al usuario desplazarse a través de la lista. Aquí tienes un ejemplo básico de cómo se usa ``ListView``:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de ListView'),
        ),
        body: ListView(
          children: List.generate(
            20,
            (index) => ListTile(
              title: Text('Elemento $index'),
              onTap: () {
                // Acción al tocar un elemento
              },
            ),
          ),
        ),
      ),
    );
  }
}
```

En este ejemplo, hemos utilizado un ``ListView`` que contiene una lista de ``ListTile`` generados dinámicamente. Cada ``ListTile`` representa un elemento de la lista. Aquí hay algunas cosas a tener en cuenta:

1. `children`: Especifica la lista de widgets que se mostrarán en el ``ListView``. En este caso, usamos ``List.generate`` para generar dinámicamente una lista de ``ListTile``.``
2. `onTap`: Se utiliza en el ``ListTile`` para definir una acción que se realizará cuando el usuario toque un elemento de la lista. Puedes personalizar esto según tus necesidades.

El ``ListView`` es especialmente útil cuando tienes una lista de elementos y quieres que el usuario pueda desplazarse a través de ellos. También es eficiente en cuanto a recursos, ya que solo carga en la memoria los elementos visibles en la pantalla.

### Fuentes personalizadas


En Flutter, puedes utilizar fuentes personalizadas para darle un aspecto único y distintivo a tu aplicación. Aquí te muestro los pasos básicos para agregar fuentes personalizadas a tu proyecto:

#### Obtener fuentes personalizadas

Primero, asegúrate de tener el archivo de la fuente en tu proyecto. Puedes obtener fuentes personalizadas de diversos recursos en línea o diseñarlas tú mismo.

#### Agregar la fuente al proyecto

Coloca el archivo de la fuente en una carpeta dentro de tu proyecto. Puedes crear una carpeta, por ejemplo, llamada "fonts" en el directorio raíz de tu proyecto.

#### Actualizar el archivo pubspec.yaml

Abre el archivo ``pubspec.yaml`` y agrega la siguiente configuración para incluir la fuente en tu proyecto:

```yaml
flutter:
  fonts:
    - family: MiFuentePersonalizada
      fonts:
        - asset: fonts/MiFuentePersonalizada-Regular.ttf
```

Asegúrate de reemplazar "MiFuentePersonalizada" con el nombre de tu fuente y "MiFuentePersonalizada-Regular.ttf" con la ruta relativa del archivo de tu fuente.

#### Reiniciar la aplicación

Después de agregar la configuración en ``pubspec.yaml``, recarga tu proyecto Flutter. Puedes hacer esto ejecutando ``flutter pub get`` en la terminal o utilizando la opción de recarga en tu IDE.

#### Usar la fuente en tu aplicación

Ahora puedes utilizar la fuente personalizada en tu aplicación. Puedes aplicarla a un ``TextStyle`` en un widget ``Text``, por ejemplo:

```dart
Text(
  'Hola, Mundo!',
  style: TextStyle(
    fontFamily: 'MiFuentePersonalizada',
    fontSize: 24.0,
  ),
)
```

Recuerda ajustar el nombre de la fuente según lo que hayas especificado en tu archivo ``pubspec.yaml``.

Con estos pasos, deberías poder agregar y utilizar fuentes personalizadas en tu aplicación Flutter.

### Iconos

En Flutter, puedes utilizar iconos para mejorar la apariencia de tu aplicación. Flutter incluye un conjunto de iconos predefinidos que puedes utilizar, y también te permite usar iconos personalizados. Aquí hay una guía básica sobre cómo trabajar con iconos en Flutter:

#### Iconos Predefinidos

Flutter incluye un conjunto de iconos predefinidos proporcionados por el paquete `Icons`. Puedes utilizarlo directamente en tus Widgets. Aquí un ejemplo:

```dart
Icon(Icons.star, color: Colors.yellow, size: 48.0),
```

Este ejemplo muestra un icono de estrella con un color amarillo y un tamaño de 48 píxeles.

#### Paquete flutter_launcher_icons

Si necesitas más iconos o deseas utilizar un conjunto de iconos personalizados, puedes usar el paquete ``flutter_launcher_icons`` para personalizar los iconos de la aplicación. Este paquete te permite especificar los iconos de la aplicación para diferentes plataformas y tamaños.

#### Iconos Personalizados

Puedes utilizar tus propios iconos personalizados. Asegúrate de tener los archivos de tus iconos (por ejemplo, en formato SVG) y convertirlos a un formato compatible con Flutter.

```dart
Icon(
  IconData(0xe800, fontFamily: 'MiIconoPersonalizado'),
  color: Colors.blue,
  size: 32.0,
),
```

En este ejemplo, ``0xe800`` es el código unicode de tu icono personalizado, y ``'MiIconoPersonalizado'`` es el nombre de la fuente que contiene el icono.

#### Paquete flutter_icons

Otro paquete útil es ``flutter_icons``. Este paquete te permite personalizar los iconos de tu aplicación para diferentes plataformas y tamaños, de manera similar a ``flutter_launcher_icons``.

#### Uso de IconData para Iconos Personalizados

Puedes utilizar el constructor ``IconData`` para crear tus propios iconos personalizados. Aquí hay un ejemplo:

```dart
Icon(
  IconData(0xe801, fontFamily: 'MiIconoPersonalizado'),
  color: Colors.red,
  size: 24.0,
),
```

Recuerda ajustar los valores según tus necesidades y la configuración de tu aplicación.