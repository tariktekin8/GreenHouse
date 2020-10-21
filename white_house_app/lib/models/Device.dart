class Device {
  int deviceID;
  String name;
  String description;
  bool isOnline;
  bool acOnline;
  bool wsOnline;

  Device(
      {this.deviceID,
      this.name,
      this.description,
      isOnline,
      acOnline,
      wsOnline}) {
    this.isOnline = convertIntToBool(isOnline);
    this.acOnline = convertIntToBool(acOnline);
    this.wsOnline = convertIntToBool(wsOnline);
  }

  convertIntToBool(int value) {
    return value == 1 ? true : false;
  }
}
