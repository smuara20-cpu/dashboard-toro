import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/session_provider.dart';

class SessionBootstrapGate extends ConsumerStatefulWidget {
  final Widget child;

  const SessionBootstrapGate({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<SessionBootstrapGate> createState() =>
      _SessionBootstrapGateState();
}

class _SessionBootstrapGateState
    extends ConsumerState<SessionBootstrapGate> {
  late final Future<bool> _bootstrapFuture;

  @override
  void initState() {
    super.initState();

    _bootstrapFuture = ref
        .read(sessionBootstrapServiceProvider)
        .bootstrap();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _bootstrapFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return widget.child;
      },
    );
  }
}