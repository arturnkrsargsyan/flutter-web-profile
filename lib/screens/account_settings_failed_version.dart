import 'package:flutter/material.dart';
import 'package:loan_xtimate/screens/tabs/user_profile.dart';

//Account Settings using DefaultTabController (failed version)
class AccountSettingsScreenFailed extends StatelessWidget {
  const AccountSettingsScreenFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Account Settings'),
            bottom: AppBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  height: 48,
                  child: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('My Profile')),
                      Tab(text: 'Credentials'),
                      Tab(text: 'Account Plans'),
                      Tab(text: 'Billing'),
                      Tab(text: 'Integrations'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight - 48,
            child: const TabBarView(
              children: [
                UserProfile(),
                Center(child: Text('Credentials')),
                Center(child: Text('Account Plans')),
                Center(child: Text('Billing')),
                Center(child: Text('Integrations')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
