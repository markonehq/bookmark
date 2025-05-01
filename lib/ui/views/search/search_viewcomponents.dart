import 'package:bookmark/ui/views/search/search_view.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookmarkSummeryTabview extends ViewModelWidget<SearchViewmodel> {
  const BookmarkSummeryTabview({
    super.key,
  });

  @override
  Widget build(BuildContext context, SearchViewmodel viewModel) {
    final TabController tabController = TabController(
        length: viewModel.myTabs.length, vsync: Scaffold.of(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          controller: tabController,
          isScrollable: true,
          dividerHeight: 0.5,
          padding: EdgeInsets.only(left: 16.w),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 0.w),
          indicatorColor: const Color.fromARGB(255, 0, 0, 0),
          labelColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedLabelColor: const Color.fromARGB(179, 33, 33, 33),
          labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          tabs: viewModel.myTabs,
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        Center(
          child: SizedBox(
            child: Text("Summery"),
          ),
        ),
        Center(
          child: SizedBox(
            child: Text("Sources"),
          ),
        )
      ]),
    ).animate().fadeIn(duration: 400.ms).slide(begin: const Offset(0, 0.2));
  }
}
