class FlutterSMB {
  final String host;
  final String user;
  final String password;

  String? _shareName;

  FlutterSMB({
    required this.host,
    required this.user,
    required this.password,
  });

  void connect(String shareName) {
    _shareName = shareName;
  }

  Future<List<String>> listShareNames() {
    throw UnimplementedError();
  }
}
