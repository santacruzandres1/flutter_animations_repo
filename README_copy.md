# Flutter Animations Repo

Este repositorio contiene un conjunto de animaciones reutilizables y widgets animados para usar en proyectos Flutter. Está diseñado para ser fácil de integrar y extender, siguiendo buenas prácticas de código limpio.

## Características

- **Animaciones reutilizables**: Animaciones comunes como desvanecimiento, deslizamiento, escala y rotación.
- **Widgets animados**: Widgets personalizados que utilizan las animaciones incluidas.
- **Utilidades**: Funciones auxiliares para facilitar el trabajo con animaciones.
- **Extensible y mantenible**: Estructurado para facilitar la expansión y el mantenimiento.

## Instalación

Agregar este paquete al archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_animations_repo:
    git:
      url: https://github.com/tu_usuario/flutter_animations_repo.git
      ref: main
```

#### Luego, ejecuta:
```sh
flutter pub get
```

## Uso
 Animaciones
Importar y utilizar las animaciones en el proyecto:

```dart

import 'package:flutter_animations_repo/flutter_animations_repo.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Text('Hola Mundo'),
      duration: Duration(seconds: 2),
    );
  }
}
```

#### Widgets Animados
```dart

import 'package:flutter_animations_repo/flutter_animations_repo.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {},
      child: Text('Presióname'),
    );
  }
}
```
## Proyecto de Ejemplo
Podes encontrar un ejemplos en el directorio example/.

```sh

cd example
flutter run
```
## Estructura del Proyecto
```plaintext

flutter_animations_repo/
├── example/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── group_animations/
│   │   │   ├── fade_animation_example.dart
│   │   │   ├── slide_animation_example.dart
│   │   │   ├── scale_animation_example.dart
│   │   │   ├── rotate_animation_example.dart
│   │   │   └── wave_animation_example.dart
│   │   └── widget_examples/
│   │       ├── animated_button_example.dart
│   │       ├── animated_container_example.dart
│   │       └── liquid_linear_progress_indicator_example.dart
│   └── pubspec.yaml
├── lib/
│   ├── src/
│   │   ├── animations/
│   │   │   ├── fade_animation.dart
│   │   │   ├── rotate_animation.dart
│   │   │   ├── scale_animation.dart
│   │   │   ├── slide_animation.dart
│   │   │   └── wave_animation.dart
│   │   ├── extensions/
│   │   ├── models/
│   │   ├── utils/
│   │   │   └── animation_utils.dart
│   │   └── widgets/
│   │       ├── animated_button.dart
│   │       ├── animated_container.dart
│   │       └── liquid_linear_progress_indicator.dart
│   └── flutter_animations_repo.dart
├── LICENSE
├── pubspec.yaml
├── README.md
├── test/
│   ├── animations/
│   │   ├── fade_animation_test.dart
│   │   └── slide_animation_test.dart
│   ├── utils/
│   │   └── animation_utils_test.dart
│   └── widgets/
│       └── animated_button_test.dart
└── .gitignore

```

## Contribuir
¡Contribuciones son bienvenidas! Por favor, abre un issue para discutir lo que te gustaría cambiar o aportar.

* Haz un fork del proyecto
* Crea una rama con tu nueva funcionalidad (git checkout -b feature/nueva-funcionalidad) 
* Haz commit de tus cambios (git commit -m 'Agregar nueva funcionalidad')
* Haz push a la rama (git push origin feature/nueva-funcionalidad)
* Abre un Pull Request
