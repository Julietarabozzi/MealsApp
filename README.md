# Meal App

Una aplicación de Flutter que permite a los usuarios buscar, ver detalles y explorar diferentes comidas y recetas utilizando la API de MealDB.

## Características

- Explora diferentes comidas y recetas.
- Ver detalles de una comida seleccionada.
- Carga de imágenes y detalles de las comidas.
- Uso de la arquitectura BLoC para la gestión de estado.
- Pruebas unitarias para la lógica de la aplicación.

## Arquitectura

La aplicación sigue la **Arquitectura Limpia** (Clean Architecture) utilizando los siguientes principios:

- **Presentación**: Interfaz de usuario gestionada por widgets y BLoCs.
- **Dominio**: Casos de uso y entidades que representan la lógica de negocio.
- **Datos**: Fuentes de datos remotas y repositorios para manejar la comunicación con la API.

## Instalación y Configuración

Para configurar y ejecutar este proyecto localmente, sigue estos pasos:

### Prerrequisitos

- Flutter SDK: [Instalar Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Incluido con Flutter
- Editor de Código: Se recomienda Visual Studio Code o Android Studio.

### Instalación

1. Clona el repositorio:
    ```bash
    git clone https://github.com/tu-usuario/meal_app.git
    ```
2. Navega al directorio del proyecto:
    ```bash
    cd meal_app
    ```
3. Instala las dependencias de Flutter:
    ```bash
    flutter pub get
    ```

## Cómo Correr la Aplicación

Para ejecutar la aplicación en un emulador o dispositivo físico:

1. Asegúrate de que un emulador esté corriendo o que un dispositivo esté conectado.
2. Corre el siguiente comando en la terminal:

    ```bash
    flutter run
    ```

Esto iniciará la aplicación en modo debug en tu emulador o dispositivo conectado.

