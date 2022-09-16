import 'package:bouncing_widgets/flutter_bouncing_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Example());

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bouncing Widgets',
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Bouncing Widgets'),
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                BounceElevatedButton(
                  onPressed: () => showSnackBar(context, 'Clicked BounceElevatedButton'),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  child: const Text(
                    'Bounce Elevated Button',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BounceTextButton(
                  onPressed: () => showSnackBar(context, 'Clicked BounceTextButton'),
                  child: Text('Bounce Text Button'),
                ),
                const SizedBox(height: 20),
                BounceCircleAvatar(
                  onPressed: () => showSnackBar(context, 'Clicked BounceCircleAvatar'),
                  backgroundColor: Colors.red.withOpacity(0.1),
                  child: const Icon(Icons.add, color: Colors.red),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: BounceCard(
                    onPressed: () => showSnackBar(context, 'Clicked BounceCard'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            color: Colors.red.withOpacity(0.1),
                            child: const Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Text(
                                  "Bounce Card is a widget that can be used to create a card that can be clicked and bounce on click",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "List Example",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      return CustomBounceWidget(
                        onPressed: () => showSnackBar(context, 'Clicked Card $index'),
                        isScrollable: true,
                        child: Card(
                          color: Colors.redAccent,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Center(
                              child: Text("Item $index"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }


  Widget extensionExample(){
    return Container().bounce(
      onPressed: () {},
    );
  }

}
