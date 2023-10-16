class SettingsModel {
  String _nickname = "";
  String _email = "";
  bool _receiveNotification = false;
  bool _darkMode = false;

  SettingsModel.vazio() {
    _nickname = "";
    _email = "";
    _receiveNotification = false;
    _darkMode = false;
  }

  SettingsModel(
      this._nickname, this._email, this._receiveNotification, this._darkMode);

  String get nickname => _nickname;
  set nickname(String nickname) {
    _nickname = nickname;
  }

  String get email => _email;
  set email(String email) {
    _email = email;
  }

  bool get receiveNotification => _receiveNotification;
  set receiveNotification(bool receiveNotification) {
    _receiveNotification = receiveNotification;
  }

  bool get darkMode => _darkMode;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
  }
}
