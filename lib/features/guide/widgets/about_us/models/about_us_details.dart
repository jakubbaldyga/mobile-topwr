import '../../../../../api_base/directus_assets_url.dart';
import '../../../../../utils/url_icons.dart';
import '../../../../../utils/where_non_null_iterable.dart';
import '../repository/about_us_repository.dart';
import 'member_data.dart';

class AboutUsDetails {
  final AboutUs? aboutUs;
  final List<AboutUsTeam>? aboutUsTeam;

  AboutUsDetails({this.aboutUs, this.aboutUsTeam});

  List<MemberData> getMemberData() {
    return aboutUsTeam.whereNonNull.map((e) {
      return MemberData(
        name: e.name,
        imageUrl: e.photo?.filename_disk?.directusUrl,
        socialLinks:
            e.socialLinks.whereNonNull.map((e) => e.url).toList(),
        subtitle: e.subtitle,
      );
    }).toList();
  }

  List<UrlIconsUtilModel> getSocialIcons() {
    return aboutUs?.solvroSocialLinks.whereNonNull
            .map(
              (e) => UrlIconsUtilModel(url: e.url),
            )
            .toList() ??
        [];
  }
}
