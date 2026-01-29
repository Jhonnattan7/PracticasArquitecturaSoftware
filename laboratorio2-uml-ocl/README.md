# Laboratorio 2 - UML y OCL

Este proyecto es parte del curso de Arquitectura de Software y trata sobre modelado con UML y especificacion de restricciones usando OCL.

## Descripcion General

El laboratorio consiste en modelar un sistema de gestion de tutorias academicas usando diferentes tecnicas de modelado y validacion. Se incluyen diagramas UML, especificaciones en OCL y una implementacion de ejemplo en Python.

## Estructura del Proyecto

El proyecto esta organizado en las siguientes carpetas:

**diagramas**

Contiene los diagramas UML del sistema en formato DrawIO:

- DiagramaDominio.drawio - Modelo del dominio del sistema de tutorias
- DiagramaSecuencia.drawio - Diagramas de secuencia para los casos de uso principales
- UseCaseDiagram.drawio - Diagrama de casos de uso del sistema

**ocl**

Incluye modelos y restricciones escritos en USE (UML-based Specification Environment):

- Reservas.use - Modelo de clases para el sistema de reservas de tutorias
- Tutorias.use - Especificacion completa del sistema de tutorias
- University.use - Modelo de ejemplo del dominio universitario
- Cars.use - Modelo de ejemplo para gestion de vehiculos
- Archivos .cmd - Scripts de comandos para ejecutar validaciones en USE

**python**

Implementacion de referencia del sistema de tutorias en Python:

- domain.py - Clases del dominio (Tutor, Estudiante, Reserva, Disponibilidad)
- repositories.py - Repositorios para persistencia en memoria
- services.py - Logica de negocio y validaciones del dominio
- tests/test_reservas.py - Pruebas unitarias para el sistema de reservas

**use**

Archivos adicionales para USE:

- constraints.ocl - Restricciones OCL para validacion del modelo
- demo.cmd - Script de demostracion

## Como Usar

### Diagramas UML

Abrir los archivos .drawio con Draw.io o la extension de Visual Studio Code para ver y editar los diagramas.

### Modelos OCL

Para trabajar con los modelos USE necesitas tener instalado USE (UML-based Specification Environment).

1. Abrir USE
2. Cargar uno de los archivos .use desde la carpeta ocl
3. Opcionalmente ejecutar los archivos .cmd para validar restricciones

### Codigo Python

Para ejecutar las pruebas:

```
python -m pytest python/tests/test_reservas.py
```

O usando unittest:

```
python -m unittest python/tests/test_reservas.py
```

## Conceptos Clave

El sistema de tutorias modela los siguientes conceptos:

- Tutores con especialidades especificas
- Estudiantes que solicitan tutorias
- Disponibilidades de horarios de tutores
- Reservas con diferentes estados (creada, confirmada, cancelada, expirada)
- Validaciones de dominio para garantizar consistencia

## Autor

Jhonnatan Peñate

Curso: Arquitectura de Software

Universidad: Tercer año
