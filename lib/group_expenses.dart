import 'package:material_ui/material_ui.dart';

class GroupExpensesScreen extends StatelessWidget {
  const GroupExpensesScreen({super.key});

  static const green = Color(0xFF234D3C);
  static const sage = Color(0xFFD9E6CB);
  static const cream = Color(0xFFF5F1E8);
  static const gold = Color(0xFFE9B872);
  static const rust = Color(0xFFB65338);
  static const lightGold = Color(0xFFF5E4C2);
  static const blue = Color(0xFF365D7A);
  static const lightBlue = Color(0xFFE0E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTabs(),

                    const SizedBox(height: 16),

                    buildFilters(),

                    const SizedBox(height: 16),

                    dateLabel('Today'),

                    const SizedBox(height: 10),

                    expenseCard(
                      icon: Icons.kebab_dining_outlined,
                      iconBackground: lightGold,
                      iconColor: const Color(0xFF916329),
                      name: 'Samgyup dinner',
                      details: 'Paid by you • Split equally',
                      amount: '₱1,200.00',
                      balance: 'you lent ₱900',
                      balanceColor: green,
                      category: 'Food',
                      splitDetails: '4 members • ₱300 each',
                    ),

                    const SizedBox(height: 14),

                    expenseCard(
                      icon: Icons.icecream_outlined,
                      iconBackground: sage,
                      iconColor: green,
                      name: 'Ice cream',
                      details: 'Paid by Kyle • Custom split',
                      amount: '₱400.00',
                      balance: 'you owe ₱60',
                      balanceColor: rust,
                      category: 'Food',
                      splitDetails: '4 members • custom amounts',
                    ),

                    const SizedBox(height: 18),

                    dateLabel('Yesterday'),

                    const SizedBox(height: 10),

                    expenseCard(
                      icon: Icons.local_drink_outlined,
                      iconBackground: lightGold,
                      iconColor: const Color(0xFF916329),
                      name: 'Milk tea run',
                      details: 'Paid by Mika • Selected members',
                      amount: '₱480.00',
                      balance: 'you owe ₱160',
                      balanceColor: rust,
                      category: 'Food',
                      splitDetails: '3 of 4 members • ₱160 each',
                    ),

                    const SizedBox(height: 14),

                    expenseCard(
                      icon: Icons.directions_car_outlined,
                      iconBackground: lightBlue,
                      iconColor: blue,
                      name: 'Grab ride',
                      details: 'Paid by Jay • Split equally',
                      amount: '₱320.00',
                      balance: 'you owe ₱80',
                      balanceColor: rust,
                      category: 'Transport',
                      splitDetails: '4 members • ₱80 each',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        backgroundColor: green,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        icon: const Icon(Icons.add_rounded, size: 26),
        label: const Text(
          'Add expense',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }

  // GROUP HEADER AND EXPENSE SUMMARY
  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              headerIcon(Icons.arrow_back_rounded),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  'Barkada Food Trip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              headerIcon(Icons.more_vert_rounded),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total expenses',
                      style: TextStyle(
                        color: sage,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 3),

                    Text(
                      '₱2,400.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildMemberAvatars(),

                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.key_outlined, color: Colors.white, size: 13),

                        SizedBox(width: 4),

                        Text(
                          'BRK-4821',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: summaryBox('You paid', '₱1,200.00')),

              const SizedBox(width: 12),

              Expanded(child: summaryBox('Your share', '₱600.00')),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 23),
    );
  }

  Widget summaryBox(String label, String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: sage,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // OVERLAPPING MEMBER AVATARS
  Widget buildMemberAvatars() {
    return SizedBox(
      width: 100,
      height: 30,
      child: Stack(
        children: [
          Positioned(left: 0, child: memberAvatar('T', gold, green)),

          Positioned(left: 23, child: memberAvatar('M', sage, green)),

          Positioned(left: 46, child: memberAvatar('J', rust, Colors.white)),

          Positioned(left: 69, child: memberAvatar('K', lightGold, green)),
        ],
      ),
    );
  }

  Widget memberAvatar(String letter, Color background, Color foreground) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: Border.all(color: green, width: 1.5),
      ),
      child: Text(
        letter,
        style: TextStyle(
          color: foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // EXPENSES, BALANCES, AND MEMBERS TABS
  Widget buildTabs() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFE5DECA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(child: tabItem('Expenses', true)),
          Expanded(child: tabItem('Balances', false)),
          Expanded(child: tabItem('Members', false)),
        ],
      ),
    );
  }

  Widget tabItem(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: selected ? green : Colors.black54,
          fontSize: 12,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  // EXPENSE FILTERS
  Widget buildFilters() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        filterItem('All', true),
        filterItem('I paid', false),
        filterItem('Includes me', false),
      ],
    );
  }

  Widget filterItem(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? green : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: selected ? green : const Color(0xFFCDD7CD)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : green,
          fontSize: 11,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget dateLabel(String date) {
    return Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12));
  }

  // REUSABLE EXPENSE CARD
  Widget expenseCard({
    required IconData icon,
    required Color iconBackground,
    required Color iconColor,
    required String name,
    required String details,
    required String amount,
    required String balance,
    required Color balanceColor,
    required String category,
    required String splitDetails,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4E6E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: iconColor, size: 25),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: green,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      details,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      color: green,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    balance,
                    style: TextStyle(color: balanceColor, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 7,
            runSpacing: 5,
            children: [
              expenseTag(
                category,
                category == 'Transport' ? lightBlue : sage,
                category == 'Transport' ? blue : green,
              ),

              expenseTag(splitDetails, cream, green),
            ],
          ),
        ],
      ),
    );
  }

  Widget expenseTag(String label, Color background, Color foreground) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: foreground, fontSize: 10)),
    );
  }
}
