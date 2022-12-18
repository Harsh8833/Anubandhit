import 'package:anubandhit/app/modules/homepage/model/job_model.dart';
import 'package:anubandhit/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../detail_jobs/view/detail_job.dart';

class JobCard extends StatelessWidget {
  JobModel job;
  JobCard({super.key, required this.job});

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
                      child: Image.network(job.image, fit: BoxFit.fill))),
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
                                text: job.name,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  BigText(
                                      text: 'Vacancy ',
                                      fontWeight: FontWeight.bold,
                                      size: Dimensions.font15),
                                  BigText(
                                    text: job.current_vacancy.toString(),
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
                                        text: job.location,
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
                                        text: job.duration,
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
                                      BigText(
                                        text: job.company_name,
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
                                        text: job.pay,
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
                                      DetailJob.launch(context);
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
                                on_pressed: () {},
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
}
