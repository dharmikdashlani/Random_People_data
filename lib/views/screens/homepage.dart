import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:random_people/helpers/RandomHelper.dart';
import 'package:random_people/model/Random.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  TextStyle textStyle1 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.restart_alt_rounded),
          ),
          SizedBox(
            width: size.width * 0.025,
          )
        ],
        title: const Text(
          "Random People",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: RandomAPIHelper.randomAPIHelper.fetchRandomPerson(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              Random? data = snapshot.data;
              return (data != null)
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Neumorphic(
                              child: Container(
                                height: size.height * 0.18,
                                width: size.width * 0.34,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data.largeImage,
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Personal Details",
                                style: textStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Column(
                            children: [
                              Text(
                                "${data.title} ${data.firstname} ${data.lastname}",
                                style: textStyle1,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Street Name : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.streetname,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "City : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.city,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "State : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.state,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Country : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.country,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                              ),
                              Text(
                                data.email,
                                style: textStyle1,
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Date Of Birth : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.dobdate.toString().split("T")[0],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Age : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    "${data.age}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Phone Number : ",
                                    style: textStyle1,
                                  ),
                                  Text(
                                    data.phone,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("Data not found"),
                    );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
