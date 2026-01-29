# Sistema de Gestión de Tutorías

API REST para gestionar reservas de tutorías entre estudiantes y tutores.

## Arquitectura

El proyecto sigue una arquitectura limpia por capas:

- **Domain**: Modelos de negocio y reglas de dominio (Reserva, errores)
- **Application**: Lógica de aplicación y casos de uso (ReservaService)
- **Infrastructure**: Implementación de repositorios (almacenamiento en memoria)
- **API**: Endpoints HTTP con FastAPI

## Requisitos

- Python 3.8+
- FastAPI
- Uvicorn
- Pytest

## Instalación

```bash
pip install -r requirements.txt
```

## Ejecución

```bash
uvicorn app.api.main:app --reload
```

La API estará disponible en http://localhost:8000

## Endpoints

### Crear Reserva

```
POST /reservas
```

Parámetros:
- `estudiante_id`: ID del estudiante
- `tutor_id`: ID del tutor
- `fecha_hora`: Fecha y hora en formato ISO (ej: "2026-01-30T10:00:00")

Respuesta exitosa:
```json
{
  "id": "uuid",
  "estado": "CREADA"
}
```

## Reglas de Negocio

- No se permiten reservas en fechas pasadas
- Un tutor no puede tener múltiples reservas en el mismo horario

## Tests

```bash
pytest tests/
```
