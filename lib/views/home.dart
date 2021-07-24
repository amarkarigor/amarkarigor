import 'package:flutter/material.dart';
import 'package:myapp/config/display.dart';
import 'package:myapp/widget/horizontal_list_item.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];
  @override
  Widget build(BuildContext context) {
    print(
        'MediaQuery.of(context).size.width ${MediaQuery.of(context).size.width}');
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icons/nav.png'),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/name.png',
                      height: 20,
                    ),
                  ],
                ),
                Image.asset('assets/icons/bell.png'),
              ],
            ),
          ),
          body: Container(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        autofocus: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'What are you looking for?'),
                      ),
                      suggestionsCallback: (pattern) async {
                        return BusinessService.getSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          leading: Icon(Icons.add_box),
                          title: Text(suggestion.toString()),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        print(suggestion);
                      },
                    ),
                  ),
                ),
                Container(
                    height: getSliderHeight(MediaQuery.of(context).size.height),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Swiper.children(
                          autoplay: false,
                          pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white30,
                                  activeColor: Colors.white,
                                  size: 10.0,
                                  activeSize: 20.0)),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://scontent.fzyl1-1.fna.fbcdn.net/v/t1.6435-9/49204443_2030281530366899_3867512355197812736_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=973b4a&_nc_ohc=g06scVxZLTcAX8sA1E3&_nc_ht=scontent.fzyl1-1.fna&oh=d7515396148c7e919e213f63bf23eee5&oe=611F5A37"),
                                      ),
                                    ),
                                  )),
                            ),
                          ]),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Service You Need',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        getHorizontalListItem(),
                        getHorizontalListItem(),
                        getHorizontalListItem(),
                        getHorizontalListItem(),
                        getHorizontalListItem(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select Service You Need',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class BusinessService {
  static List<String> getSuggestions(String query) {
    List<String> matches = ['Cleaner', 'Plumber', 'Electrician'];

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));

    return matches;
  }
}
