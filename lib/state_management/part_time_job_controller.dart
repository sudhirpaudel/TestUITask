import 'package:get/get.dart';
import 'package:testapp/config/dummyData/for_screen_one.dart';
import 'package:testapp/models/part_time_job_model.dart';

class PartTimeJobController extends GetxController {
  RxList<PartTimeJobModel> partTimeJobs = partTimeJobModelFromJson(dummyDataForPartTimeJob).obs;
  RxList jobFavourite = RxList( [for (var job in partTimeJobModelFromJson(dummyDataForPartTimeJob)) job.favourite]);
  updateJob(int index) {
    partTimeJobs[index].favourite = true;
  }


  updateJobFavourite(int index) {
    jobFavourite[index] = !jobFavourite[index];
    updateJob(index);
  }

}
