import '../../models/schedule.dart';

class ScheduleService {
  List<Schedule> schedules;

  ScheduleService({required this.schedules});

  void addSchedule(Schedule schedule) {
    schedules.add(schedule);
  }

  void updateSchedule(int index, Schedule newSchedule) {
    if (index >= 0 && index < schedules.length) {
      schedules[index] = newSchedule;
    }
  }

  void deleteSchedule(int index) {
    if (index >= 0 && index < schedules.length) {
      schedules.removeAt(index);
    }
  }

  Schedule getScheduleById(String id) {
    var scheduleData = schedules.firstWhere((schedule) => schedule.id == id,
        orElse: () => throw Exception('Schedule not found'));
    return Schedule.fromMap(
        scheduleData.toMap()); // Assuming Schedule has a toMap method
  }

  List<Schedule> getAllSchedules() {
    return schedules
        .map((scheduleData) => Schedule.fromMap(scheduleData.toMap()))
        .toList(); // Assuming Schedule has a toMap method
  }
}
