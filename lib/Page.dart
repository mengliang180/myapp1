import 'package:flutter/material.dart';

class Word {
  final String title; // Word itself
  final List<String> meanings; // List of meanings for the word

  const Word({required this.title, required this.meanings});
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

final List<Word> _allWords = [
  Word(title: 'ក',meanings: ['ពាក្យ​​ "ក"', 'ព្យញ្ជនៈទី ១ ក្នុងវគ្គទី ១ ជាកណ្ឋជៈ មានសំឡេងក្នុងឋានបំពង់ក ជាសិថិល - អឃោសៈ, សំ. បា. មានសូរស័ព្ទថា កៈ ។ ','( នាមសព្ទ )','អវយវៈដែលតពីក្បាលទៅស្មា ឬទៅខ្លួននៃមនុស្សសត្វ ។ ដៃជើងមនុស្សក៏មាន ក ដែរ : កដៃ, កជើង។ ទងខាងដើមកួរស្រូវក៏ហៅ ក ដែរ : កស្រូវ ។ កន្លែងដែលតជាប់ពីមាត់ដបជាដើមចុះទៅទល់នឹងក្អេងក៏ហៅ ក ដែរ : កដប, កក្អម ។','( កិរិយាសព្ទ )','តាំងផ្ដើម, តាំងធ្វើកសាង, កកើត, កចេតិយ, កភូមិ ។']),
  Word(title: 'ក៏', meanings: ['ពាក្យ​​ "ក៏"', '( និបាតសព្ទ )','ពាក្យជាសន្ធានមានសំឡេងកញ្ឆក់ខ្លីសម្រាប់និយាយតប្រយោគដោយឡែក','អ្នកក៏ទៅ, ខ្ញុំក៏ទៅ, ធ្វើដូច្នេះក៏បាន, របស់នេះរូបក៏ល្អ តម្លៃក៏ថោក ។']),
  Word(title: 'កក', meanings: ['ពាក្យ​ "កក"', '( កិរិយាសព្ទ )','ប្រែពីរាវទៅជាខន់','ខ្លាញ់កក, ប្រេងដូងកក, ទឹកកក ។','កិរិយាវិសេសន៍','កុះករ, តាន់តាប់, ជុំជិត, កុញ, ត្រៀបត្រា','មើលទៅឃើញមនុស្សកក, ឈរកក ។','គុណសព្ទ','កុះករ, តាន់តាប់, ជុំជិត, កុញ, ត្រៀបត្រា','មើលទៅឃើញមនុស្សកក, ឈរកក ។']),
  Word(title: 'កក់', meanings: ['ពាក្យ "កក់"', '( កិរិយាសព្ទ )','ជម្រះសក់ឲ្យស្អាត','កក់សក់ ។','ធ្វើឲ្យទទឹកជោក','ភ្លៀងកក់ ។','បញ្ចាំទុកមុន, ឲ្យមុនជាការបញ្ចាំចិត្ត','ខ្ញុំបានកក់ប្រាក់៥០រៀលឲ្យគេរួចហើយ ។','( នាមសព្ទ )','ឈ្មោះស្មៅទឹកមួយពួក សម្រាប់ប្រើជារបរធ្វើកន្ទេល ។ កក់មានច្រើនប្រភេទ គឺ កក់មូល, កក់ជ្រុង, កក់ចែងម៉ែង ។ ល ។ ឈ្មោះប្រដាប់មួយយ៉ាងមានសណ្ឋានដូចផ្លែឈូកសម្រាប់ងូតទឹក','ទឹកធ្លាក់ចេញពីកក់ ( ហៅ ផ្លែឈូក ក៏បាន ) ។']),
  Word(title: 'កក្កដ', meanings: ['', '']),
  Word(title: 'កករ', meanings: ['', '']),
  Word(title: 'កកាត', meanings: ['', '']),
  Word(title: 'កកាយ', meanings: ['', '']),
  Word(title: 'កកិចកកុច', meanings: ['', '']),
  Word(title: 'កកិត', meanings: ['', '']),
  Word(title: 'កកិល', meanings: ['', '']),
  Word(title: 'កកូរ', meanings: ['', '']),
  Word(title: 'កក្កដ', meanings: ['', '']),
  Word(title: 'កករ', meanings: ['', '']),
  Word(title: 'កកាត', meanings: ['', '']),
  Word(title: 'កកាយ', meanings: ['', '']),
  Word(title: 'កកិចកកុច', meanings: ['', '']),
  Word(title: 'កកិត', meanings: ['', '']),
  Word(title: 'កកិល', meanings: ['', '']),
  Word(title: 'កកូរ', meanings: ['', '']),

];

class _SearchState extends State<Search> {
  /* final List<Word> _allWords = [
    Word(title: 'ក', meanings: ['Mobile app development framework', 'To move with quick, irregular beats']),
    Word(title: 'ខ', meanings: ['Programming language for Flutter', 'A small, pointed missile']),
    Word(title: 'គ', meanings: ['Mobile application', 'To attach something firmly']),
  ];*/
  List<Word> _filteredWords = [];
  // ignore: unused_field
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _filteredWords = _allWords;
  }

  void _filterWords(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _filteredWords = _allWords;
      });
      return;
    }
    setState(() {
      _filteredWords = _allWords
          .where((word) =>
              word.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _navigateToMeaningDetails(String word, List<String> meanings) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MeaningDetailsPage(word: word, meanings: meanings),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 112, 201),
       title: Text(
          'វចនានុក្រមសំណង់',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.8),
            child: TextField(
              decoration: const InputDecoration(
                //labelText: 'ស្វែងរក',
                // icon: Icon(Icons.search)
                filled: true,
                fillColor: Color.fromARGB(255, 243, 244, 246),
                // enabledBorder: InputBorder.none,
               //  focusedBorder: InputBorder.none,
               
                hintText: 'ស្វែងរក',
              ),
              onChanged: (text) {
                _searchText = text;
                _filterWords(
                  text,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredWords.length,
              itemBuilder: (context, index) {
                final word = _filteredWords[index];
                return ListTile(
                  title: Text(
                    word.title,
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => _navigateToMeaningDetails(
                    word.title,
                    word.meanings,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class MeaningDetailsPage extends StatelessWidget {
  final String word;
  final List<String> meanings;

  const MeaningDetailsPage({required this.word, required this.meanings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Color.fromARGB(255, 3, 112, 201),
        title: Text(
          word, // Set word color here
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.red, // Set word color to red
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: meanings.length,
        itemBuilder: (context, index) {
          final meaning = meanings[index];
          return ListTile(
            title: Text(
              meaning,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue, // Set meaning color to blue
              ),
            ),
          );
        },
      ),
    );
  }
}