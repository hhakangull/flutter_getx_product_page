import 'package:getx_example/features3/exceptions/app_exceptions.dart';
import 'package:getx_example/features3/helper/dialog_helper.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(description: error.message!);
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(description: error.message!);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to respond');
    }
  }
}
