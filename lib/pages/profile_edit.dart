import 'package:nabeey/imports.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  var numberController = TextEditingController();
  var nameController = TextEditingController();
  var familyController = TextEditingController();
  var passwordController = TextEditingController();

  _doSignIn() {
    String num = numberController.text.toString().trim();
    String name = nameController.text.toString().trim();
    String family = familyController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (num.isEmpty && name.isEmpty && family.isEmpty && password.isEmpty) {
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ConfirmPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ism",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Familiya",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: familyController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Tel raqam",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: numberController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: "+998",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Parol",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            GestureDetector(
              onTap: () {
                _doSignIn();
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 156, 22, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    "Saqlash",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
