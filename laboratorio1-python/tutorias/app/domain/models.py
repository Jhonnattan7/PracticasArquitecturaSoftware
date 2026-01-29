from dataclasses import dataclass
from datetime import datetime

@dataclass(frozen=True)
class Reserva:
    id: str
    estudiante_id: str
    tutor_id: str
    fecha_hora: datetime
    estado: str # "CREADA", "CANCELADA"
