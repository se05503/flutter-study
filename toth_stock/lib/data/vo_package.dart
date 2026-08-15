class Package {
  final String name;
  final String description;
  final String? homepage;
  final String repository;
  final String version;
  final String license;

  Package({
    required this.name,
    required this.description,
    this.homepage,
    required this.repository,
    required this.version,
    required this.license,
  });

  // Json → Object로 변환하는 factory 생성자
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json["name"],
      description: json["description"],
      homepage: json["homepage"],
      repository: json["repository"],
      version: json["version"],
      license: json["license"],
    );
  }
}
