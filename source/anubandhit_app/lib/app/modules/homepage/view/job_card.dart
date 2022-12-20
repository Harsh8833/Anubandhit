import 'dart:developer';

import 'package:anubandhit/app/modules/homepage/model/job_model.dart';
import 'package:anubandhit/helper/loading.dart';
import 'package:anubandhit/helper/shared_preferences.dart';
import 'package:anubandhit/helper/shimmer.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../detail_jobs/view/detail_job.dart';

class JobCard extends StatefulWidget {
  JobModel job;
  JobCard({super.key, required this.job});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Dimensions.height40 * 12,
      child: Card(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius20)),
          elevation: 7,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                  child: SizedBox(
                      width: double.maxFinite,
                      height: Dimensions.height40 * 5.25,
                      child: FutureBuilder(
                        future: widget.job.image,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CustomWidget.rectangular(
                                    height: Dimensions.height40 * 5.25));
                          } else {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return Image.network(snapshot.data ?? "",
                                  fit: BoxFit.fitWidth);
                            }
                          }
                        },
                      ))),
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius20),
                      bottomRight: Radius.circular(Dimensions.radius20)),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width20,
                          vertical: Dimensions.height10),
                      height: Dimensions.height10 * 25,
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: widget.job.name,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  BigText(
                                      text: 'Vacancy ',
                                      fontWeight: FontWeight.bold,
                                      size: Dimensions.font15),
                                  BigText(
                                    text: widget.job.current_vacancy.toString(),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orange,
                                  ),
                                ],
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.language_outlined,
                                    color: AppColors.orange,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: '  Location',
                                          color: AppColors.orange,
                                          size: Dimensions.font15,
                                          fontWeight: FontWeight.bold),
                                      BigText(
                                        text: widget.job.location,
                                        color: AppColors.grey,
                                        size: Dimensions.font15,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: AppColors.orange,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: '  Duration',
                                          color: AppColors.orange,
                                          size: Dimensions.font15,
                                          fontWeight: FontWeight.bold),
                                      BigText(
                                        text: widget.job.duration,
                                        color: AppColors.grey,
                                        size: Dimensions.font15,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    color: AppColors.orange,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: 'Company',
                                          color: AppColors.orange,
                                          size: Dimensions.font15,
                                          fontWeight: FontWeight.bold),
                                      FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection('companies')
                                            .where('company_id',
                                                isEqualTo: widget.job.company)
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
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              if (snapshot
                                                  .data!.docs.isNotEmpty) {
                                                return BigText(
                                                  text:
                                                      '${snapshot.data?.docs[0]['company_name']}',
                                                  color: AppColors.grey,
                                                  size: Dimensions.font15,
                                                );
                                              } else {
                                                return BigText(
                                                  text: 'N/A',
                                                  color: AppColors.grey,
                                                  size: Dimensions.font15,
                                                );
                                              }

                                              // snapshot.data  :- get your object which is pass from your downloadData() function
                                            }
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.money,
                                    color: AppColors.orange,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: '  Pay',
                                          color: AppColors.orange,
                                          size: Dimensions.font15,
                                          fontWeight: FontWeight.bold),
                                      BigText(
                                        text: widget.job.pay,
                                        color: AppColors.grey,
                                        size: Dimensions.font15,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(children: [
                            Expanded(
                                child: Button(
                                    on_pressed: () {
                                      DetailJob.launch(context, widget.job);
                                    },
                                    text: 'Detail',
                                    boxBorder:
                                        Border.all(color: AppColors.orange),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: Dimensions.height10),
                                    textColor: AppColors.orange,
                                    textSize: Dimensions.font15,
                                    color: AppColors.white)),
                            Expanded(
                              child: Button(
                                on_pressed: () async {
                                  applyJob(context);
                                },
                                text: 'Apply Now',
                                boxBorder: null,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.height10),
                                textColor: AppColors.white,
                                color: AppColors.orange,
                                textSize: Dimensions.font15,
                              ),
                            )
                          ]))
                        ],
                      )))
            ],
          )),
    );
  }

  Future applyJob(BuildContext context) async {
    var db = FirebaseFirestore.instance;
    var job_db = db.collection('jobs').doc(widget.job.id);
    var labour_id = await SPController().getLabourId();
    if (widget.job.enrolled.contains(labour_id)) {
      log("Already applied");
      applyPopup(context, "You have already Registered");
    } else {
      log("Registering");

      widget.job.enrolled.add(labour_id);
      await job_db.update({
        "current_vacancy": widget.job.current_vacancy - 1,
        'enrolled': widget.job.enrolled
      });
      setState(() {
        widget.job.current_vacancy = widget.job.current_vacancy - 1;
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
