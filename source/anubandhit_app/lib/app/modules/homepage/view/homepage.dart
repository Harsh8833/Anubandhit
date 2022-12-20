import 'package:anubandhit/app/modules/homepage/model/job_model.dart';
import 'package:anubandhit/app/modules/homepage/view/job_card.dart';
import 'package:anubandhit/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  static launch(BuildContext context) => Navigator.of(context).pushNamed(route);
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      body: Column(children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.fromLTRB(Dimensions.width20, 0,
                    Dimensions.width20, Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu_outlined,
                          ),
                        ),
                        CircleAvatar(
                          radius: Dimensions.width20,
                          backgroundImage: const NetworkImage(
                              'https://blog.readyplayer.me/content/images/2021/04/IMG_0689.PNG'),
                        ),
                      ],
                    ),
                    BigText(
                      text: 'Job Opening',
                      size: Dimensions.font26 * 1.23,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ))),
        Expanded(
            flex: 5,
            child: FutureBuilder(
              future: db.collection('/jobs').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.orange),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    var data = snapshot.data!.docs;

                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return JobCard(
                            job: JobModel(
                                data[index].id,
                                data[index]["current_vacancy"] ?? "N/A",
                                data[index]['duration'] ?? "N/A",
                                data[index]['eligibility'] ?? "N/A",
                                storage
                                    .child('/jobs/unsplash_cfDURuQKABk.png')
                                    .getDownloadURL(),
                                data[index]['location'] ?? "N/A",
                                data[index]['job_name'] ?? "N/A",
                                data[index]['paymentPerHead'] ?? "N/A",
                                // data[index]['payment_verified'] ?? "N/A",
                                true,
                                data[index]['start_date'] ?? "N/A",
                                data[index]['total_vacancy'] ?? 'N/A',
                                data[index]['type'] ?? "N/A",
                                data[index]['company_id'] ?? "N/A",
                                data[index]['enrolled']),
                          );
                        });
                  } // snapshot.data  :- get your object which is pass from your downloadData() function
                }
              },
            )),
      ]),
    ));
  }
}
