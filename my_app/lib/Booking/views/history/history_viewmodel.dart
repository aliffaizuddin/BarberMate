import 'package:flutter/material.dart';
import '../../services/history/history_service.dart';

class HistoryViewModel extends ChangeNotifier {
  final HistoryService historyService;

  HistoryViewModel({required this.historyService});

  List<Map<String, dynamic>> get histories => historyService.histories;

  // Example method to add a history
  void addHistory(Map<String, dynamic> history) {
    historyService.addHistory(history);
    notifyListeners();
  }

  // Example method to update a history
  void updateHistory(int index, Map<String, dynamic> newData) {
    historyService.updateHistory(index, newData);
    notifyListeners();
  }

  // Example method to delete a history
  void deleteHistory(int index) {
    historyService.deleteHistory(index);
    notifyListeners();
  }
}
