import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  Future<void> handleDynamicLinks() async {
    final PendingDynamicLinkData? data =
    await FirebaseDynamicLinks.instance.getInitialLink();

    _handleLinkData(data!);

    FirebaseDynamicLinks.instance.onLink;
  }

  void _handleLinkData(PendingDynamicLinkData data) {
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // Handle the deep link as needed, e.g., navigate to a specific screen
      print('Dynamic link received: $deepLink');
    }
  }

  Future<String> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://your_dynamic_link_prefix.page.link',
      link: Uri.parse('https://yourdomain.com/link'),
      androidParameters: AndroidParameters(
        packageName: 'com.your.package.name',
      ),
      // iosParameters: IosParameters(
      //   bundleId: 'your.bundle.identifier',
      // ),
    );

    final ShortDynamicLink shortDynamicLink =
    await parameters.androidParameters as ShortDynamicLink;

    return shortDynamicLink.shortUrl.toString();
  }
}

