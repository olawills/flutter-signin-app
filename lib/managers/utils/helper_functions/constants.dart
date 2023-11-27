final class ApplicationConstant {
  static final ApplicationConstant instance =
      ApplicationConstant._init(); //Singleton Class

  factory ApplicationConstant() => instance;
  ApplicationConstant._init();

  final String appName = 'LevelUp';
}
