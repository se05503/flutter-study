class PackageItem {
  final String name;
  final String description;
  final String repository;
  final String version;
  final String license;

  PackageItem({
    required this.name,
    required this.description,
    required this.repository,
    required this.version,
    required this.license,
  });

  // Json → Object로 변환하는 factory 생성자
  factory PackageItem.fromJson(Map<String, dynamic> json) {
    return PackageItem(
      name: json["name"] ?? "Unknown",
      description: json["description"] ?? "",
      repository: json["repository"] ?? "",
      version: json["version"] ?? "",
      license: json["license"] ?? "",
    );
  }
}
