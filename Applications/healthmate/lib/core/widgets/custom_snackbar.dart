 import 'package:flutter/material.dart';
import 'package:healthmate/features/Auth/manager/cubit/register_cubit.dart';

void CustomSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }