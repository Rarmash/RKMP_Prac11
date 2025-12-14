import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/history_cubit.dart';
import '../../../utils/format_utils.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('История заказов'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: state.orders.isEmpty
              ? const Center(child: Text('История пуста'))
              : ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (_, i) {
              final o = state.orders[i];
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text(o.productName),
                subtitle: Text('Кол-во: ${o.quantity} • ${formatDate(o.date)}'),
                onTap: () => context.push('/history/details/${o.id}'),
              );
            },
          ),
        );
      },
    );
  }
}
