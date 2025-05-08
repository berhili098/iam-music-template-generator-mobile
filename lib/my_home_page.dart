import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iammusic/text_downloader_helper.dart';

class MyHomePage extends StatefulHookWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');

    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('I am Music Font Name generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text.value.isNotEmpty)
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        text.value,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'music'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                  hintText: 'Enter text to generate',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          text.value.isEmpty
              ? null
              : FloatingActionButton(
                onPressed: () async {
                  final returnedValue = await TextDownloaderHelper.downloadWhatIsGenerated(text.value, _globalKey);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(returnedValue.visibleText)));
                  }
                },
                tooltip: 'Download',
                child: const Icon(Icons.download_rounded),
              ),
    );
  }
}
