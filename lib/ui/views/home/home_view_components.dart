part of 'home_view.dart';

Widget buildBookmarkCard(String bookmarkLink, BuildContext context) {
  return ViewModelBuilder<HomeViewModel>.nonReactive(
    builder: (context, viewModel, _) {
      final metadata = viewModel.getMetadata(bookmarkLink);
      final font = FontTheme();
      final trimmedLink = bookmarkLink
          .replaceAll('https://', '')
          .replaceAll('www.', '')
          .replaceAll('http://', '')
          .replaceAll('http://www.', '')
          .split('/')[0];

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
            if (metadata.imageUrl != null)
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.network(
                  metadata.imageUrl!,
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
                      const SizedBox.shrink(),
                ),
              ),
            if (metadata.title != trimmedLink)
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Text(
                  metadata.title.toUpperCase(),
                  style: font.b3(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            if (metadata.title == trimmedLink)
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Text(
                  trimmedLink.split('.').first.toUpperCase(),
                  style: font.b3(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            if (metadata.description.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  metadata.description,
                  style: font.b4(color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                trimmedLink,
                style: font.b4(color: Colors.blue),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    },
    viewModelBuilder: () => locator<HomeViewModel>(),
  );
}
