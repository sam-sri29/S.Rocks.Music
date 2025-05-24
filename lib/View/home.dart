import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/View%20Model/viewmodel.dart';
import 'package:s_rocks_music/View/detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Viewmodel>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 0, 0),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.43,
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 104, 4, 32),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 228, 32, 87),
                  Color.fromARGB(255, 67, 2, 21),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search “Punjabi Lyrics”',
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            suffixIcon: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            hintStyle: const TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 30),
                      Image.asset(
                        "assets/icons/user.png",
                        height: 45,
                        width: 45,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Claim your",
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Free Demo",
                      style: GoogleFonts.playball(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "for custom Music Production",
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Book Now",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Hire hand-picked Pros for popular music services',
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          viewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: ListView.builder(
                  itemCount: viewModel.services.length,
                  itemBuilder: (context, index) {
                    final service = viewModel.services[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/icons/music4.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/${service.icon}',
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            service.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            service.description,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) =>
                                        Detail(name: service.title),
                              ),
                            );
                          },
                        ),
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
