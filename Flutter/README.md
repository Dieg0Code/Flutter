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

## Navegación y Diálogos

La navegación entre nos permite movernos entre pantallas y vistas de una app. En Flutter, puedes utilizar el widget ``Navigator`` para gestionar la navegación entre rutas.

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaPantalla()),
);
```

En este ejemplo, ``Navigator.push`` se utiliza para navegar a una nueva pantalla llamada ``SegundaPantalla``. Puedes personalizar la transición y la animación de la navegación según tus necesidades. Aquí hay un ejemplo de cómo regresar a la pantalla anterior:

```dart
Navigator.pop(context);
```

`.pop()` destruye la pantalla actual y regresa a la anterior en el árbol de navegación, hay que tener cuidado con usar esto ya que si no hay una pantalla anterior la aplicación fallará y nos quedaremos con una pantalla en negro. Para evitar esto podemos usar:

```dart
Navigator.maybePop(context);
```

Con lo cual prevenimos que si no hay mas pantallas a las que navegar de vuelta no pase nada y no se rompa la app.

### Pasar datos a una pantalla

Muchas veces querremos pasar datos a otras pantallas como emails u otro tipo de datos, una forma de hacer esto es:

```dart
final route = MaterialPageRoute(
  builder: (_) => LoginPage(
    email: faker.internet.email(),
  ),
);
```

o también se pude hacer asi:

```dart
final = route = MaterialPageRoute(
  builder: (_) => LoginPage(),
  settings: RouteSettings(
    arguments: faker.internet.email(),
  ),
);
```

Para que esta segunda forma funcione debemos usar la clase `ModalRoute` en la pantalla `LoginPage`

```dart
final modalRoute = ModalRoute.of(context)!;
final email = modalRoute.settings.arguments as String;
```

De esta forma estamos capturando el valor que se le paso a esta pantalla en la variable `email`.

Sin embargo usar esta segunda forma es propenso a errores ya que si estamos pasando un dato de tipo `Int` pero en la otra pantalla lo estamos tratando de castear a un `String` nos va a dar errores. Es por esto que es recomendable usar la primera forma.

### popUntil

El método `popUntil` nos permite navegar hacia atrás en la pila de rutas hasta que se cumpla una condición específica. Por ejemplo, si queremos cerrar todas las pantallas y volver a la pantalla de inicio, podemos hacer lo siguiente:

```dart
Navigator.popUntil(
  context,
  (route) {
    final name = route.settings.name;
    return name == '/';
  }
);
```

En este caso, estamos cerrando todas las pantallas hasta que llegamos a la pantalla de inicio, que tiene la ruta '/'. Podemos personalizar la condición según nuestras necesidades.

`pushReplacement` es un método que nos permite reemplazar la ruta actual con una nueva ruta, es decir, navegamos a una nueva pantalla y destruimos la anterior. Por ejemplo:

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NuevaPantalla()),
);
```

Con esto si queremos volver a la pantalla anterior no podremos hacerlo ya que la pantalla anterior fue destruida.

### Forma correcta de pasar datos a otra pantalla

La forma correcta de pasar datos a otra pantalla es obtener el dato y guardarlo en una variable antes de pasarlo a la otra pantalla con `MaterialPageRoute`.

```dart
final email = faker.internet.email();
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LoginPage(email: email),
  ),
);
```

### Navegación usando nombres de rutas

En lugar de pasar directamente el constructor de la pantalla, puedes definir un mapa de rutas en tu aplicación y navegar utilizando nombres de rutas. Esto puede hacer que tu código sea más legible y mantenible.

```dart
final routes = {
  '/': (context) => HomePage(),
  '/login': (context) => LoginPage(),
  '/profile': (context) => ProfilePage(),
};

Navigator.pushNamed(context, '/login');
```

Este mapa lo podemos definir en el `MaterialApp` en la propiedad `routes`.

```dart
MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
    '/profile': (context) => ProfilePage(),
  },
);
```

Si una ruta tiene un nombre con múltiples palabras lo común es usar guiones medios para separar las palabras, por ejemplo: ``/profile-page``.

Luego podemos navegar a una ruta específica utilizando el método `pushNamed`.

```dart
Navigator.pushNamed(context, '/login');
```

También es común y recomendable establecer estas rutas en una clase separada para mantener el código organizado y fácil de mantener, por ejemplo crear un carpeta `routes` y dentro de esta un archivo `app_routes.dart`.

```dart
class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const profile = '/profile';
}

get routes => {
  AppRoutes.home: (context) => HomePage(),
  AppRoutes.login: (context) => LoginPage(),
  AppRoutes.profile: (context) => ProfilePage(),
};
```

después importamos este archivo en el archivo principal y lo usamos de la siguiente forma:

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    routes: AppRoutes.routes,
  );
}
```

### Pasar datos a otra pantalla usando rutas con nombres

Podemos pasar datos a otra pantalla utilizando rutas con nombres de la siguiente forma:

```dart
Navigator.pushNamed(
  context,
  '/login',
  arguments: email,
);
```

El método `pushNamed` acepta un argumento adicional llamado `arguments` que se puede utilizar para pasar datos a la pantalla de destino. Luego, en la pantalla de destino, podemos acceder a estos datos usando el contexto.

```dart
final email = ModalRoute.of(context)!.settings.arguments as String;
```

Ese fragmento de código se va a usar muchas veces, por lo que es recomendable crear un método que haga esto por nosotros.

```dart
Object? getArgument(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments;
}
```

De esta forma podemos usar este método en cualquier pantalla para obtener los argumentos que se le pasaron.

Un problema con este método es que estamos retornando un `Object` y luego tenemos que castearlo a un tipo específico, lo cual puede ser propenso a errores. Una forma de evitar esto es usar genéricos para controlar el tipo de dato que estamos pasando.

```dart
T getArgument<T>(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments as T;
}
```

De esta forma podemos obtener el argumento de la siguiente forma:

```dart
final email = getArgument<String>(context);
```

### pushReplacementName

Podemos definir la ruta inicial de nuestra aplicación con el parámetro `initialRoute` en el `MaterialApp`.

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
    '/profile': (context) => ProfilePage(),
  },
);
```

Por lo generar cuando inciamos una app nos encontramos con la `splash screen` la cual se suele mostrar al principio de la aplicación, por lo que esta suele ser la `initialRoute`, pero, una vez mostrada esta pantalla no queremos que el usuario pueda volver atrás y volver a ver esta pantalla, para esto podemos usar `pushReplacementName`.

```dart
Navigator.pushReplacementNamed(context, '/home');
```

### pushNameAndRemoveUntil

Otra forma de navegar a una pantalla y eliminar todas las pantallas anteriores es utilizando `pushNamedAndRemoveUntil`.

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,
);
```

En este caso, estamos navegando a la ruta '/home' y eliminando todas las rutas anteriores en la pila de navegación, con esta forma de navegar no se puede volver a las pantallas anteriores.

### Retornar datos de una pantalla

Supongamos que estamos navegando por la aplicación llegamos a una pantalla que contiene algún tipo de dato y después regresamos a una pantalla anterior pero en esta pantalla queremos que se muestre el dato que obtuvimos en la pantalla anterior, para esto podemos usar `pop` y `then`.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SegundaPantalla(),
  ),
).then((value) {
  print('Dato recibido: $value');
});
```

En la pantalla que queremos que nos devuelva el dato usamos `pop` y le pasamos el dato que queremos que nos devuelva.

```dart
Navigator.pop(context, 'Dato de la segunda pantalla');
```

En un caso mas practico, supongamos que en una pantalla seleccionamos un color y queremos que este color se muestre en la pantalla anterior.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ColorPickerScreen(),
  ),
).then((color) {
  setState(() {
    selectedColor = color;
  });
});
```

En la pantalla de selección de color usamos `pop` para devolver el color seleccionado.

```dart
Navigator.pop(context, selectedColor);
```

También en vez de usar `then` podemos usar `async` y `await`.

```dart
ListTile(
  onTap: () async {
    final route = MaterialPageRoute(
      builder: (_) => ColorPickerScreen(),
    );
    final result = await Navigator.push(context, route);

  }
),
```

## Diálogos

Los Diálogos son un Widget esencial en las aplicaciones móviles, ya que nos permiten captar la atención del usuario para así mostrarle información importante o solicitar su confirmación antes de realizar una acción. En Flutter, puedes mostrar diálogos utilizando el widget `showDialog`.

```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Título del Diálogo'),
      content: Text('Contenido del Diálogo'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  },
);
```

Este es un ejemplo básico de cómo mostrar un diálogo en Flutter. El método `showDialog` acepta un `BuildContext` y un `builder` que devuelve el contenido del diálogo. Puedes personalizar el diálogo con diferentes widgets, como `Text`, `TextField`, `FlatButton`, etc.

Este Widget puede recibir varios argumentos para personalizar el diálogo, como `title`, `content`, `actions`, `backgroundColor`, `elevation`, `shape`, entre otros.

Por ejemplo un dialogo para confirmar o negar la acción de borrar un elemento.

```dart	
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Eliminar Elemento'),
      content: Text('¿Estás seguro de que deseas eliminar este elemento?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Eliminar el elemento
            Navigator.pop(context);
          },
          child: Text('Eliminar'),
        ),
      ],
    );
  },
);
```

En donde se muestra un dialogo con un título y un contenido, y dos botones, uno para cancelar y otro para eliminar el elemento, si se presiona el botón de eliminar se elimina el elemento y se cierra el dialogo.

Es común y recomendado que guardemos los diálogos en Widgets independientes para poder reutilizarlos y para que Hot Reload funcione correctamente.

```dart
class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const ConfirmDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Eliminar'),
        ),
      ],
    );
  }
}
```

De esta forma podemos usar este dialogo en cualquier parte de la aplicación.

```dart
showDialog(
  context: context,
  builder: (context) {
    return ConfirmDialog(
      title: 'Eliminar Elemento',
      content: '¿Estás seguro de que deseas eliminar este elemento?',
      onConfirm: () {
        // Eliminar el elemento
        Navigator.pop(context);
      },
    );
  },
);
```

Por lo general vamos a querer retornar datos de nuestros diálogos, como boleanos o cualquier tipo dependiendo de la acción que se realice en el dialogo, para esto podemos usar `Navigator.pop`.

```dart
Future<bool> showConfirmDialog(BuildContext context) async {
  final result = await showDialog(
    context: context,
    builder: (context) {
      return ConfirmDialog(
        title: 'Eliminar Elemento',
        content: '¿Estás seguro de que deseas eliminar este elemento?',
        onConfirm: () {
          Navigator.pop(context, true);
        },
      );
    },
  );

  return result ?? false;
}
```

Como los diálogos esperan a que el usuario haga alguna acción, devuelven un `Future` como tipo de dato, podemos establecer con un genérico el tipo de dato que esperamos que devuelva el dialogo, esto quiere decir también que es una función asíncrona, por lo que podemos usar `async` y `await` para con eso poder capturar el valor que devuelve en alguna variable, en este caso `result`.

Podemos redondear los bordes de un dialogo usando la propiedad `shape` de `AlertDialog`.

```dart
AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
);
```

También podemos modificar el parámetro `barrierColor` para cambiar el color de fondo del dialogo.

```dart
showDialog(
  context: context,
  barrierColor: Colors.black.withOpacity(0.5),
  builder: (context) {
    return AlertDialog(
      title: Text('Título del Diálogo'),
      content: Text('Contenido del Diálogo'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  },
);
```

Una opción util también en caso de que queremos que el usuario si o si confirme o deniegue una acción es desactivar la opción de cerrar el dialogo al tocar fuera de este, esto lo podemos configurar dejando en `false` la propiedad `barrierDismissible`.

```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) {
    return AlertDialog(
      title: Text('Título del Diálogo'),
      content: Text('Contenido del Diálogo'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Aceptar'),
        ),
      ],
    );
  },
);
```

### Cupertino Style Dialogs

IOS tiene un sistema de diseño llamado `Cupertino` el cual es característico de las aplicaciones de Apple, como Flutter nos permite desarrollar aplicaciones multiplataforma podemos usar este estilo de diseño si queremos.