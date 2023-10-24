import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BMICubit(),
        child: BlocBuilder<BMICubit, BMIStates>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color(0xff0A0C21),
              appBar: AppBar(
                backgroundColor: const Color(0xff0A0C21),
                elevation: 0.0,
                title: const Text(
                  "BMI Calculator App",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 280,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${context.read<BMICubit>().weight.toInt()} ",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "KG ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor:
                                              const Color(0xff4C4F5E),
                                          onPressed: () {
                                            context
                                                .read<BMICubit>()
                                                .removeWeight();
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        const SizedBox(width: 10),
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor:
                                              const Color(0xff4C4F5E),
                                          onPressed: () {
                                            context
                                                .read<BMICubit>()
                                                .addWeight();
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    FloatingActionButton(
                                      mini: true,
                                      backgroundColor: const Color(0xff4C4F5E),
                                      onPressed: () {
                                        context.read<BMICubit>().resetWeight();
                                      },
                                      child: const Icon(Icons.lock_reset),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 280,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${context.read<BMICubit>().height.toInt()} ",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "CM ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor:
                                              const Color(0xff4C4F5E),
                                          onPressed: () {
                                            context
                                                .read<BMICubit>()
                                                .removeHeight();
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        const SizedBox(width: 10),
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor:
                                              const Color(0xff4C4F5E),
                                          onPressed: () {
                                            context
                                                .read<BMICubit>()
                                                .addHeight();
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    FloatingActionButton(
                                      mini: true,
                                      backgroundColor: const Color(0xff4C4F5E),
                                      onPressed: () {
                                        context.read<BMICubit>().resetHeight();
                                      },
                                      child: const Icon(Icons.lock_reset),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BMICubit>().calculate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEB1555),
                      fixedSize: const Size(370, 50),
                      //   shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(30), // <-- Radius
                      // ),
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Result : ${context.read<BMICubit>().bmi.toStringAsFixed(2)} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        context.read<BMICubit>().type,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            );
          },
        ));
  }
}
