import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MahdiApp());
}

// ============================================================
// الألوان والثيم
// ============================================================

class AppColors {
  static const green = Color(0xFF123D32);
  static const greenLight = Color(0xFF1F5B49);
  static const gold = Color(0xFFC7A76C);
  static const ivory = Color(0xFFF7F3E9);
  static const paper = Color(0xFFFFFCF5);
  static const text = Color(0xFF26352D);
  static const muted = Color(0xFF7C837B);
  static const border = Color(0xFFE6DFD0);

  static const darkBackground = Color(0xFF101A17);
  static const darkCard = Color(0xFF192721);
  static const darkText = Color(0xFFEAE8DE);
  static const darkMuted = Color(0xFFA7B1A8);
}

class MahdiApp extends StatefulWidget {
  const MahdiApp({super.key});

  @override
  State<MahdiApp> createState() => _MahdiAppState();
}

class _MahdiAppState extends State<MahdiApp> {
  bool darkMode = false;

  void toggleTheme() {
    setState(() => darkMode = !darkMode);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = darkMode;

    return MaterialApp(
      title: 'المهدي المنتظر',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.ivory,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          primary: AppColors.green,
          surface: AppColors.paper,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.greenLight,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.darkText,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        darkMode: darkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

// ============================================================
// نموذج المحتوى
// ============================================================

class LibrarySection {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<LibraryArticle> articles;

  const LibrarySection({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.articles,
  });
}

class LibraryArticle {
  final String title;
  final String content;
  final String category;
  final String source;
  final String status;
  final IconData icon;

  const LibraryArticle({
    required this.title,
    required this.content,
    required this.category,
    this.source = 'المصدر يحتاج إلى تحقق',
    this.status = 'غير متحقق من النسبة',
    this.icon = Icons.menu_book_rounded,
  });
}

// ============================================================
// قاعدة المحتوى المحلية
// يمكنك إضافة بقية النصوص داخل الأقسام المناسبة هنا.
// ============================================================

const List<LibrarySection> librarySections = [
  LibrarySection(
    title: 'الروايات المتداولة',
    subtitle: 'روايات ونقول تحتاج إلى التوثيق',
    icon: Icons.auto_stories_rounded,
    color: Color(0xFF577A58),
    articles: [
      LibraryArticle(
        title: 'رواية رؤية النبي ﷺ',
        category: 'الروايات المتداولة',
        content: '''من رآني فقد رأى الحق.

تنبيه توثيقي:
ورد هذا اللفظ ضمن النصوص التي أرسلها المستخدم. ينبغي التحقق من مصدر الرواية وسياقها قبل ربطها بعلامة محددة من علامات ظهور المهدي.''',
        source: 'المصدر غير محدد في النص المرسل',
        status: 'يلزم التحقق من السياق والنسبة',
        icon: Icons.format_quote_rounded,
      ),
      LibraryArticle(
        title: 'رواية الأمطار الغزيرة',
        category: 'الروايات المتداولة',
        content: '''يقول الرائي ويقسم:
رأيت النبي وسألته: متى يخرج المهدي؟
فقال: يخرج المهدي بعد أمطار غزيرة تجرف الأرض!

تنبيه:
هذا نص منقول ضمن المواد المرسلة، وليس إثباتًا لصحة رواية نبوية. يلزم الرجوع إلى مصدر موثق للتحقق من إسناده ولفظه.''',
        source: 'لم يذكر مصدر حديثي موثق',
        status: 'غير متحقق من الصحة',
        icon: Icons.water_drop_rounded,
      ),
    ],
  ),
  LibrarySection(
    title: 'كتاب الجفر والنقول',
    subtitle: 'النصوص المنقولة حول الجفر وعلامات آخر الزمان',
    icon: Icons.menu_book_rounded,
    color: Color(0xFF9A7743),
    articles: [
      LibraryArticle(
        title: 'مقدمة النص المنقول عن الجفر',
        category: 'كتاب الجفر والنقول',
        content: '''الحمد لله مفني الأمم، ومحيي الرمم، والصلاة على الممد بالهمم، صاحب الطريق الأتم.

وبعد، فإن هذا الكتاب الجليل الشأن، العظيم البرهان...

يتناول النص المرسل أقوالًا منسوبة إلى شخصيات تاريخية، وموضوعات تتعلق بعلم الحروف والجفر وأحداث آخر الزمان.

تنبيه توثيقي:
هذا المقطع محفوظ بوصفه نصًا منقولًا، ولا يعني إدراجه ثبوت نسبة جميع عباراته إلى الشخصيات المذكورة فيه.''',
        source: 'النص المرسل؛ بيانات الطبعة والصفحة غير متوفرة',
        status: 'نص منقول يحتاج إلى توثيق',
      ),
      LibraryArticle(
        title: 'المقطع المتعلق بمصر',
        category: 'كتاب الجفر والنقول',
        content: '''يا أهل مصر، مهديكم آن أوانه، وقرب زمانه...

هذا مقتطف من النص الطويل الذي أرسله المستخدم، ويتناول مصر وما يصفه النص بأنه أحداث وفتن مرتبطة بآخر الزمان.

تنبيه:
هذا المقتطف ليس حديثًا نبويًا ثابتًا لمجرد وروده في نص منقول. يلزم التحقق من مصدره ونسبته.''',
        source: 'المصدر والصفحة غير محددين',
        status: 'غير متحقق من النسبة',
      ),
      LibraryArticle(
        title: 'المقطع المتعلق بعلامات الساعة',
        category: 'كتاب الجفر والنقول',
        content: '''يتضمن النص المرسل مقاطع عن علامات الساعة، والدجال، ونزول عيسى عليه السلام، ويأجوج ومأجوج، وأحداث أخرى.

هذا القسم مخصص لحفظ النصوص المنقولة ودراستها، مع الفصل بين النقل التاريخي وبين ما ثبت في المصادر الإسلامية المعتبرة.

يمكن إضافة النص الكامل هنا داخل حقل content مع الحفاظ على ألفاظه وترتيبه.''',
        source: 'بيانات المصدر تحتاج إلى استكمال',
        status: 'نص يحتاج إلى مراجعة',
      ),
    ],
  ),
  LibrarySection(
    title: 'علامات آخر الزمان',
    subtitle: 'موضوعات حول العلامات والأحداث المستقبلية',
    icon: Icons.nights_stay_rounded,
    color: Color(0xFF657BA1),
    articles: [
      LibraryArticle(
        title: 'علامات الظهور في النصوص المتداولة',
        category: 'علامات آخر الزمان',
        content: '''تتضمن المواد المرسلة إشارات إلى:
• الأمطار والظواهر الطبيعية.
• الفتن والأحداث العامة.
• الدجال ونزول عيسى عليه السلام.
• يأجوج ومأجوج.
• أحداث مرتبطة بمصر وبلاد العرب.

هذا الفهرس موضوعي لتنظيم المواد، وليس حكمًا على صحة ما ورد فيها.

يجب التمييز بين الأحاديث الصحيحة والنقول التاريخية والتأويلات والكتابات غير الموثقة.''',
        source: 'فهرس موضوعي للمواد المرسلة',
        status: 'تصنيف موضوعي وليس توثيقًا',
      ),
    ],
  ),
  LibrarySection(
    title: 'النصوص التأويلية',
    subtitle: 'نصوص ذات طابع رمزي وروحي',
    icon: Icons.auto_awesome_rounded,
    color: Color(0xFF9B7198),
    articles: [
      LibraryArticle(
        title: 'الفرقيوليط وبيان التأويل',
        category: 'النصوص التأويلية',
        content: '''الفرقيوليط .. فرقان القدرة وبيان التأويل
(الجزء الثاني)

عودة النور المحمدي وروح السلام.

واعلم بارك الله فيك أن عرش الرحمن ليس موضعًا لذاته، حاشاه أن يحتاج إلى مخلوق أو يفتقر إلى مستقر...

يتناول النص المرسل تأويلات رمزية وروحية تتعلق بالقرآن والإمامة وآخر الزمان.

هذا النص محفوظ بوصفه كتابة تأويلية، ولا يُعامل باعتباره قرآنًا أو حديثًا نبويًا.''',
        source: 'النص المرسل؛ بيانات النشر غير متوفرة',
        status: 'نص تأويلي غير موثق',
      ),
    ],
  ),
  LibrarySection(
    title: 'أوصاف المهدي',
    subtitle: 'الأوصاف المنقولة في كتابات متداولة',
    icon: Icons.person_outline_rounded,
    color: Color(0xFFB17D54),
    articles: [
      LibraryArticle(
        title: 'المهدي في أقوال متداولة',
        category: 'أوصاف المهدي',
        content: '''هو الأشعث الأغبر المتروك، وحيد زمانه، فريد خلانه...

هذا مقتطف من النص الوصفي الطويل الذي أرسله المستخدم.

يتضمن النص أوصافًا شخصية ورمزية، وحديثًا عن الابتلاء والصبر والظهور والبيعة.

تنبيه:
لا تُنسب هذه الأوصاف إلى النبي ﷺ أو إلى شخصية تاريخية محددة دون مصدر موثق.''',
        source: 'المصدر غير محدد في النص المرسل',
        status: 'نسبة غير متحققة',
      ),
    ],
  ),
  LibrarySection(
    title: 'النقول عن مصر',
    subtitle: 'نصوص تتناول مصر وأحداث آخر الزمان',
    icon: Icons.account_balance_rounded,
    color: Color(0xFF4B827E),
    articles: [
      LibraryArticle(
        title: 'صحابي مصر والنقول المتداولة',
        category: 'النقول عن مصر',
        content: '''تتضمن المواد المرسلة نصوصًا تتحدث عن مصر، والكنانة، وأوصاف أشخاص وأحداث مستقبلية.

يُحفظ هذا القسم لتنظيم النصوص المتداولة حول مصر، مع عدم اعتبار نسبتها إلى أي عالم أو شخصية تاريخية ثابتة ما لم يتوفر مصدر قابل للتحقق.

يمكن إضافة النصوص الكاملة هنا دون حذف أي فقرة من النص الأصلي.''',
        source: 'بيانات المصدر غير مكتملة',
        status: 'نص يحتاج إلى توثيق',
      ),
      LibraryArticle(
        title: 'نصوص متداولة عن مجدّو',
        category: 'النقول عن مصر',
        content: '''تتضمن المواد المرسلة مقاطع تتحدث عن مجدّو، وأحداث مستقبلية، وأوصاف أشخاص وجماعات.

تُعرض هذه الكتابات هنا بوصفها نصوصًا متداولة تحتاج إلى التحقق من أصلها، ولا يُفهم من وجودها في التطبيق أنها ثابتة النسبة إلى عالم بعينه.''',
        source: 'المصدر غير محدد',
        status: 'غير متحقق من النسبة',
      ),
    ],
  ),
  LibrarySection(
    title: 'القرآن الكريم',
    subtitle: 'الآيات القرآنية الواردة في المواد',
    icon: Icons.mosque_rounded,
    color: Color(0xFF527B56),
    articles: [
      LibraryArticle(
        title: 'سورة البقرة: الآيات 136–138',
        category: 'القرآن الكريم',
        content: '''قُولُوا آمَنَّا بِاللَّهِ وَمَا أُنْزِلَ إِلَيْنَا وَمَا أُنْزِلَ إِلَىٰ إِبْرَاهِيمَ وَإِسْمَاعِيلَ وَإِسْحَاقَ وَيَعْقُوبَ وَالْأَسْبَاطِ وَمَا أُوتِيَ مُوسَىٰ وَعِيسَىٰ وَمَا أُوتِيَ النَّبِيُّونَ مِنْ رَبِّهِمْ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْهُمْ وَنَحْنُ لَهُ مُسْلِمُونَ ۝١٣٦

فَإِنْ آمَنُوا بِمِثْلِ مَا آمَنْتُمْ بِهِ فَقَدِ اهْتَدَوْا وَإِنْ تَوَلَّوْا فَإِنَّمَا هُمْ فِي شِقَاقٍ فَسَيَكْفِيكَهُمُ اللَّهُ وَهُوَ السَّمِيعُ الْعَلِيمُ ۝١٣٧

صِبْغَةَ اللَّهِ وَمَنْ أَحْسَنُ مِنَ اللَّهِ صِبْغَةً وَنَحْنُ لَهُ عَابِدُونَ ۝١٣٨

سورة البقرة، الآيات 136–138.''',
        source: 'القرآن الكريم، سورة البقرة',
        status: 'نص قرآني',
        icon: Icons.menu_book_rounded,
      ),
    ],
  ),
];

// ============================================================
// الصفحة الرئيسية
// ============================================================

class HomePage extends StatefulWidget {
  final bool darkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.darkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  String query = '';
  double fontSize = 19;

  final TextEditingController searchController = TextEditingController();
  final Set<String> favorites = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      favorites.addAll(prefs.getStringList('mahdi_favorites') ?? []);
    } catch (_) {}

    if (mounted) {
      setState(() => loading = false);
    }
  }

  Future<void> toggleFavorite(LibraryArticle article) async {
    setState(() {
      if (favorites.contains(article.title)) {
        favorites.remove(article.title);
      } else {
        favorites.add(article.title);
      }
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('mahdi_favorites', favorites.toList());
    } catch (_) {}

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          favorites.contains(article.title)
              ? 'أُضيف إلى المفضلة'
              : 'أُزيل من المفضلة',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<LibraryArticle> get allArticles {
    return librarySections.expand((s) => s.articles).toList();
  }

  List<LibraryArticle> get filteredArticles {
    final normalizedQuery = query.trim().toLowerCase();

    Iterable<LibraryArticle> result = allArticles;

    if (selectedTab == 1) {
      result = result.where((a) => favorites.contains(a.title));
    }

    if (normalizedQuery.isNotEmpty) {
      result = result.where((a) {
        return a.title.toLowerCase().contains(normalizedQuery) ||
            a.content.toLowerCase().contains(normalizedQuery) ||
            a.category.toLowerCase().contains(normalizedQuery);
      });
    }

    return result.toList();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome, color: AppColors.gold, size: 21),
            SizedBox(width: 9),
            Text(
              'المهدي المنتظر',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: dark ? 'الوضع النهاري' : 'الوضع الليلي',
            onPressed: widget.onToggleTheme,
            icon: Icon(
              dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHero(dark),
            _buildSearch(),
            _buildTabs(),
            Expanded(
              child: selectedTab == 0 && query.isEmpty
                  ? _buildSections(dark)
                  : _buildArticleList(filteredArticles, dark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool dark) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.green, AppColors.greenLight],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -12,
            top: -15,
            child: Icon(
              Icons.mosque_rounded,
              size: 105,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.gold.withOpacity(0.5),
                  ),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.gold,
                  size: 29,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'مكتبة المهدي المنتظر',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'نصوص وروايات وموضوعات مرتبة لسهولة القراءة والبحث',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.82),
                  fontSize: 14,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  _heroChip(
                    Icons.library_books_rounded,
                    '${librarySections.length} أقسام',
                  ),
                  const SizedBox(width: 8),
                  _heroChip(
                    Icons.menu_book_rounded,
                    '${allArticles.length} نصوص',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.gold, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() => query = value);
        },
        decoration: InputDecoration(
          hintText: 'ابحث عن نص أو موضوع...',
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: query.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() => query = '');
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Row(
        children: [
          Expanded(
            child: _tabButton(
              label: 'الأقسام',
              icon: Icons.grid_view_rounded,
              selected: selectedTab == 0,
              onTap: () => setState(() => selectedTab = 0),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _tabButton(
              label: 'المفضلة',
              icon: Icons.favorite_rounded,
              selected: selectedTab == 1,
              onTap: () => setState(() => selectedTab = 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.green
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected
                ? AppColors.green
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? Colors.white : AppColors.gold,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSections(bool dark) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 2, 16, 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 8, 3, 13),
          child: Text(
            'تصفح المكتبة',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: dark ? AppColors.darkText : AppColors.text,
            ),
          ),
        ),
        ...librarySections.map((section) {
          return _sectionCard(section, dark);
        }),
        const SizedBox(height: 12),
        _buildNotice(dark),
      ],
    );
  }

  Widget _sectionCard(LibrarySection section, bool dark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: dark
              ? Colors.white.withOpacity(0.07)
              : AppColors.border,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SectionPage(
                section: section,
                favorites: favorites,
                fontSize: fontSize,
                onToggleFavorite: toggleFavorite,
                onFontSizeChanged: (value) {
                  setState(() => fontSize = value);
                },
              ),
            ),
          ).then((_) {
            if (mounted) setState(() {});
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: section.color.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  section.icon,
                  color: section.color,
                  size: 29,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: dark ? AppColors.darkText : AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      section.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.6,
                        color: dark
                            ? AppColors.darkMuted
                            : AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '${section.articles.length} نصوص',
                      style: TextStyle(
                        color: section.color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
                color: dark ? AppColors.darkMuted : AppColors.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleList(List<LibraryArticle> articles, bool dark) {
    if (articles.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selectedTab == 1
                    ? Icons.favorite_border_rounded
                    : Icons.search_off_rounded,
                size: 60,
                color: AppColors.gold,
              ),
              const SizedBox(height: 14),
              Text(
                selectedTab == 1
                    ? 'لا توجد نصوص في المفضلة'
                    : 'لم يتم العثور على نتائج',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'يمكنك اختيار نص وإضافته إلى المفضلة للرجوع إليه لاحقًا.',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.7),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _articleCard(articles[index], dark);
      },
    );
  }

  Widget _articleCard(LibraryArticle article, bool dark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: dark
              ? Colors.white.withOpacity(0.07)
              : AppColors.border,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: () => _openArticle(article),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.gold,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.status,
                      style: TextStyle(
                        fontSize: 11,
                        color: dark
                            ? AppColors.darkMuted
                            : AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: dark ? AppColors.darkMuted : AppColors.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotice(bool dark) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.gold.withOpacity(0.35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppColors.gold,
            size: 23,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              'هذا التطبيق مكتبة لتنظيم النصوص. وجود نص داخل أحد الأقسام لا يعني ثبوت صحته أو صحة نسبته إلى النبي ﷺ أو غيره.',
              style: TextStyle(
                height: 1.8,
                fontSize: 12,
                color: dark ? AppColors.darkText : AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openArticle(LibraryArticle article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ArticlePage(
          article: article,
          isFavorite: favorites.contains(article.title),
          fontSize: fontSize,
          onToggleFavorite: () => toggleFavorite(article),
          onFontSizeChanged: (value) {
            setState(() => fontSize = value);
          },
        ),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }
}

// ============================================================
// صفحة القسم
// ============================================================

class SectionPage extends StatelessWidget {
  final LibrarySection section;
  final Set<String> favorites;
  final double fontSize;
  final Function(LibraryArticle) onToggleFavorite;
  final ValueChanged<double> onFontSizeChanged;

  const SectionPage({
    super.key,
    required this.section,
    required this.favorites,
    required this.fontSize,
    required this.onToggleFavorite,
    required this.onFontSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(section.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  section.color,
                  section.color.withOpacity(0.75),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Icon(section.icon, size: 44, color: Colors.white),
                const SizedBox(height: 12),
                Text(
                  section.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  section.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...section.articles.map(
            (article) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: CircleAvatar(
                  backgroundColor: section.color.withOpacity(0.13),
                  child: Icon(section.icon, color: section.color),
                ),
                title: Text(
                  article.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    article.status,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArticlePage(
                        article: article,
                        isFavorite: favorites.contains(article.title),
                        fontSize: fontSize,
                        onToggleFavorite: () =>
                            onToggleFavorite(article),
                        onFontSizeChanged: onFontSizeChanged,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// صفحة قراءة النص
// ============================================================

class ArticlePage extends StatefulWidget {
  final LibraryArticle article;
  final bool isFavorite;
  final double fontSize;
  final VoidCallback onToggleFavorite;
  final ValueChanged<double> onFontSizeChanged;

  const ArticlePage({
    super.key,
    required this.article,
    required this.isFavorite,
    required this.fontSize,
    required this.onToggleFavorite,
    required this.onFontSizeChanged,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late bool favorite;
  late double size;

  @override
  void initState() {
    super.initState();
    favorite = widget.isFavorite;
    size = widget.fontSize;
  }

  Future<void> copyText() async {
    await Clipboard.setData(
      ClipboardData(
        text: '${widget.article.title}\n\n${widget.article.content}',
      ),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم نسخ النص'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void changeFavorite() {
    widget.onToggleFavorite();
    setState(() => favorite = !favorite);
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('قراءة النص'),
        actions: [
          IconButton(
            tooltip: 'نسخ النص',
            onPressed: copyText,
            icon: const Icon(Icons.copy_all_rounded),
          ),
          IconButton(
            tooltip: favorite ? 'إزالة من المفضلة' : 'إضافة للمفضلة',
            onPressed: changeFavorite,
            icon: Icon(
              favorite ? Icons.favorite_rounded : Icons.favorite_border,
              color: favorite ? Colors.pinkAccent : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.green, AppColors.greenLight],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 5,
                  child: Icon(
                    Icons.mosque_rounded,
                    size: 120,
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.gold,
                        size: 34,
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          widget.article.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.10),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: AppColors.gold.withOpacity(0.35),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.gold,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.status,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.article.source,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dark
                    ? Colors.white.withOpacity(0.07)
                    : AppColors.border,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.format_size_rounded,
                      color: AppColors.gold,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'حجم الخط',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'تصغير الخط',
                      onPressed: size > 14
                          ? () {
                              setState(() => size--);
                              widget.onFontSizeChanged(size);
                            }
                          : null,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    IconButton(
                      tooltip: 'تكبير الخط',
                      onPressed: size < 32
                          ? () {
                              setState(() => size++);
                              widget.onFontSizeChanged(size);
                            }
                          : null,
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                const Divider(height: 24),
                SelectableText(
                  widget.article.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: size,
                    height: 2.0,
                    letterSpacing: 0.1,
                    color: dark ? AppColors.darkText : AppColors.text,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: copyText,
            icon: const Icon(Icons.copy_rounded),
            label: const Text('نسخ النص كاملًا'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              foregroundColor: AppColors.gold,
              side: const BorderSide(color: AppColors.gold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'تنبيه: وجود النص في المكتبة لا يعني ثبوت صحتها كلها للنبي ﷺ بل هي تجميعية لنصوص العلماء والخلفاء .',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              height: 1.8,
              color: dark ? AppColors.darkMuted : AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}