from fastapi import FastAPI, HTTPException
from datetime import datetime
from app.application.services import ReservaService
from app.infrastructure.repositories import ReservaRepoMemoria
from app.domain.errors import ReglaNegocioError

app = FastAPI(title="Tutorias API")

repo = ReservaRepoMemoria()
service = ReservaService(repo)

@app.post("/reservas")
def crear_reserva(estudiante_id: str, tutor_id: str, fecha_hora: str):
    try:
        dt = datetime.fromisoformat(fecha_hora)
        r = service.crear_reserva(estudiante_id, tutor_id, dt)
        return {"id": r.id, "estado": r.estado}
    except ReglaNegocioError as e:
        raise HTTPException(status_code=400, detail=str(e))
