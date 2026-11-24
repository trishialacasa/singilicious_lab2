import 'package:material_ui/material_ui.dart';
import 'package:singilicious/group_expenses.dart';

void main() {
  runApp(const SingiliciousApp());
}

const forestGreen = Color(0xFF234D3C);
const sageGreen = Color(0xFFD9E6CB);
const cream = Color(0xFFF5F1E8);
const honeyGold = Color(0xFFE9B872);
const rust = Color(0xFFB65338);

class SingiliciousApp extends StatelessWidget {
  const SingiliciousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Singilicious',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: forestGreen),
        useMaterial3: true,
      ),
      home: const GroupExpensesScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildQuickActions(),

                    const SizedBox(height: 22),
                    sectionTitle('Needs your attention'),
                    const SizedBox(height: 10),

                    buildPaymentNotification(),

                    const SizedBox(height: 22),
                    sectionTitle('Balances'),
                    const SizedBox(height: 10),

                    buildBalances(),

                    const SizedBox(height: 22),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sectionTitle('My groups'),
                        const Text(
                          'See all',
                          style: TextStyle(
                            color: forestGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    buildGroupCard(
                      name: 'Barkada Food Trip',
                      details: '4 members • 4 expenses',
                      code: 'BRK 4821',
                      image: 'assets/images/food_trip.png',
                      imageColor: sageGreen,
                      amount: '₱2,400.00',
                      balance: "You're owed ₱600",
                    ),

                    const SizedBox(height: 12),

                    buildGroupCard(
                      name: 'Baguio Getaway',
                      details: '4 members • 0 expenses',
                      code: 'BGO 1907',
                      image: 'assets/images/travel.png',
                      imageColor: const Color(0xFFF5E4C2),
                      amount: '',
                      balance: '',
                      isNew: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  // HEADER AND EXPENSE SUMMARY
  Widget buildHeader() {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: forestGreen,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: honeyGold,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      'singilicious.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF416654),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 23,
                        ),
                        Positioned(
                          top: 8,
                          right: 10,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: honeyGold,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Text(
                'Good Day,',
                style: TextStyle(color: sageGreen, fontSize: 12),
              ),

              const Text(
                'Trishia',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'Good food. Good friends. Fair shares.',
                style: TextStyle(color: sageGreen, fontSize: 11),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE4E6E0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total group expenses',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      '₱2,400.00',
                      style: TextStyle(
                        color: forestGreen,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: balanceBox(
                            'You owe',
                            '₱0.00',
                            rust,
                            const Color(0xFFF9EAE3),
                            Icons.north_east,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: balanceBox(
                            "You're owed",
                            '₱600.00',
                            forestGreen,
                            const Color(0xFFE3EDD7),
                            Icons.south_west,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget balanceBox(
    String label,
    String amount,
    Color textColor,
    Color background,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: textColor, size: 13),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 3),

          Text(
            amount,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // QUICK ACTIONS
  Widget buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: actionCard(
            Icons.add_rounded,
            'Add expense',
            forestGreen,
            Colors.white,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: actionCard(
            Icons.payments_outlined,
            'Record\npayment',
            honeyGold,
            forestGreen,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: actionCard(
            Icons.key_outlined,
            'Join with code',
            sageGreen,
            forestGreen,
          ),
        ),
      ],
    );
  }

  Widget actionCard(
    IconData icon,
    String label,
    Color background,
    Color foreground,
  ) {
    return Container(
      height: 86,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: foreground, size: 25),

          const SizedBox(height: 6),

          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: foreground,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: forestGreen,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // PAYMENT CONFIRMATION
  Widget buildPaymentNotification() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: honeyGold),
      ),
      child: Column(
        children: [
          Row(
            children: [
              avatar('M', honeyGold, forestGreen),

              const SizedBox(width: 10),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mika sent you ₱300.00',
                      style: TextStyle(
                        color: forestGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'via GCash • Barkada Food Trip',
                      style: TextStyle(color: Color(0xFF916329), fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: forestGreen,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Text(
                    'Confirm received',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: const Color(0xFFB7C4B9)),
                  ),
                  child: const Text(
                    'Not yet',
                    style: TextStyle(color: forestGreen, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget avatar(String letter, Color background, Color foreground) {
    return CircleAvatar(
      radius: 19,
      backgroundColor: background,
      child: Text(
        letter,
        style: TextStyle(
          color: foreground,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // OUTSTANDING BALANCES
  Widget buildBalances() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E6E0)),
      ),
      child: Column(
        children: [
          balanceRow(
            letter: 'M',
            name: 'Mika owes you',
            status: 'Payment pending your confirmation',
            amount: '₱300.00',
            avatarColor: honeyGold,
            statusColor: const Color(0xFF916329),
            letterColor: forestGreen,
          ),

          const Divider(height: 22),

          balanceRow(
            letter: 'J',
            name: 'Jay owes you',
            status: 'Waiting for payment',
            amount: '₱300.00',
            avatarColor: rust,
            statusColor: Colors.grey,
            letterColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget balanceRow({
    required String letter,
    required String name,
    required String status,
    required String amount,
    required Color avatarColor,
    required Color statusColor,
    required Color letterColor,
  }) {
    return Row(
      children: [
        avatar(letter, avatarColor, letterColor),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: forestGreen,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(status, style: TextStyle(color: statusColor, fontSize: 10)),
            ],
          ),
        ),

        const SizedBox(width: 8),

        Text(
          amount,
          style: const TextStyle(
            color: forestGreen,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // GROUP CARDS
  Widget buildGroupCard({
    required String name,
    required String details,
    required String code,
    required String image,
    required Color imageColor,
    required String amount,
    required String balance,
    bool isNew = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4E6E0)),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: imageColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: forestGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  details,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),

                const SizedBox(height: 5),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: cream,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.key_outlined,
                        color: forestGreen,
                        size: 10,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        code,
                        style: const TextStyle(color: forestGreen, fontSize: 9),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E4C2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Start',
                style: TextStyle(
                  color: Color(0xFF916329),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    color: forestGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  balance,
                  style: const TextStyle(color: forestGreen, fontSize: 10),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home_outlined, 'Home', true),

              navItem(Icons.groups_outlined, 'Groups', false),

              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: forestGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              navItem(Icons.receipt_long_outlined, 'Activity', false),

              navItem(Icons.person_outline_rounded, 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, bool isActive) {
    final color = isActive ? forestGreen : Colors.grey;

    return SizedBox(
      width: 58,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 23),

          const SizedBox(height: 3),

          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
