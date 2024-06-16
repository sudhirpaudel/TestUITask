import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormFieldsController extends GetxController {
  RxList isSelected = RxList.generate(14, (index) => false);

  RxList selectedRange = RxList.generate(4, (index)=> null);

  updateSelected(int index) {
    isSelected[index] = !isSelected[index];
  }

  updateSelectedRange(int index, String newValue) {
    selectedRange[index] = newValue;
  }
}

class PickImageController extends GetxController {
  RxList<String> imagePath = RxList.generate(15, (index) => '');

  Future pickImage(int index, ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: imageSource);

    if (image != null) {
      imagePath[index] = image.path.toString();
    }
  }

  clearImage(int index) {
    imagePath[index] = '';
  }
}
