const LOADING_APIS = [
  '/wallet/token/verificationcode',
  '/wallet/token/checkverificationcode',
  '/wallet/register',
  '/wallet/login',
  '/wallet/card/bind',
  '/wallet/card/list',
  '/wallet/user/qrcode',
  '/wallet/user/qrcode',
  '/wallet/transfer/order',
  '/wallet/transfer/pay',
  '/wallet/payment/cpm/qr',
  '/wallet/user',
  '/wallet/account/info',
  '/wallet/payment/order',
  '/wallet/payment/pay',
  '/wallet/trans/list',
  '/wallet/trans/detail',
  '/wallet/card/charge',
  '/wallet/card/withdraw',
  '/wallet/payment/mop/scan',
  '/wallet/payment/password',
  '/wallet/rate/query',
];

bool isInLoadingApis(String path) {
  if (path == null) {
    return false;
  }

  return LOADING_APIS.indexWhere((api) => path.indexOf(api) > -1) > -1;
}
