import 'package:flutter/material.dart';
import 'package:test_app/core/error/failure.dart';

class CustomErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const CustomErrorWidget({super.key, required this.failure, this.onRetry});

  IconData _getIcon() {
    if (failure is NetworkFailure) {
      return Icons.wifi_off;
    } else if (failure is AuthFailure) {
      return Icons.lock_outline;
    } else if (failure is ServerFailure) {
      return Icons.cloud_off;
    } else if (failure is ValidationFailure) {
      return Icons.error_outline;
    } else if (failure is ParsingFailure) {
      return Icons.code_off;
    } else {
      return Icons.error_outline;
    }
  }

  Color _getColor() {
    if (failure is NetworkFailure) {
      return Colors.orange;
    } else if (failure is AuthFailure) {
      return Colors.red;
    } else if (failure is ServerFailure) {
      return Colors.deepOrange;
    } else if (failure is ValidationFailure) {
      return Colors.amber;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final icon = _getIcon();
    final message = failure.getUserMessage();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            if (failure.canRetry() && onRetry != null) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('حاول مرة أخرى'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}