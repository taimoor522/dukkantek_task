import 'package:dukkantek_task_taimoor/src/core/constants/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../domain/repositories/base_remote_client.dart';

class RemoteClient extends BaseRemoteClient {
  @override
  Future<String> getRawEvents(String? query) async {
    String url = 'https://api.seatgeek.com/2/events?client_id=${AppString.apiKey}';
    if (query != null && query.isNotEmpty) {
      url = '$url&q=${query.replaceAll(' ', '+')}';
    }
    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      debugPrint('LOG : response.statusCode : ${response.statusCode}');
      throw Exception('Error getting events');
    }
  }
}
