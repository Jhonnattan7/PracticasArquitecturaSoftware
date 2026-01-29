import uuid
from app.domain.models import Reserva

class ReservaRepoMemoria:
    def __init__(self):
        self._items = []
    
    def existe_reserva(self, tutor_id, fecha_hora):
        return any(
            r.tutor_id == tutor_id and r.fecha_hora == fecha_hora and r.estado != "CANCELADA"
            for r in self._items
        )
    
    def crear(self, estudiante_id, tutor_id, fecha_hora):
        r = Reserva(
            id=str(uuid.uuid4()),
            estudiante_id=estudiante_id,
            tutor_id=tutor_id,
            fecha_hora=fecha_hora,
            estado="CREADA",
        )
        self._items.append(r)
        return r
