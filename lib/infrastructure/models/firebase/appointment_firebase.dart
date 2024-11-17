import 'package:intl/intl.dart';
import 'package:spa_app/infrastructure/models/firebase/service_firebase.dart';
import '../../../domain/entities/entities.dart';

class AppointmentFromFirebase {
  final String id;
  final Client client;
  final double totalCost;
  final String status;
  final DateTime date;
  final DateTime paymentDate;
  final String time;
  final String paymentMethod;
  final List<Service> services;

  AppointmentFromFirebase({
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

  factory AppointmentFromFirebase.fromJson(String id, Map<String, dynamic> json) {

    final dateFormatter = DateFormat("dd/MM/yyyy");


    return AppointmentFromFirebase(
      id: json['Document ID']?? '',
      client: Client.fromJson(json['cliente']),
      totalCost: (json['costoTotal'] ?? 0).toDouble(),
      status: json['estado'] ?? 'Pending',
      date: dateFormatter.parse(json['fecha']),
      paymentDate: dateFormatter.parse(json['fechaPago']),
      time: json['horario'] ?? '',
      paymentMethod: json['metodoPago'] ?? '',
      services: json['services'] != null
          ? List<Service>.from(json['services'].map((x) => Servicetoenti.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'cliente': client.toJson(),
    'costoTotal': totalCost,
    'estado': status,
    'fecha': date.toIso8601String(),
    'fechaPago': paymentDate.toIso8601String(),
    'horario': time,
    'metodoPago': paymentMethod,
    'services': List<dynamic>.from(services.map((x) => x.toJson())),
  };
}
