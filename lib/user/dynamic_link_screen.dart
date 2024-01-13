import 'package:flutter/material.dart';
import 'package:makeupproject/provider/provider.dart';
import 'package:provider/provider.dart';
import '../models/dynamic_link.dart';
// import 'dynamic_link_service.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamicLinkProvider = Provider.of<MainProvider>(context);
    final dynamicLinkService = DynamicLinkService();
     dynamicLinkService.handleDynamicLinks();


    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Link Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dynamic Link:',
            ),
            Text(
              dynamicLinkProvider.dynamicLink ?? 'No link generated yet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final dynamicLink = await dynamicLinkService.createDynamicLink();
                dynamicLinkProvider.setDynamicLink(dynamicLink);
              },
              child: Text('Generate Dynamic Link'),
            ),
          ],
        ),
      ),
    );
  }
}
