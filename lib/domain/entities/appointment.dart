import 'entities.dart';

class Appointment {
  final String id;
  final Client client;
  final double totalCost;
  final String status;
  final DateTime date;
  final DateTime paymentDate;
  final String time;
  final String paymentMethod;
  final List<Service> services;

  Appointment({
    required this.id,
    required this.client,
    required this.totalCost,
    required this.status,
    required this.date,
    required this.paymentDate,
    required this.time,
    required this.paymentMethod,
    required this.services,
  });
}
