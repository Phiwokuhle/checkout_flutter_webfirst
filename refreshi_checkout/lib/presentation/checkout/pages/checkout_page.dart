import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/data/checkout/graphql_service_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/load_checkout_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/place_checkout_order.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/checkout/widgets/catalog_status.dart';
import 'package:refreshi_checkout/presentation/checkout/widgets/service_selection.dart';
import 'package:refreshi_checkout/presentation/checkout/widgets/schedule_picker.dart';
import 'package:refreshi_checkout/presentation/checkout/widgets/saved_payment_method.dart';
import 'package:refreshi_checkout/presentation/checkout/widgets/checkout_summary.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CheckoutBloc(
      loadCatalog: LoadCheckoutCatalog(getIt<GraphqlServiceCatalog>()),
      placeOrder: PlaceCheckoutOrder(getIt<OrderRepository>()),
    )..add(const CheckoutEvent.started()),
    child: const _CheckoutView(),
  );
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView();

  @override
  Widget build(BuildContext context) => BlocListener<CheckoutBloc, CheckoutState>(
    listenWhen: (previous, current) =>
        previous.status != CheckoutStatus.success &&
        current.status == CheckoutStatus.success,
    listener: (context, state) {
      if (state.orderId != null) context.go(RoutePaths.order(state.orderId!));
    },
    child: AssessmentShell(
      activeStep: 1,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 780),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            final showingCatalog = state.status != CheckoutStatus.initial &&
                state.status != CheckoutStatus.loading &&
                state.status != CheckoutStatus.failure &&
                state.services.isNotEmpty;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Catalog & Checkout',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                const Text('Choose one or two services and a convenient time.'),
                const SizedBox(height: 24),
                if (!showingCatalog)
                  CatalogStatus(state: state)
                else ...[
                  ServiceSelection(state: state),
                  const SizedBox(height: 20),
                  SchedulePicker(state: state),
                  const SizedBox(height: 24),
                  const SavedPaymentMethod(),
                  const SizedBox(height: 16),
                  CheckoutSummary(state: state),
                ],
              ],
            );
          },
        ),
      ),
    ),
  );
}
