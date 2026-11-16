import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_bloc.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_event.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_state.dart';
import 'package:refreshi_checkout/domain/orders/usecases/get_order.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/orders/widgets/order_content.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    key: ValueKey(orderId),
    create: (_) => OrderBloc(
      getOrder: GetOrder(getIt<OrderRepository>()),
    )..add(OrderEvent.loadRequested(orderId)),
    child: AssessmentShell(
      activeStep: 2,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) => OrderContent(
            orderId: orderId,
            state: state,
          ),
        ),
      ),
    ),
  );
}
