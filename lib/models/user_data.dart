import 'package:loan_xtimate/gen/assets.gen.dart';

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String imagePath;
  final String title;
  final int nmls;
  final String phone;
  final String streetNumberAndName;
  final String suit;
  final String city;
  final String state;
  final int zipCode;
  final String customSignatureImagePath;

  UserData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.imagePath,
      required this.title,
      required this.nmls,
      required this.phone,
      required this.streetNumberAndName,
      required this.suit,
      required this.city,
      required this.state,
      required this.zipCode,
      required this.customSignatureImagePath});

  String getFormattedAddres() {
    return "$streetNumberAndName\n$suit\n$city, $state $zipCode";
  }
}

final testUserData = UserData(
    id: "fnjngh",
    firstName: "Clark",
    lastName: "Griswoid",
    email: "cgriswold@abcmortgage.com",
    password: "something",
    imagePath: Assets.images.userImage.path,
    // imagePath: "assets/images/user_image.jpg",
    title: "Senior Loan Officer",
    streetNumberAndName: "211 Olive St",
    suit: "Suite 201",
    city: "Media",
    state: "PA",
    zipCode: 19063,
    nmls: 144586,
    phone: "(610) 389-5559",
    customSignatureImagePath: Assets.images.signatureImage.path
    // customSignatureImagePath: "assets/images/signature_image.png",
    );

enum State {
  alabama,
  alaska,
  arizona,
  arkansas,
  california,
  colorado,
  connecticut,
  delaware,
  florida,
  georgia,
  hawaii,
  idaho,
  illinois,
  indiana,
  iowa,
  kansas,
  kentucky,
  louisiana,
  maine,
  maryland,
  massachusetts,
  michigan,
  minnesota,
  mississippi,
  missouri,
  montana,
  nebraska,
  nevada,
  newHampshire,
  newJersey,
  newMexico,
  newYork,
  northCarolina,
  northDakota,
  ohio,
  oklahoma,
  oregon,
  pennsylvania,
  rhodeIsland,
  southCarolina,
  southDakota,
  tennessee,
  texas,
  utah,
  vermont,
  virginia,
  washington,
  westVirginia,
  wisconsin,
  wyoming,
}

Map<State, String> stateAbbreviations = {
  State.alabama: 'AL',
  State.alaska: 'AK',
  State.arizona: 'AZ',
  State.arkansas: 'AR',
  State.california: 'CA',
  State.colorado: 'CO',
  State.connecticut: 'CT',
  State.delaware: 'DE',
  State.florida: 'FL',
  State.georgia: 'GA',
  State.hawaii: 'HI',
  State.idaho: 'ID',
  State.illinois: 'IL',
  State.indiana: 'IN',
  State.iowa: 'IA',
  State.kansas: 'KS',
  State.kentucky: 'KY',
  State.louisiana: 'LA',
  State.maine: 'ME',
  State.maryland: 'MD',
  State.massachusetts: 'MA',
  State.michigan: 'MI',
  State.minnesota: 'MN',
  State.mississippi: 'MS',
  State.missouri: 'MO',
  State.montana: 'MT',
  State.nebraska: 'NE',
  State.nevada: 'NV',
  State.newHampshire: 'NH',
  State.newJersey: 'NJ',
  State.newMexico: 'NM',
  State.newYork: 'NY',
  State.northCarolina: 'NC',
  State.northDakota: 'ND',
  State.ohio: 'OH',
  State.oklahoma: 'OK',
  State.oregon: 'OR',
  State.pennsylvania: 'PA',
  State.rhodeIsland: 'RI',
  State.southCarolina: 'SC',
  State.southDakota: 'SD',
  State.tennessee: 'TN',
  State.texas: 'TX',
  State.utah: 'UT',
  State.vermont: 'VT',
  State.virginia: 'VA',
  State.washington: 'WA',
  State.westVirginia: 'WV',
  State.wisconsin: 'WI',
  State.wyoming: 'WY',
};
