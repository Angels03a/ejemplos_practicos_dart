# Ejemplos Prácticos: Factory Method y Adapter

Este repositorio contiene los ejemplos de implementación en **Dart** para la exposición de Patrones de Diseño GoF. 

**Equipo:** Luis Ángel Ortiz López y Emiliano Panes Jiménez.

##  Patrones 

### 1. Factory Method
*   **Ubicación:** Carpeta `/factory_method`
*   **Problema que resuelve:** En un sistema de logística, instancia medios de transporte (camiones, barcos). Este patrón encapsula la creación de objetos en un método, permitiendo que la clase `Logistica` agregue nuevos transportes en el futuro sin modificar su código principal, respetando el principio Abierto/Cerrado.

### 2. Adapter (Adaptador de Objetos)
*   **Ubicación:** Carpeta `/adapter`
*   **Problema que resuelve:** 

---

## ⚙️ Entorno y Herramientas Usadas
*   **Lenguaje:** Dart 
*   **Versión del SDK:** Dart SDK (versión 3.0 o superior recomendada)
*   **Framework/Librerías:** No se utilizaron frameworks externos. Código Dart puro para demostrar la lógica del patrón.
*   **Editor sugerido:** Visual Studio Code.

---

## 🚀 Cómo ejecutar el proyecto

Dado que es un proyecto de Dart puro, **no es necesario instalar dependencias** mediante `pub get` ni configurar librerías externas.

### Comandos de ejecución:
**Para probar Factory Method:**
```bash
dart run factory_method/ejemplo_factory.dart
dart run adapter/ejemplo_adapter.dart