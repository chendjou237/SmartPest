import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _acceptTerms = !_acceptTerms;
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: _acceptTerms,
            onChanged: (value) {
              setState(() {
                _acceptTerms = value!;
              });
            },
          ),
          const Expanded(
            child: Text('I accept the terms & conditions'),
          ),
        ],
      ),
    );
  }
}
