import 'package:appwrite/appwrite.dart';
import 'package:passengers/constants/keys.dart';

Client getClient() {
  Client client = Client();
  return client
          .setEndpoint(endpoint) // Your Appwrite Endpoint
          .setProject(projectId) // Your project ID
          .setSelfSigned(
            status: true,
          ) // Use only on dev mode with a self-signed SSL cert
      ;
}

Database database() {
  Database database = Database(getClient());
  return database;
}

Storage storage() {
  Storage storage = Storage(getClient());
  return storage;
}
