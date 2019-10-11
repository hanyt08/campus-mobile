import 'dart:async';
import 'package:campus_mobile/core/models/availability_model.dart';
import 'package:campus_mobile/core/services/networking.dart';

class AvailabilityService {
  bool _isLoading = false;
  DateTime _lastUpdated;
  String _error;
  final NetworkHelper _networkHelper = NetworkHelper();
  final Map<String, String> headers = {
    "accept": ":application/json",
    "Authorization": "Bearer " + "\$MOBILE_PUBLIC_BEARER_TOKEN",
  };
  final String endpoint =
      "https://api-qa.ucsd.edu:8243/occuspace/v1.0/busyness";

  Future<List<AvailabilityModel>> fetchData() async {
    _error = null;
    _isLoading = true;
    try {
      /// fetch data
      String _response =
          await _networkHelper.authorizedFetch(endpoint, headers);

      /// parse data
      final data = availabilityModelFromJson(_response);
      _isLoading = false;
      return data;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      return List<AvailabilityModel>();
    }
  }

  bool get isLoading => _isLoading;

  String get error => _error;

  DateTime get lastUpdated => _lastUpdated;

  NetworkHelper get availabilityService => _networkHelper;
}
