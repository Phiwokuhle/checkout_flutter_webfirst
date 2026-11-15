import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../core/generated/checkout_models.g.dart';
import '../../orders/domain/order_repository.dart';
class CheckoutState {
  const CheckoutState({this.selected=const [],this.schedule,this.submitting=false,this.error});
  final List<String> selected;
  final DateTime? schedule;
  final bool submitting;
  final String? error;
  CheckoutState copy({List<String>? selected,DateTime? schedule,bool? submitting,String? error,bool clearError=false})=>
      CheckoutState(selected:selected??this.selected,schedule:schedule??this.schedule,submitting:submitting??this.submitting,error:clearError?null:error??this.error);
}
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.orders,this.prefs):super(const CheckoutState());
  final OrderRepository orders;
  final SharedPreferences prefs;
  Future<GqlOrder>? _inFlight;
  void toggle(String id) {
    if(state.submitting) return;
    final next=[...state.selected];
    if(next.contains(id)) {next.remove(id);} else if(next.length<2){next.add(id);}
    emit(state.copy(selected:next,clearError:true));
  }
  void schedule(DateTime date) {if(!state.submitting) emit(state.copy(schedule:date,clearError:true));}
  Future<GqlOrder> confirm() {
    if(_inFlight!=null) return _inFlight!;
    if(state.selected.isEmpty || state.schedule==null || !state.schedule!.isAfter(DateTime.now())) {
      emit(state.copy(error:'Select a service and a future schedule.'));
      return Future.error(StateError('Invalid checkout selection.'));
    }
    emit(state.copy(submitting:true,clearError:true));
    _inFlight=_submit();
    return _inFlight!;
  }
  Future<GqlOrder> _submit() async {
    try {
      // Keep the same key after refresh/retry for the same draft.
      final fingerprint='${state.selected.join(',')}|${state.schedule!.toIso8601String()}';
      final savedFingerprint=prefs.getString('draft_fingerprint');
      final key=savedFingerprint==fingerprint ? prefs.getString('draft_key')! : const Uuid().v4();
      await prefs.setString('draft_fingerprint',fingerprint);
      await prefs.setString('draft_key',key);
      final order=await orders.create(CreateOrderInput(idempotencyKey:key,serviceIds:state.selected,scheduledAt:state.schedule!.toIso8601String(),cardToken:'tok_visa_4242'));
      emit(state.copy(submitting:false,clearError:true));
      return order;
    } catch(e) {
      emit(state.copy(submitting:false,error:'Unable to confirm booking. Please retry.'));
      rethrow;
    } finally {_inFlight=null;}
  }
}
