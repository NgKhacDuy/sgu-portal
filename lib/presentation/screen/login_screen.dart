import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/bloc/login/login_bloc.dart';
import 'package:sgu_portable/presentation/bloc/login/login_event.dart';
import 'package:sgu_portable/presentation/bloc/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl()..add(LoginInitEvent()),
      child: Scaffold(
        body: bodyWidget(context),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          return loginForm(context, state);
        } else if (state is LoginLoading) {
          return state.isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : loginForm(context, state);
        } else {
          return loginForm(context, state);
        }
      },
    );
  }

  Widget loginForm(BuildContext context, LoginState state) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FormBuilder(
          key: context.read<LoginBloc>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png',
                  height: MediaQuery.of(context).size.height * 0.35),
              FormBuilderTextField(
                name: 'username',
                controller: state is LoginInitial
                    ? state.usernameController
                    : context.read<LoginBloc>().usernameController,
                decoration: const InputDecoration(labelText: 'Mã số sinh viên'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "Vui lòng không để trống trường này",
                  ),
                ]),
              ),
              FormBuilderTextField(
                obscureText: true,
                controller: state is LoginInitial
                    ? state.passwordController
                    : context.read<LoginBloc>().passwordController,
                name: "password",
                decoration: const InputDecoration(labelText: 'Mật khẩu'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "Vui lòng không để trống trường này",
                  ),
                ]),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: state is CheckBoxState
                    ? state.value
                    : context.read<LoginBloc>().isRemember,
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(ChangeCheckbox(value: value ?? false)),
                title: const Text("Nhớ mật khẩu"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const Gap(20),
              Flex(direction: Axis.horizontal, children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(StartLogin(
                          username:
                              context.read<LoginBloc>().usernameController.text,
                          password: context
                              .read<LoginBloc>()
                              .passwordController
                              .text));
                    },
                    child: const Text('Login'),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
