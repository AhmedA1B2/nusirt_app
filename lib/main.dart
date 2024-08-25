import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirte_university/custom/Menu/custom/translation.dart';
import 'package:sirte_university/custom/Menu/side_menu.dart';
import 'package:sirte_university/custom/home_screen/app_home.dart';
import 'package:sirte_university/custom/home_screen/app_home_loged_s.dart';
import 'package:sirte_university/custom/home_screen/app_home_loged_t.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/custom/library/library.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/custom/more/more_st.dart';
import 'package:sirte_university/custom/home_screen/widget/logedin/personal_screen_s.dart';
import 'package:sirte_university/custom/online_lectures_for_st/mark_view/show_mark.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/widget/input/in_mark.dart';
import 'package:sirte_university/custom/online_lectures_for_te/online_lecture.dart';
import 'package:sirte_university/custom/online_lectures_for_st/online_lecture.dart';
import 'package:sirte_university/custom/online_lectures_for_te/mark_view/mark.dart';
import 'package:sirte_university/custom/login_screen/s_login/custom_login.dart';
import 'package:sirte_university/custom/login_screen/options_to_login.dart';
import 'package:sirte_university/custom/splash_screen/custom_splash_screen.dart';
import 'package:sirte_university/firebase_options.dart';
import 'package:sirte_university/support.dart';
import 'package:sirte_university/vars/color.dart';
import 'package:sirte_university/vars/size.dart';
import 'package:sirte_university/vars/text.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future memoris() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble('teme') == null) {
      prefs.setDouble('teme', 0.0);
    }
    final double decimal = prefs.getDouble('teme')!;
    teme = decimal;
    setState(() {
      if (teme == 1.0) {
        bgColor = Colors.black;
        colorbody = Colors.grey;
      } else if (teme == 2.0) {
        bgColor = const Color.fromARGB(255, 8, 91, 11);
        colorbody = Colors.lightGreen;
      } else if (teme == 3.0) {
        bgColor = Colors.amber;
        colorbody = Colors.orange;
      } else if (teme == 0.0) {
        bgColor = const Color(0xff093395);
        colorbody = const Color(0xff75C5EF);
      }
    });
  }

// Lan

  option() {
    if (arEn == 0.0) {
      signInOption = "sign in";
      studentOption = "Student";
      employee = "employee";
      guestOption = "guest";
    } else if (arEn == 1.0) {
      signInOption = "تسجيل الدخول";
      studentOption = "طالب";
      employee = "موظف";
      guestOption = "ضيف";
    }
  }

//end Option

  guest() {
    if (arEn == 0.0) {
      universityOfSirte = "Sirte University";
      erorrLog = "You must be logged in to view this page";
    } else if (arEn == 1.0) {
      universityOfSirte = "جامعة سرت  ";
      erorrLog = "يجب تسجيل الدخول لعرض هذه الصفحة";
    }
  }
//end guest

  home() {
    if (arEn == 0.0) {
      aboutTheUniversity = "university";
      commonQuestions = "Questions";
      admissionSystem = "Admission system";
      faculty = "Faculty";
      theActivities = "The activities";
      regulations = "Regulations";
      universityBranches = "University branches";
      website = "Website";
    } else if (arEn == 1.0) {
      aboutTheUniversity = "عن الجامعة";
      commonQuestions = "الأسئلة الشائعة";
      admissionSystem = "نظام القبول";
      faculty = "كلية";
      theActivities = "النشاطات";
      regulations = "اللوائح";
      universityBranches = "فروع الجامعة";
      website = "الموقع الالكتروني";
    }
  }

  inHomeUn() {
    if (arEn == 0.0) {
      inAboutTheUniversity =
          'The University of Sirte was established pursuant to the Decision of the Secretary of the General People’s Committee for Higher Education No. (90) of 1989 AD as a branch of Garyounis University. The University of Sirte became administratively and financially independent under the name “Challenge University” pursuant to General People’s Committee Resolution No. (745) of 1991 AD. The university’s name was changed from (Challenge University) to (Sirte University) pursuant to General People’s Committee Resolution No. (149) of 2010 AD.Since that date, the university has continued to expand until today it has become one of the most important and prominent scientific institutions in Libya. New colleges and departments have been established, and the number of scientific and student staff has increased steadily. Although this scientific edifice began with a limited number of colleges, today it includes many The colleges, which currently number (14), are distributed across the cities of Sirte and Al-Jufra, and the number of students in these colleges is (14,857) male and female students, taught by a scientific team consisting of (544) university professors, including (370) professors from the national elements and (174) ) Professors with expatriate contracts, (227) cooperating professors, in addition to cooperating professors from Libyan universities, and administrative and technical employees, the number of whom reached (1,461) employees.';

      // Q

      characteristic =
          'What is the characteristic of a student studying to study?';
      accepted =
          'tudents are accepted and enrolled in one of the university’s colleges according to the following categories';
      a = 'A - Regular students. This category includes all students who study full-time.';
      b = 'B - Irregular students, which are students whose circumstances prevent this.';
      c = 'C - International students: The University of Sirte opens the door for admission to international students (non-Libyans) to study in one of its various colleges, whether they are students coming from their countries with scholarships according to the agreements concluded in this regard or at their own expense by virtue of their usual residence in Libya.';
      qLan = 'What is the language of study at the university?';
      aQuLan =
          'A - Arabic is the approved language of study at the university.';
      bQuLan =
          'B - English is considered the approved language of study in some university colleges, such as engineering, human medicine, and dentistry.';

      // admission

      admission = "What are the general conditions for admission?";
      requiredToBeAccepted =
          'Students are required to be accepted to study at one of the colleges of the University of Sirte in accordance with the following conditions';
      aQuAc =
          "A - The student must have a secondary school certificate from a Libyan school or an equivalent certificate recognized by the Ministry of Education and Scientific Research.";
      bQuAc = 'B - To be able to continue studying in his desired specialty.';
      cQuAc =
          'C - He must have obtained the approved percentage for college admission in accordance with the systems determined by the Ministry of Education.';
      dQuAc = 'D - To be a believer in the values ​​and trends of society.';
      eQuAc =
          'E - If the applicant is a non-Libyan, he is required to be a regular resident of Libya for the duration of the study, and to pay the tuition fees and expenses in accordance with the regulations and systems in force in the universities.';

      //Faculty

      iT = 'IT';
      engineering = 'Engineering';
      hMedicine = 'Human Medicine';
      dentistry = 'Dentistry';
      literature = 'Literature';
      agriculture = 'Agriculture';
      economics = 'Economics';
      education = 'Education';

      //theActivities

      itDay =
          'Celebrating the leaders of information technology...the driving force for change and innovation, towards building a future for Libya in the technical worlds. The National Day for Information Technology was adopted based on a proposal submitted by the “Libyan Organization for Information and Communications Technology” to the Government of National Unity in mid-April 2021, to adopt June 1 as a national day. It is a national occasion to celebrate information technology within Libya, and it was approved by Resolution 79 of 2021. During National Information Technology Day, a number of activities related to this occasion will be organized, to raise awareness of the possibilities that the use of technology and other information and communications technology will provide to various societies and economies, and in ways leading to bridging the digital divide';
      arbDay =
          "The Arabic language is one of the pillars of humanity's cultural diversity. It is one of the most widespread and widely used languages ​​in the world, as it is spoken daily by more than 400 million people on the planet. The world celebrates International Arabic Language Day on the eighteenth of December every year. This particular date was chosen to celebrate the Arabic language because it is the day on which the United Nations General Assembly took its historic decision in 1973 to make the Arabic language the sixth official language in the organization. The Arabic language has excelled in its various forms and styles, oral, written, eloquent, and colloquial.Its various lines, prose and poetic forms, are wonderful aesthetic verses that capture hearts and captivate minds in a variety of fields, including, but not limited to, artistic forms, poetry, philosophy, and singing. The Arabic language allows entry into a world full of diversity in all its origins and forms, including the diversity of origins, walks of life and beliefs. The history of the Arabic language is full of evidence indicating the many and close connections it has with other languages ​​of the world, as the Arabic language was a catalyst for the production and dissemination of knowledge, and helped transfer Greek and Roman scientific and philosophical knowledge to Europe in the Renaissance. The Arabic language allowed dialogue between cultures along the land and sea routes of the Silk Road from the coast of India to the Horn of Africa.";

      //Regulations

      disciplinaryPenalties = "Disciplinary penalties";
      expelled =
          "The student shall be punished by suspension from study for a period of no less than two academic years if he commits one of the acts stipulated in Article (28) of these regulations. The student shall be expelled from the college or institute if he returns.";
      aEx =
          'The student shall be punished by suspension from study for a period of not less than one academic year if he commits one of the acts stipulated in Article (29), and the penalty shall be doubled upon return.';
      bEx =
          'The violations stipulated in Article (30) shall be punished as follows';
      aQuEx =
          'A - Anyone who commits the violations mentioned in Paragraphs (A-B) shall be punished by suspension from study for a period of not less than one academic year and not more than two academic years, and the student shall be permanently expelled from study upon return.';
      bQuEx =
          'B- The student shall be punished by being deprived of taking the exams, in whole or in part, if he commits the violations specified in Paragraphs (C-D), and in all cases his exam shall be considered canceled in the subject in which he committed the violation.';
      cQuEx =
          'C - Anyone who commits the violation described in Paragraph (E) shall be punished by canceling the results of his examination in at least one round, and the Disciplinary Council may cancel his examination for a full year and the student shall be expelled permanently upon return.';
      dQuEx =
          'D- The violations stipulated in Paragraphs (F-G) shall be punished by deprivation of the rights of a regular student or suspension from study for a period not exceeding one academic year.';
      eQuEx =
          'The following are required for admission to study in colleges and higher institutes to obtain one of the qualifications stipulated in Article (1) of these regulations.';
      fQuEx =
          "A- The student must have a secondary school certificate from a school in the Great Jamahiriya or an equivalent certificate recognized by the General People's Committee for Higher Education.";
      gQuEx =
          'B- He must be medically able to continue studying in his desired specialty.';
      hQuEx =
          "C- He must have obtained the approved percentage for admission to the college or institute in accordance with the systems determined by the General People's Committee for Higher Education.";
      iQuEx = "D- To be a believer in the values ​​and trends of society.";
      jQuEx =
          "E - If the applicant is a non-Libyan, it is required that he be a regular resident of the Great Jamahiriya for the duration of the study, and that he pay the fees and study expenses in accordance with the regulations and systems in force in universities and higher institutes, without prejudice to the rules of reciprocity stipulated in the agreements signed in this regard, In all cases, the student must successfully pass personal interviews in colleges and institutes whose regulations require this.";

      //University branches

      zmzm = 'Zamzam';
      harawa = 'Harawa';
    } else if (arEn == 1.0) {
      inAboutTheUniversity =
          'تأسست جامعة سرت بموجب قرار امين اللجنة الشعبية العامة للتعليم العالي رقم (90) لسنة 1989م كفرع من جامعة قاريونس. واصبحت جامعة سرت مستقلة اداريا و ماليا تحت اسم "جامعة التحدي" بموجب قرار اللجنة الشعبية العامة رقم (745) لسنة 1991م تم تغيير أسم الجامعة من (جامعة التحدي) إلى (جامعة سرت) بموجب قرار اللجنة الشعبية العامة رقم (149) لسنة 2010م   ومنذ ذلك التاريخ والجامعة في توسع مستمر حتى غدت اليوم إحدى أهم المؤسسات العلمية البارزة في ليبيا،فقد استحدثت فيها كليات وأقسام جديدة،وازداد أعداد الكادر العلمي والطلابي بشكلٍ مطرد، وإن كان هذا الصرح العلمي قد بدأ بعدد محدود من الكليات، فإنه اليوم يضم العديد من الكليات التي بلغ عددها حالياً (14) كلية تتوزع على مدينتي سرت والجفرة، ويبلغ عدد الدارسين بهذه الكليات (14857) طالباً وطالبة، يقوم على تدريسهم طاقم علمي مكون من (544) أستاذاً جامعياً، منهم (370) أستاذاً من العناصر الوطنية و(174) أستاذاً بعقود مغتربة، و(227) أستاذاً متعاون، بالإضافة إلى أساتذة متعاونين من الجامعات الليبية، وموظفين إداريين وفنين بلغ عددهم (1461) موظفاً.';

      // Q

      characteristic = 'ما هي صفة قيد الطالب بالدراسة ؟';
      accepted =
          'يتم قبول الطلاب وقيدهم بأحد كليات الجامعة وفق الفئات التالية ';
      a = 'أ –طلاب نظاميون وتشمل هذه الفئة جميع الطلاب المتفرغين للدراسة .';
      b = 'ب –طلاب غير نظاميين وهم الطلاب الذين تحول ظروفهم دون ذلك .';
      c = 'ج –طلاب وافدون تفتح جامعة سرت باب القبول للطلاب الوافدين (غير الليبيين)للدراسة بأحد كلياتها المختلفة سـواء كانوا طلاباً قادمين من دولهم بمنـح دراسية حسب الاتفاقيـات المبرمة في هـذا الشأن أو على حسابهم الخاص بحكم إقامتهم الاعتيادية بليبيا .';
      qLan = 'ما هي لغة الدراسة بالجامعة ؟';
      aQuLan = 'أ -اللغة العربية هي لغة الدراسة المعتمدة بالجامعة.';
      bQuLan =
          'ب -تعتبر اللغة الانجليزية هي لغة الدراسة المعتمدة في بعض كليات الجامعة مثل الهندسة ، الطب البشري ، طب الأسنان.';

      // admission

      admission = 'ما هي الشروط العامة للقبول ؟';
      requiredToBeAccepted =
          'يشترط لقبول الطلبة للدراسة بإحدى كليات جامعة سرت وفقاً للشروط الآتية';
      aQuAc =
          'أ -أن يكون الطالب متحصلاً على الشهادة الثانوية من احد مدارس ليبيا أو ما يعادلها من الشهادات المعترف بها من وزارة التعليم والبحث العلمي.';
      bQuAc = 'ب –أن يكون قادراً صحياً على متابعة الدراسة في تخصصه المرغوب .';
      cQuAc =
          'ج –أن يكون حاصلاً على النسبة المئوية المعتمدة للقبول بالكلية وفقاًَ للنظم التي تحددها وزارة التعليم.';
      dQuAc = '                         د –أن يكون مؤمن بقيم المجتمع وتوجهاته';
      eQuAc =
          'هـ -إذا كان المتقدم من غير الليبيين يشترط أن يكون مقيم بليبيا إقامة اعتيادية طيلة مدة الدراسة ، وان يؤدي رسوم ونفقات الدراسة وفقاًَ للوائح والنظم المعمول بها في الجامعات .';

      //Faculty

      iT = 'تقنية المعلومات';
      engineering = 'كلية الهندسة';
      hMedicine = 'كلية الطب البشري';
      dentistry = 'كلية طب الأسنان';
      literature = 'كلية الاداب';
      agriculture = 'كلية الزراعة';
      economics = 'كلية الاقتصاد';
      education = 'كلية التربية';

      //theActivities

      itDay =
          'احتفال قادة تقنية المعلومات.. القوة الدافعة للتغيير والابتكار، نحو بناء مستقبل لليبيا في العوالم التقنيّة، اعتمد اليوم الوطني لتقنية المعلومات بمقترح مقدّم من “المنظمة الليبية لتقنية المعلومات والاتصالات” إلى حكومة الوحدة الوطنية في منتصف أبريل 2021، لاعتماد الأول من يونيو يومًا وطنيًّا ومناسبة وطنية للاحتفال بتقنية المعلومات داخل ربوع ليبيا، وقد أقرّ بموجب القرار 79 لعام 2021، سَتُنَظّم خلال اليوم الوطني لتقنية المعلومات عددًا من الأنشطة المتعلقة بهذه المناسبة، لإذكاء الوعي بالإمكانيات التي من شأن استعمال التقنية وغيرها من تكنولوجيا المعلومات والاتصالات أن يوفرها لشتّى المجتمعات والاقتصادات، وبالسبل المؤدية إلى سدّ الفجوة الرقمية';
      arbDay =
          'تُعدّ اللغة العربية ركناً من أركان التنوع الثقافي للبشرية. وهي إحدى اللغات الأكثر انتشاراً واستخداماً في العالم، إذ يتكلمها يومياً ما يزيد على 400 مليون نسمة من سكان المعمورة. يحتفل العالم باليوم العالمي للغة العربية في الثامن عشر من كانون الأول/ديسمبر من كل عام. وقد وقع الاختيار على هذا التاريخ بالتحديد للاحتفاء باللغة العربية لأنه اليوم الذي اتخذت فيه الجمعية العامة للأمم المتحدة في عام 1973 قرارها التاريخي بأن تكون اللغة العربية لغة رسمية سادسة في المنظمة.وقد أبدعت اللغة العربية بمختلف أشكالها وأساليبها الشفهية والمكتوبة والفصيحة والعامية، ومختلف خطوطها وفنونها النثرية والشعرية، آيات جمالية رائعة تأسر القلوب وتخلب الألباب في ميادين متنوعة تضم على سبيل المثال لا الحصر الهندسة والشعر والفلسفة والغناء. وتتيح اللغة العربية الدخول إلى عالم زاخر بالتنوع بجميع أشكاله وصوره، ومنها تنوع الأصول والمشارب والمعتقدات. ويزخر تاريخ اللغة العربية بالشواهد التي تبيّن الصلات الكثيرة والوثيقة التي تربطها بعدد من لغات العالم الأخرى، إذ كانت اللغة العربية حافزاً إلى إنتاج المعارف ونشرها، وساعدت على نقل المعارف العلمية والفلسفية اليونانية والرومانية إلى أوروبا في عصر النهضة. وأتاحت اللغة العربية إقامة الحوار بين الثقافات على طول المسالك البرية والبحرية لطريق الحرير من سواحل الهند إلى القرن الأفريقي';

      //Regulations

      disciplinaryPenalties = "العقوبات التأديبية";
      expelled =
          "يعاقب الطالب بالإيقاف عن الدراسة لمدة لا تقل عن سنتين دراسيتين إذا ارتكب أحد الأفعال المنصوص عليها في المادة (28)من هذه اللائحة، يفصل الطالب من الكلية أو المعهد إذا كان عائداً";
      aEx =
          'يعاقب الطالب بالإيقاف عن الدراسة لمدة لا تقل عن سنة دراسية إذا ارتكب أحد الأفعال المنصوص عليها في المادة (29) وتضاعف العقوبة عند العودة';
      bEx = 'يعاقب على المخالفات المنصوص عليها في المادة (30) على النحو التالي';
      aQuEx =
          'أ-يعاقب بالوقف عن الدراسة بمدة لا تقل عن سنة دراسية ولا تزيد عن سنتين دراسيتين كل من ارتكب المخالفات الواردة في الفقرتين ( أ –ب )، ويفصل الطالب من الدراسة فصلاً نهائياً عند العودة';
      bQuEx =
          'ب-يعاقب الطالب بالحرمان من دخول الامتحانات كلياً أو جزئياً إذا أرتكب المخالفات المحددة في الفقرتين ( ج –د )، وفي جميع الأحوال يعتبر امتحانه ملغياً في المادة التي ارتكب فيها المخالفة';
      cQuEx =
          'ج-يعاقب كل من أرتكب المخالفة الواردة بيانها في الفقرة (هـ) بإلغاء نتيجة امتحانه في دور واحد على الأقل، ويجوز لمجلس التأديب إلغاء امتحانه لسنة كاملة ويفصل الطالب فصلاً نهائياً عند العودة ';
      dQuEx =
          'د-يعاقب على المخالفات المنصوص عليها في الفقرتين (و –ز) بالحرمان من حقوق الطالب النظامي أو الإيقاف عن الدراسة مدة لا تزيد على سنة دراسية واحدة.';
      eQuEx =
          'يشترط للقبول للدراسة بالكليات والمعاهد العليا لنيل أحدى المؤهلات المنصوص عليها في المادة (1) من هذه اللائحة ما يلي';
      fQuEx =
          'أ- على أن يكون الطالب حاصلاً على الشهادة الثانوية من إحدى مدارس الجماهيرية العظمى أو ما يعادلها من الشهادات المعترف بها من اللجنة الشعبية العامة للتـعليم العالي';
      gQuEx = 'ب- أن يكون قادراً صحياً على مـتابعة الدراسة في تخصـصه المــرغوب';
      hQuEx =
          'ج- أن يكون حاصلاً على النسبة المئوية المعتمدة للقبول بالكلية أو المعهد وفق النظم التي تحددها اللجنة الشعبية العامة للتعليم العالي';
      iQuEx =
          "                           د- أن يكون مؤمناً بقيم المجتمع وتوجهاته";
      jQuEx =
          'ه- إذا كان المتقدم من غير الليبيين يشترط أن يكون مقيماً بالجماهيرية العظمى إقامة اعتيادية طيلة مدة الدراسة ،وأن يؤدي الرسوم ونفقات الدراسة وفق اللوائح والنظم المعمول بها في الجامعات والمعاهد العليا، وذلك دون إخلال بقواعد المعاملة بالمثل المنصوص عليها في الاتفاقيات الموقعة بهذا الشأن، وفي جميع الأحوال على الطالب اجتياز المقابلات الشخصية بنجاح في الكليات والمعاهد التي تشترط لوائحها ذلك';

      //University branches

      zmzm = 'فرع زمزم';
      harawa = 'فرع زمزم';
    }
  }

  menu() {
    if (arEn == 0.0) {
      onlineLectures = "lectures";
      ai = "AI";
      mysupport = "Support";
      theme = "Theme";
      language = "Language";
    } else if (arEn == 1.0) {
      onlineLectures = "محاضرات";
      ai = "ذكاء اصطناعي";
      mysupport = "الدعم";
      theme = "سمة";
      language = "اللغة";
    }
  }

  Future memorisLan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble('arEn') == null) {
      prefs.setDouble('arEn', 1.0);
    }
    final double decimal = prefs.getDouble('arEn')!;
    arEn = decimal;
    setState(() {
      if (arEn == 0.0) {
        option();
        guest();
        home();
        inHomeUn();
        menu();
        arEn = 1.0;
      } else if (arEn == 1.0) {
        option();
        guest();
        home();
        inHomeUn();
        menu();
        arEn = 0.0;
      }
    });
  }

//End Lan

//tutorial
  Future memorisOne() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble('one') == null) {
      prefs.setDouble('one', 0.0);
    }
    final double decimalOne = prefs.getDouble('one')!;
    oneTime = decimalOne;
  }

  @override
  void initState() {
    memoris();
    memorisLan();
    memorisOne();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: const Welcome(),
      routes: {
        "logn": (context) => const LoginForm(),
        "home": (context) => const HomeScreen(),
        "homes": (context) => const HomeScreenLoged(),
        "homet": (context) => const HomeScreenLogedT(),
        "op": (context) => const OptionToLogin(),
        "support": (context) => const Support(),
        "libary": (context) => const Library(),
        "MoreSt": (context) => const MoreSt(),
        "PersonalScreenS": (context) => const PersonalScreenS(),
        "lecture": (context) => const OnlineLecture(),
        "lectures": (context) => const OnlineLectureSt(),
        "mark": (context) => const Mark(),
        "inMark": (context) => const InMark(),
        "showmark": (context) => const ShowMark(),
      },
    );
  }
}
