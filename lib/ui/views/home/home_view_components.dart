part of 'home_view.dart';

Widget buildBookmarkCard({
  required Bookmark data,
  required FontTheme font,
  required BuildContext context,
}){
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
        SizedBox(
          width: double.infinity,
          height: 150,
          child: Image.network(
            imageUrl ?? data.ogImage ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child.animate().fadeIn(duration: 400.ms);
              } else {
                return buildShimmer(
                  height: 150,
                  borderRadius: BorderRadius.circular(12),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          ),
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
