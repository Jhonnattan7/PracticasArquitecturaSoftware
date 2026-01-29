from datetime import datetime
from app.domain.errors import ReglaNegocioError

class ReservaService:
    def __init__(self, reserva_repo):
        self.reserva_repo = reserva_repo
    
    def crear_reserva(self, estudiante_id, tutor_id, fecha_hora: datetime):
        if fecha_hora < datetime.now():
            raise ReglaNegocioError("No se puede reservar en el pasado.")
        
        if self.reserva_repo.existe_reserva(tutor_id=tutor_id, fecha_hora=fecha_hora):
            raise ReglaNegocioError("El tutor ya tiene una reserva en ese horario.")
        
        return self.reserva_repo.crear(estudiante_id, tutor_id, fecha_hora)
