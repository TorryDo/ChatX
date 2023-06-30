import 'package:chatx/base/utils/flutter/nav_ext.dart';
import 'package:chatx/routes.dart';
import 'package:chatx/src/presentation//login/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is SuccessState){
          context.popAndPushNamed(Routes.SIGNUP_SCREEN);
        }
      },
      builder: (context, state) {
        return _content(context);
      },
    );
  }

  Widget _content(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              width: double.infinity,
              child: const Column(
                children: [
                  Padding(padding: EdgeInsets.only()),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Sign In",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consetetur",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "sadipscing elitr, sed diam nonumy eirmod",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "tempor invidunt ut labore et dolore",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _emailFiled(context),
          ],
        ),
      ),
    );
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _emailFiled(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.only(top: 275, left: 5, right: 5),
      child: Column(children: [
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff85B634),
              size: 20,
            ),
            focusColor: Color(0xff757575),
            hintText: "Email Address",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<AuthBloc>().add(AuthUsernameChanged(value));
          },
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              FontAwesomeIcons.eyeSlash,
              color: Color(0xff85B634),
              size: 20,
            ),
            hintText: "Password",
            fillColor: Color(0xff757575),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Forgot Password?"),
          ],
        ),
        const SizedBox(height: 70),
        _loginButton(context),
        const SizedBox(height: 120),
        _signup(),
      ]),
    );
  }

  Widget _signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        InkWell(
          child: const Text("Sign Up"),
          onTap: () {},
        )
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ignore: deprecated_member_use
        TextButton(
          onPressed: () => {
            context.read<AuthBloc>().add(LoginSubmitted(
                  _usernameController.text,
                  _passwordController.text,
                ))
          },
          child: const Text("Sign In"),
        )
      ],
    );
  }
}
