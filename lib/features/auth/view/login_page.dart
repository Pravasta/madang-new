import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/components/message/message_bar.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_local_datasources.dart';
import 'package:madang_app/data/model/request/login_request_model.dart';
import 'package:madang_app/features/auth/bloc/login/login_bloc.dart';
import '../../../core/common/common.dart';
import '../../../core/constant/constant.dart';
import '../../../core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passController;
  bool isObsecure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text('Login', style: AppText.text20),
        elevation: 4,
        leading: BackButton(
          onPressed: () => Navigation.pop(),
          color: AppColors.blackColor,
        ),
      );
    }

    Widget emailField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: AppText.text14.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DefaultField(
            controller: _emailController,
            hintText: 'email',
            inputType: TextInputType.text,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please Input our Email';
              } else if (!value.contains('@')) {
                return 'Email not valid';
              }
              return null;
            },
          ),
        ],
      );
    }

    Widget passField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: AppText.text14.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          StatefulBuilder(
            builder: (context, setState) {
              return DefaultField(
                controller: _passController,
                hintText: 'Password',
                inputType: TextInputType.text,
                isObscure: isObsecure,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  icon: Icon(isObsecure
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Input our Password';
                  } else if (value.length < 8) {
                    return 'Password need 8 characters';
                  }
                  return null;
                },
              );
            },
          )
        ],
      );
    }

    Widget buttonSubmit() {
      return BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => DefaultButton(
              title: 'Login',
              borderRadius: 5,
              height: 50,
              titleColor: AppColors.whiteColor,
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                } else {
                  if (_emailController.text.isNotEmpty &&
                      _passController.text.isNotEmpty) {
                    final loginRequest = LoginRequestModel(
                      email: _emailController.text.trim(),
                      password: _passController.text.trim(),
                    );

                    context
                        .read<LoginBloc>()
                        .add(LoginEvent.login(loginRequest));
                  }
                }
              },
            ),
          );
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (data) async {
              await AuthLocalDatasourceImpl().saveAuthData(data);
              Navigation.pushReplacement(RoutesName.mainPage);
            },
            error: (error) => MessageBar.messageBar(context, error),
          );
        },
      );
    }

    Widget readyAccount() {
      return Text.rich(
        TextSpan(
          text: 'Doesn\'t have an account? ',
          style: AppText.text14.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'Sign up',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigation.pushName(RoutesName.signUp);
                },
              style: AppText.text14.copyWith(
                color: AppColors.primary50Color,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              emailField(),
              const SizedBox(height: 15),
              passField(),
              const SizedBox(height: 40),
              buttonSubmit(),
              const SizedBox(height: 15),
              readyAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
