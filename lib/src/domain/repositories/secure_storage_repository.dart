abstract class SecureStorageRepository {
  const SecureStorageRepository();

  Future<String?> get jwtToken;
  Future<void> saveToken(final String? token);
}
