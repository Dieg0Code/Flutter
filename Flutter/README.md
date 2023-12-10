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