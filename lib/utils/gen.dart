import 'package:short_uuids/short_uuids.dart';

/// Return new short-uuid
String genNewId() {
  const shortUuid = ShortUuid();
  return shortUuid.generate();
}
