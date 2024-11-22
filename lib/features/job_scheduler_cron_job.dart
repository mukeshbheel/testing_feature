import 'dart:async';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';

class JobSchedulerCronJob extends StatefulWidget {
  JobSchedulerCronJob({super.key});

  @override
  State<JobSchedulerCronJob> createState() => _JobSchedulerCronJobState();
}

class _JobSchedulerCronJobState extends State<JobSchedulerCronJob> {
  final cron = Cron();

  ScheduledTask? scheduledTask;
  String scheduledText = '';
  StreamController isTaskRunningStreamController = StreamController<bool>();
  late Stream isTaskRunningStream;

  addToStream(bool status) {
    isTaskRunningStreamController.sink.add(status);
  }

  List points = [
    "Cron is a JobScheduler",
    "Cron can schedule a task while the app is in foreground.",
  ];

  @override
  void initState() {
    // TODO: implement initState
    isTaskRunningStream = isTaskRunningStreamController.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Cron JobScheduler",
          style: googleFontStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),

            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: StreamBuilder(
                  stream: isTaskRunningStream,
                  builder: (context, snapShot){
                    final data = snapShot.data;
                    if(data ?? false){
                      return Text(
                        "Task Status : Running",
                        style: googleFontStyle(color: Colors.white),
                      );
                    }
                    return Text(
                      "Task Status : Not Running",
                      style: googleFontStyle(color: Colors.white),
                    );
                  },
                ),),
            if(scheduledText.isNotEmpty)
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Text(
                  scheduledText,
                  style: googleFontStyle(color: Colors.white),
                )),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: scheduleTask,
                  child: const Text("Schedule Task"),
                )),
                Expanded(
                    child: ElevatedButton(
                  onPressed: cancelTask,
                  child: const Text("Cancel Task"),
                )),
              ].addGap(const SizedBox(
                width: 10,
              )),
            ),
            const CommonShowCode(
              codeText: CodeText.jobSchedulerCronCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  void scheduleTask() async {
    try {
      scheduledTask = cron.schedule(Schedule.parse('*/6 * * * * *'), () {
        setState(() {
          scheduledText =
              'hello : the time is ${DateTime.now().toIso8601String()}';
        });
      });
      addToStream(true);
    } on ScheduleParseException {
      // "ScheduleParseException" is thrown if cron parsing is failed.
      debugPrint("something went wrong");
      addToStream(false);
      await cron.close();
    }
  }

  void cancelTask() {
    if (scheduledTask != null) {
      scheduledTask!.cancel();
      addToStream(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cron.close();
    isTaskRunningStreamController.close();
    super.dispose();
  }
}
