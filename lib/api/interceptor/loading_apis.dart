const LOADING_APIS = [
  '/api/login',
  '/api/register',
  '/api/users',
];

bool isInLoadingApis(String path) {
  if (path == null) {
    return false;
  }

  return LOADING_APIS.indexWhere((api) => path.indexOf(api) > -1) > -1;
}
