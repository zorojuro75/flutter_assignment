import 'package:flutter/material.dart';
import 'package:task_list_application/SimpleInputField.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  static const Color containerColor = Color(0xffF5F8F8);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tip Calculator',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black54,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text(
                        "Total Bill",
                        style: TextStyle(color: textLightBlack),
                      ),
                      Text(
                        '\$ ${totalBillController.text}',
                        style: const TextStyle(
                            color: textBlack,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Persons",
                            style: TextStyle(color: textLightBlack),
                          ),
                          Text(
                            "Tip Amount",
                            style: TextStyle(color: textLightBlack),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '05',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textBlack),
                          ),
                          Text(
                            '\$ 20.00',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textBlack),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount Per Person",
                      style: TextStyle(color: textLightBlack),
                    ),
                    Text(
                      "\$ 0.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: textBlack),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SimpleInputField(
                  controller: totalBillController,
                  iconData: Icons.attach_money,
                  title: 'Total Bill',
                  hintText: 'Please enter total bill'),
              SimpleInputField(
                  controller: totalTipController,
                  iconData: Icons.percent,
                  title: 'Tip percentage',
                  hintText: 'Please enter tip percentage'),
              SimpleInputField(
                  controller: totalPeopleController,
                  title: 'Number of people',
                  hintText: 'Please enter number of people'),
              Row(
                children: [
                  // calculate button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        formKey.currentState!.validate();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 45),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Calculate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10,),
                  // Clear Button
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 45),
                        decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Clear',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
