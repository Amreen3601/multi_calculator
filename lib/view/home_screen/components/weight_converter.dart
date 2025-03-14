import 'package:multi_calculator/constants/utils/exports.dart';

class WeightConverter extends StatelessWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: 'Weight Converter'
            .toText(fontSize: 22, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: _backgroundGradient(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Consumer<HomeProvider>(
          builder: (context, controller, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputField(
                  'Kilograms',
                  controller.kgController,
                  Icons.scale,
                  onChanged: (value) => controller.convertKg(value),
                ),
                const SizedBox(height: 24),
                _buildResultField(
                    'Grams', controller.gController, Icons.balance),
                const SizedBox(height: 24),
                _buildResultField(
                    'Milligrams', controller.mgController, Icons.line_weight),
              ],
            );
          },
        ),
      ),
    );
  }

  // ========== Input Field with Styled Container ==========
  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon,
      {Function(String)? onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          icon.toIcon(color: Colors.white70, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  // ========== Read-Only Result Field ==========
  Widget _buildResultField(
      String label, TextEditingController controller, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          icon.toIcon(color: Colors.white70, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // ========== Box Decoration for Input Fields ==========
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 12,
          spreadRadius: 2,
          offset: const Offset(4, 4),
        ),
      ],
      border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
    );
  }

  // ========== Background Gradient ==========
  BoxDecoration _backgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple.shade800, Colors.purple.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
