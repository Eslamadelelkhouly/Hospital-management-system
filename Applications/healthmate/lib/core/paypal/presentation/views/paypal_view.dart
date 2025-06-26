import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  void _showSuccessDialog(BuildContext context, String text, bool isError) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Image.asset(isError ? failureimage : sucessimage, scale: 1.5),
              const SizedBox(height: 16),
              Text(
                text,
                style: ResponsiveStylingSystem.textStyle17semibold(context),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        GoRouterState.of(context).extra as Map<String, dynamic>;

    return PaypalCheckoutView(
      sandboxMode: true,
      clientId:
          "Acz7d7qaVWOLkZgvPz4fxm7JSpQSrlSYxQVeuALASdA0IUNGCPO0OkNgzziAMKNnWX4NtMaanJtgUAch",
      secretKey:
          "EJ3gNS_auwZxXUD6_a_JlPrNl3qJwsMpFojYMuKo6ZnBGvw59sgvj10ty4KtJzeSD391Uqol4peZ7-FK",
      transactions: [
        {
          "amount": {
            "total": '${data['salary']}',
            "currency": "USD",
            "details": {
              "subtotal": '${data['salary']}',
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          "item_list": {
            "items": [
              {
                "name": "${data['doctor_name']}",
                "price": '${data['salary']}',
                "currency": "USD",
                "quantity": 1,
              },
            ],
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        _showSuccessDialog(context, "Payment Success", false);
      },
      onError: (error) {
        log("onError: $error");
        _showSuccessDialog(context, "Payment Failed", true);
      },
      onCancel: () {
        print('cancelled:');
      },
    );
  }
}
