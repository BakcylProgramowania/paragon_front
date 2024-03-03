import 'package:flutter/material.dart';
import '../default/colors.dart';
import '../default/default_widgets.dart'; 

double bilans = 40.25;

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // History data
  final List<Map<String, dynamic>> historyData = [
    {'icon': Icons.dining, 'name': 'Wspólne jedzenie', 'amount': '51.60 PLN'},
    {'icon': Icons.movie, 'name': 'Kino', 'amount': '120.00 PLN'},
    {'icon': Icons.dining, 'name': 'Wspólna kolacja', 'amount': '100.00 PLN'},
    {'icon': Icons.pets_outlined, 'name': 'Zoo', 'amount': '64.30 PLN'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Menu'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSectionTitle('O nas'),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: const Text(
                'Witamy w naszej aplikacji!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.greyAccent,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.receipt_long_outlined,
                    color: AppColors.defaultTextColor,
                    size: 30.0,
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: const Text(
                    'Policz paragon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.defaultTextColor,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            _buildSectionTitle('Bilans'),

            Padding(
          padding: const EdgeInsets.only(left: 80, bottom: 0),
          child: CustomPaint(
            size: Size(
                280, (280 * 0.625).toDouble()), 
            painter: RPSCustomPainter(),
          ),
        ),

            const SizedBox(height: 40),

            _buildSectionTitle('Historia'),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  return _buildHistoryItem(
                      historyData[index]['icon'],
                      historyData[index]['name'],
                      historyData[index]['amount']
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.greyAccent,
                  height: 30,
                  thickness: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          shadows: [
            Shadow(
              color: AppColors.defaultTextColor,
              offset: Offset(0, -5),
            ),
          ],
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryColor,
          decorationThickness: 3,
        ),
      ),
    );
  }

  Widget _buildHistoryItem(IconData icon, String name, String amount) {
  return Container(
    margin: const EdgeInsets.only(left: 0, right: 0),
    width: 300,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 0,
              height: 20,
              child: Icon(
                icon,
                color: AppColors.defaultTextColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.defaultTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
}

// Custom painter
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Layer 1
  Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(89, 248, 95, 106)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0605000,size.height*0.2241714);
    path_0.cubicTo(size.width*0.1546786,size.height*0.1865714,size.width*0.1792857,size.height*0.0498286,size.width*0.2791071,size.height*0.0636000);
    path_0.cubicTo(size.width*0.3653214,size.height*0.0576000,size.width*0.4341786,size.height*0.1637143,size.width*0.5598571,size.height*0.2128571);
    path_0.cubicTo(size.width*0.6088571,size.height*0.2345143,size.width*0.7381071,size.height*0.2307429,size.width*0.8281429,size.height*0.2810286);
    path_0.cubicTo(size.width*0.8962143,size.height*0.3352571,size.width*0.9222500,size.height*0.3306857,size.width*0.9295000,size.height*0.3874857);
    path_0.cubicTo(size.width*0.9291786,size.height*0.4448571,size.width*0.9630357,size.height*0.5069143,size.width*0.9183929,size.height*0.6168571);
    path_0.cubicTo(size.width*0.9012500,size.height*0.7085143,size.width*0.8998571,size.height*0.7026857,size.width*0.8679643,size.height*0.7602286);
    path_0.cubicTo(size.width*0.8180000,size.height*0.8129143,size.width*0.8405357,size.height*0.9283429,size.width*0.7224286,size.height*0.9265143);
    path_0.cubicTo(size.width*0.5850714,size.height*0.9168571,size.width*0.5231071,size.height*0.7522286,size.width*0.4358571,size.height*0.7511429);
    path_0.cubicTo(size.width*0.2115000,size.height*0.7173714,size.width*0.1015714,size.height*0.7332571,size.width*0.0624286,size.height*0.5713714);
    path_0.cubicTo(size.width*0.0319643,size.height*0.4621143,size.width*-0.0238571,size.height*0.3045143,size.width*0.0605000,size.height*0.2241714);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  

  // Layer 1
  Paint paintStroke0 = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
    canvas.drawPath(path_0, paintStroke0);
  

  
    // Text Layer 1
    canvas.save();
    final pivot_1287700439845 = Offset(size.width*0.09,size.height*0.26); 
    canvas.translate(pivot_1287700439845.dx,pivot_1287700439845.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_1287700439845.dx,-pivot_1287700439845.dy);
    TextPainter tp_1287700439845 = TextPainter(
      text:  TextSpan(text: """Do oddania""", style: TextStyle(
        fontSize: size.width*0.08,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: size.width*0.49, minWidth: size.width*0.49);
    tp_1287700439845.paint(canvas,pivot_1287700439845);
    canvas.restore();
  

  
    // Text Layer 1
    canvas.save();
    final pivot_7400399423681 = Offset(size.width*0.21,size.height*0.42); 
    canvas.translate(pivot_7400399423681.dx,pivot_7400399423681.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_7400399423681.dx,-pivot_7400399423681.dy);
    TextPainter tp_7400399423681 = TextPainter(
      text:  TextSpan(text: """$bilans PLN""", style: TextStyle(
        fontSize: size.width*0.14,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: size.width*0.67, minWidth: size.width*0.67);
    tp_7400399423681.paint(canvas,pivot_7400399423681);
    canvas.restore();


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
