

class Appointment {
  final int id;
  final int clientId;
  final int staffId;
  final int serviceId;
  final DateTime appointmentDate;
  final String status; // "pending", "confirmed", "cancelled"
  final String? comments; // Comentarios adicionales opcionales

  Appointment({
    required this.id,
    required this.clientId,
    required this.staffId,
    required this.serviceId,
    required this.appointmentDate,
    required this.status,
    this.comments,
  });
}
