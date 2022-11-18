import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_phase_one/Views/explorePage/exploreResults.dart';
import '../Widgets.dart';


class ExploreHome extends StatelessWidget {
  const ExploreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.explore_outlined,
                      color: Colors.grey.shade200, size: 100),
                  const SizedBox(height: 10,),
                  Text("Discover your new favourite people", style: GoogleFonts.poppins(fontSize: 20),textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  BigButton(
                      text: "Auto-Match", fun: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ExploreResults()));
                  }, size: const Size(200, 50), fontSize: 18,),
                  const SizedBox(
                    height: 5,
                  ),
                  BigButton(
                    text: "Filtered Search",
                    fun: () {},
                    size: const Size(200, 50),
                    fontSize: 18,
                    color: Colors.amber,
                    textColor: Colors.indigo.shade800,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
