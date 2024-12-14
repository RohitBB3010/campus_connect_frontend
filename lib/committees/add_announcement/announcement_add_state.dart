import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';

part 'announcement_add_state.g.dart';

@CopyWith()
class AnnouncementAddState {
  String? title;
  String? content;
  List<PlatformFile>? imageUrl;
  String? tag;
  String visibility;
  int isSelected;

  AnnouncementAddState(
      {this.title,
      this.content,
      this.imageUrl,
      this.tag,
      this.visibility = "All",
      this.isSelected = 0});
}
