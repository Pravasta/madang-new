import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/core.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Search',
                style: AppText.text20.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DefaultField(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search food, table, or something',
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: const Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
