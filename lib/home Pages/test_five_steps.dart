import 'package:flutter/material.dart';


void main(){
  runApp(OrderStepsPage());
}
class OrderStepsPage extends StatelessWidget {
  const OrderStepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF2C003E), // dark purple
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 100,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header text
                Text(
                  '5 STEPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: isMobile ? 40 : 60,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: isMobile ? 10 : 20),
                Text(
                  'TO ORDER A PRODUCT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: isMobile ? 40 : 60),
      
                // Steps
                Column(
                  children: [
                    StepCard(
                      icon: Icons.search,
                      stepNumber: '1. Find the product',
                      description:
                          'Browse through categories or use the search bar to find your desired item quickly.',
                      isMobile: isMobile,
                    ),
                    StepCard(
                      icon: Icons.add_shopping_cart,
                      stepNumber: '2. Add to cart',
                      description:
                          'Click “Add to Cart” to include your product in the shopping cart for checkout.',
                      isMobile: isMobile,
                    ),
                    StepCard(
                      icon: Icons.payment,
                      stepNumber: '3. Checkout',
                      description:
                          'Review your cart, add your delivery address, and proceed to make the payment.',
                      isMobile: isMobile,
                    ),
                    StepCard(
                      icon: Icons.verified,
                      stepNumber: '4. Review and confirm',
                      description:
                          'Double-check your order details and confirm before finalizing your purchase.',
                      isMobile: isMobile,
                    ),
                    StepCard(
                      icon: Icons.local_shipping,
                      stepNumber: '5. Receive confirmation',
                      description:
                          'You’ll receive a confirmation message and can track your shipment easily.',
                      isMobile: isMobile,
                    ),
                  ],
                ),
      
                SizedBox(height: isMobile ? 40 : 80),
                const Text(
                  '@REALLYGREATSITE',
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  final IconData icon;
  final String stepNumber;
  final String description;
  final bool isMobile;

  const StepCard({
    super.key,
    required this.icon,
    required this.stepNumber,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 10 : 15),
      decoration: BoxDecoration(
        color: const Color(0xFF4A0072),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purpleAccent, width: 2),
      ),
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 10 : 16),
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: isMobile ? 24 : 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stepNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isMobile ? 13 : 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
