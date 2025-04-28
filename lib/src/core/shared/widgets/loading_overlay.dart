import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LoadingOverlay {
  static void hide() {
    // _navigator!.pop();
    SmartDialog.dismiss();
  }

  static void show() {
    SmartDialog.showLoading(
        // builder: (_) {
        //   return const SizedBox(
        //     height: 50,
        //     child: CustomProgressIndicator(),
        //   );
        // },
        );
  }

  static void showErrorMessage(String message) {
    SmartDialog.dismiss();
    SmartDialog.showNotify(msg: message, notifyType: NotifyType.error);
  }

  static void showSuccessMessage(String message) {
    SmartDialog.dismiss();
    SmartDialog.showNotify(msg: message, notifyType: NotifyType.success);
  }

  static future(Future future) {
    show();
    future.whenComplete(hide);
  }
}
