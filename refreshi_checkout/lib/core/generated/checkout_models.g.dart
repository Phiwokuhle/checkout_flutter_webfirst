// GENERATED CODE — run: python3 tool/generate_graphql.py
// Source of truth: graphql/schema.graphql and graphql/operations.graphql
class GqlService {
  const GqlService({required this.id, required this.name, required this.priceCents, required this.durationMinutes});
  final String id, name;
  final int priceCents, durationMinutes;
  factory GqlService.fromJson(Map<String, dynamic> j) => GqlService(id:j['id'] as String,name:j['name'] as String,priceCents:j['priceCents'] as int,durationMinutes:j['durationMinutes'] as int);
}
class GqlOrder {
  const GqlOrder({required this.id, required this.idempotencyKey,required this.services,required this.scheduledAt,required this.totalCents,required this.cardLast4,required this.status});
  final String id, idempotencyKey, scheduledAt, cardLast4, status;
  final int totalCents;
  final List<GqlService> services;
  factory GqlOrder.fromJson(Map<String,dynamic> j) => GqlOrder(id:j['id'] as String,idempotencyKey:j['idempotencyKey'] as String,services:(j['services'] as List).map((e)=>GqlService.fromJson(Map<String,dynamic>.from(e as Map))).toList(),scheduledAt:j['scheduledAt'] as String,totalCents:j['totalCents'] as int,cardLast4:j['cardLast4'] as String,status:j['status'] as String);
}
class CreateOrderInput {
  const CreateOrderInput({required this.idempotencyKey,required this.serviceIds,required this.scheduledAt,required this.cardToken});
  final String idempotencyKey, scheduledAt, cardToken;
  final List<String> serviceIds;
  Map<String,dynamic> toJson()=>{'idempotencyKey':idempotencyKey,'serviceIds':serviceIds,'scheduledAt':scheduledAt,'cardToken':cardToken};
}
