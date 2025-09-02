import 'package:cubit/cubit/auth/auth_cubit.dart';
import 'package:cubit/cubit/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget
{
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Cubit'),
                centerTitle: true
            ),
            body: BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state)
                {
                    if (state is AuthLoadingState) 
                    {
                        return Center(child: CircularProgressIndicator());
                    }
                    else if (state is AuthSuccessState) 
                    {
                        return Center(child: Text('Success'));
                    }
                    else if (state is AuthErrorState) 
                    {
                        return Center(child: Text(state.message));
                    }
                    return SizedBox();
                },
                listener: (context, state)
                {
                    if (state is AuthLoadingState) 
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Loading..."),
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 2)
                            )
                        );
                    }
                    else if (state is AuthSuccessState) 
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Login Successfully!'),
                                // behavior: SnackBarBehavior.floating,
                                dismissDirection: DismissDirection.horizontal,
                                backgroundColor: Colors.green
                            )
                        );
                    }
                    else if (state is AuthErrorState) 
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(state.message),
                                backgroundColor: Colors.redAccent
                            )
                        );
                    }
                }
            ),
            bottomSheet: ElevatedButton(
                onPressed: ()
                {
                    context.read<AuthCubit>().login("test@gmail.com", "123456");
                },
                child: Text('Login')
            )
        );
    }
}
