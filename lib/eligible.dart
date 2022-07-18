// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_provider_age_checker/eligible_screen_provider.dart';
import 'package:provider/provider.dart';

class EligibilityScreen extends StatelessWidget {
  EligibilityScreen({Key? key}) : super(key: key);
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibleScreenProvider>(
      create: (context) => EligibleScreenProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Marriage Eligibility"),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Consumer<EligibleScreenProvider>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              provider.isEligible ? Colors.green : Colors.red,
                        ),
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(
                          hintText: "Enter your age",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          // ignore: sort_child_properties_last
                          child: const Text("Click Here"),
                          color: Colors.blue,
                          onPressed: () {
                            final int age = int.parse(ageController.text);
                            provider.checkEligibility(age);
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(provider.message),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
