export 'constants/constants.dart';
export 'utils/utils.dart';
export 'widgets/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
