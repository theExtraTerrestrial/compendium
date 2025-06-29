import 'package:flutter/foundation.dart';

/// ViewModel that provides basic loading and error state and notifies listeners
abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  // Public getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  @protected
  void setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  @protected
  void setError(String error) {
    _errorMessage = error;
    _isLoading = false;
    notifyListeners();
  }

  @protected
  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }
}
