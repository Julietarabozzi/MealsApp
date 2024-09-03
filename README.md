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
