-- =========================
-- SCRIPT DE PRUEBA: Tutorias.use (Modelo Completo)
-- =========================

-- 1) Crear tutor
!create t1 : Tutor
!set t1.nombre := 'Dr. Martinez'
!set t1.especialidad := 'Arquitectura de Software'

-- 2) Crear estudiante
!create e1 : Estudiante
!set e1.nombre := 'Maria Lopez'
!set e1.carnet := 'ML2026'

-- 3) Crear curso
!create curso1 : Curso
!set curso1.codigo := 'ARQ301'
!set curso1.nombre := 'Arquitectura de Software'

-- 4) Crear tema
!create tema1 : Tema
!set tema1.nombre := 'UML y OCL'

-- 5) Vincular curso con tema
!insert (curso1, tema1) into CursoTema

-- 6) Crear disponibilidad LIBRE
!create d1 : Disponibilidad
!set d1.fechaHora := '2026-02-15T14:00'
!set d1.estado := #LIBRE
!insert (t1, d1) into TutorDisponibilidad

-- 7) Crear disponibilidad OCUPADA
!create d2 : Disponibilidad
!set d2.fechaHora := '2026-02-15T16:00'
!set d2.estado := #OCUPADA
!insert (t1, d2) into TutorDisponibilidad

-- 8) Crear reserva válida
!create r1 : Reserva
!set r1.fechaHora := '2026-02-15T14:00'
!set r1.estado := #CREADA
!insert (t1, r1) into TutorReserva
!insert (e1, r1) into EstudianteReserva

-- 9) Vincular reserva con curso (opcional)
!insert (r1, curso1) into ReservaCurso

-- 10) Crear ubicación
!create u1 : Ubicacion
!set u1.tipo := 'Virtual'
!set u1.enlace := 'https://zoom.us/j/123456'
!insert (r1, u1) into ReservaUbicacion

-- 11) Crear pago
!create p1 : Pago
!set p1.monto := 25.50
!set p1.estado := #PAGADO
!insert (r1, p1) into ReservaPago

-- 12) Crear notificación
!create n1 : Notificacion
!set n1.canal := 'Email'
!set n1.mensaje := 'Reserva confirmada para 2026-02-15 14:00'
!insert (r1, n1) into ReservaNotificacion

-- =========================
-- 13) INTENTAR CREAR DOBLE RESERVA (debe violar NoDobleReservaMismoHorario)
-- =========================
!create r2 : Reserva
!set r2.fechaHora := '2026-02-15T14:00'
!set r2.estado := #CONFIRMADA
!insert (t1, r2) into TutorReserva
!insert (e1, r2) into EstudianteReserva

-- =========================
-- 14) Crear reserva sin asignar estado (debe violar EstadoValido)
-- =========================
!create r3 : Reserva
!set r3.fechaHora := '2026-02-15T18:00'
!insert (t1, r3) into TutorReserva
!insert (e1, r3) into EstudianteReserva

-- =========================
-- VERIFICAR INVARIANTES
-- =========================
-- En el prompt de USE ejecutar:
-- check
--
-- Para corregir violaciones:
-- !set r2.estado := #CANCELADA
-- !set r3.estado := #CREADA
-- check
