part of 'home_view.dart';

Widget _buildBookmarkCard(Bookmark data, FontTheme font,
    HomeViewModel viewModel, BuildContext context) {
  final title = data.title;
  // final description = data.description;
  final imageUrl = data.imageUrl;
  final link = data.link;

  return Card(
    elevation: 0.1,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    color: context.colorScheme.card,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image section with loading state
        SizedBox(
          width: double.infinity,
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : (imageUrl != null)
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    )
                  : null,
        ),

        Padding(
          padding: EdgeInsets.all(12.w),
          child: Text(
            title,
            style: font.b3(fontWeight: FontWeight.w500),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // if (description.isNotEmpty)
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 12.w),
        //     child: Text(
        //       description,
        //       style: font.caption(color: Colors.grey[700]),
        //       maxLines: 2,
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ),

        // Link section
        if (link.isNotEmpty)
          Padding(
            padding:
                EdgeInsets.only(left: 12.w, right: 12.w, bottom: 4.w, top: 0.w),
            child: Row(
              children: [
                Icon(Icons.link, size: 16, color: Colors.blue[700]),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    link
                        .replaceAll(RegExp(r'^(https?:\/\/)?(www\.)?'), '')
                        .split('/')[0],
                    style: font.b3(color: Colors.blue[700]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

