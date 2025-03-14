import 'package:multi_calculator/constants/utils/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Multi Calculator'
            .toText(fontSize: 22, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: homeProvider.features.length,
                itemBuilder: (context, index) {
                  final feature = homeProvider.features[index];

                  return GestureDetector(
                    onTap: () => homeProvider.navigateToFeature(
                        context, feature['screen'] as Widget),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.white.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(4, 4),
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: (feature['color'] as Color)
                                      .withOpacity(0.6),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(3, 3),
                                ),
                              ],
                            ),
                            child:
                                (feature['icon'] as IconData).toIcon(size: 40),
                          ),
                          const SizedBox(height: 8),
                          (feature['title'] as String).toText(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutUsScreen()),
          );
        },
        backgroundColor: AppColors.white.withOpacity(0.9),
        icon: Icons.info.toIcon(color: AppColors.primary),
        label: "About Us"
            .toText(color: AppColors.primary, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
