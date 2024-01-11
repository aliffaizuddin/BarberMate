import '../../models/history.dart';

class HistoryService {
  List<Map<String, dynamic>> histories;

  HistoryService({required this.histories});

  void addHistory(Map<String, dynamic> history) {
    histories.add(history);
  }

  void updateHistory(int index, Map<String, dynamic> newData) {
    if (index >= 0 && index < histories.length) {
      histories[index] = newData;
    }
  }

  void deleteHistory(int index) {
    if (index >= 0 && index < histories.length) {
      histories.removeAt(index);
    }
  }

  History getHistoryById(String id) {
    return histories
        .map((historyData) =>
            History.fromMap(historyData)) // Assuming fromMap method in History
        .firstWhere((history) => history.id == id,
            orElse: () => throw Exception('History not found'));
  }

  List<History> getAllHistories() {
    return histories
        .map((historyData) => History.fromMap(historyData))
        .toList();
  }
}
