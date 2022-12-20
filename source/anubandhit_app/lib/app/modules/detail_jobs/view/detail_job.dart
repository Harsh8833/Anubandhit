import 'dart:developer';

import 'package:anubandhit/app/modules/homepage/model/job_model.dart';
import 'package:anubandhit/helper/shared_preferences.dart';
import 'package:anubandhit/utils/dimensions.dart';
import 'package:anubandhit/widgets/big_text.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:anubandhit/widgets/key_value_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class DetailJob extends StatefulWidget {
  static const route = '/detailJob';
  static launch(BuildContext context, JobModel job) =>
      Navigator.of(context, rootNavigator: true)
          .pushNamed(route, arguments: job);
  DetailJob({super.key});

  @override
  State<DetailJob> createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  String eligiblity = "";

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as JobModel;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10, vertical: Dimensions.height10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: Dimensions.iconSize24 * 1.2,
                    )),
                SizedBox(
                  height: Dimensions.height40,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    CircleAvatar(
                        backgroundColor: AppColors.orange,
                        radius: Dimensions.radius20 * 2,
                        child: Icon(
                          Icons.mic,
                          color: AppColors.white,
                          size: Dimensions.iconSize24,
                        ))
                  ]),
                ),
              ],
            ),
            Expanded(
                child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Card(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.height10),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    child: FutureBuilder(
                      future: job.image,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return Image.network(snapshot.data ?? "",
                                fit: BoxFit.fitWidth);
                          }
                        }
                      },
                    )),
              ),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Column(
                    children: [
                      BigText(
                        text: job.name,
                        fontWeight: FontWeight.bold,
                        size: Dimensions.font26,
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BigText(
                            text: 'Vacancy',
                            size: Dimensions.font15 / 1.1,
                            fontWeight: FontWeight.bold,
                          ),
                          BigText(
                            text: job.current_vacancy.toString(),
                            size: Dimensions.font15,
                            color: AppColors.orange,
                          ),
                          BigText(
                            text: '/${job.total_vacancy.toString()}',
                            size: Dimensions.font15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: BigText(
                              text: job.type,
                              fontWeight: FontWeight.bold,
                              size: Dimensions.font26 * 0.8)),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.language_outlined,
                          keyText: ' Location :  ',
                          value: job.location),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.calendar_month_outlined,
                          keyText: ' Duration :  ',
                          value: job.duration),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.paid_outlined,
                          keyText: ' Pay :  ',
                          value: '₹${job.pay}'),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('companies')
                            .where('company_id', isEqualTo: job.company)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return BigText(
                              text: "Loading...",
                              color: AppColors.grey,
                              size: Dimensions.font15,
                            );
                          } else {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              if (snapshot.data!.docs.isNotEmpty) {
                                return KeyValueText(
                                    icon: Icons.lock,
                                    keyText: ' Company :  ',
                                    value: snapshot.data!.docs[0]
                                        ['company_name']);
                              } else {
                                return KeyValueText(
                                    icon: Icons.lock,
                                    keyText: ' Company :  ',
                                    value: 'N/A');
                              }

                              // snapshot.data  :- get your object which is pass from your downloadData() function
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      KeyValueText(
                          icon: Icons.checklist_outlined,
                          keyText: ' Eligibility :  ',
                          value: job.eligibility),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      (job.payment_verified)
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: AppColors.deepGreen,
                                ),
                                BigText(
                                  text: 'Payment Verified',
                                  size: Dimensions.font20 * .7,
                                  color: AppColors.deepGreen,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            on_pressed: () async {
                              await applyJob(context, job);
                            },
                            text: 'Apply Now',
                            width: Dimensions.width40 * 3,
                            height: Dimensions.height40 * 1.5,
                            textSize: Dimensions.font20 * .8,
                            radius: Dimensions.radius20,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }

  Future applyJob(BuildContext context, job) async {
    var db = FirebaseFirestore.instance;
    var job_db = db.collection('jobs').doc(job.id);
    var labour_id = await SPController().getLabourId();
    if (job.enrolled.contains(labour_id)) {
      log("Already applied");
      applyPopup(context, "You have already Registered");
    } else {
      log("Registering");

      job.enrolled.add(labour_id);
      await job_db.update({
        "current_vacancy": job.current_vacancy - 1,
        'enrolled': job.enrolled
      });
      setState(() {
        job.current_vacancy = job.current_vacancy - 1;
      });
      await applyPopup(context, "Applied Successfully");
    }
  }

  Future<dynamic> applyPopup(BuildContext context, text) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(text),
                ],
              ),
            ),
          );
        });
  }
}
