import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/core/components/message/message_bar.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/core.dart';
import 'package:madang_app/data/model/request/register_request_model.dart';
import 'package:madang_app/features/auth/model/gender_value_model.dart';

import '../bloc/register/register_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  String dropdownGenderValue = GenderValueModel.listGender.first;
  bool isObsecure = true;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text('Sign Up', style: AppText.text20),
        elevation: 4,
        leading: BackButton(
          onPressed: () => Navigation.pop(),
          color: AppColors.blackColor,
        ),
      );
    }

    Widget nameField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppText.text14.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DefaultField(
            controller: _usernameController,
            hintText: 'Name',
            inputType: TextInputType.name,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please Input our Name';
              }
              return null;
            },
          ),
        ],
      );
    }

    Widget genderField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: AppText.text14.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          StatefulBuilder(
            builder: (context, setState) {
              return DropdownMenu<String>(
                initialSelection: dropdownGenderValue,
                width: context.deviceWidth,
                onSelected: (String? value) {
                  setState(() {
                    dropdownGenderValue = value!;
                  });
                },
                dropdownMenuEntries: GenderValueModel.listGender
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              );
            },
          )
        ],
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
            hintText: 'Email',
            inputType: TextInputType.emailAddress,
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
      return BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) {
              MessageBar.messageBar(context, message);
            },
            success: (data) {
              Navigation.pushReplacement(RoutesName.login);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => DefaultButton(
              title: 'Sign Up Now',
              borderRadius: 5,
              height: 50,
              titleColor: AppColors.whiteColor,
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                } else {
                  if (_emailController.text.isNotEmpty &&
                      _passController.text.isNotEmpty) {
                    final registerRequest = RegisterRequestModel(
                      name: _usernameController.text.trim(),
                      email: _emailController.text.trim(),
                      gender: dropdownGenderValue,
                      password: _passController.text.trim(),
                    );

                    context
                        .read<RegisterBloc>()
                        .add(RegisterEvent.register(registerRequest));
                  }
                }
              },
            ),
          );
        },
      );
    }

    Widget readyAccount() {
      return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: 'Already have an account? ',
          style: AppText.text14.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'Login',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigation.pushName(RoutesName.login);
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
          child: ListView(
            children: [
              nameField(),
              const SizedBox(height: 15),
              genderField(),
              const SizedBox(height: 15),
              emailField(),
              const SizedBox(height: 15),
              passField(),
              const SizedBox(height: 30),
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
