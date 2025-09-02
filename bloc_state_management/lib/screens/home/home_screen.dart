import 'package:bloc_state_management/bloc/auth/auth_bloc.dart';
import 'package:bloc_state_management/bloc/auth/auth_event.dart';
import 'package:bloc_state_management/bloc/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
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
                title: Text('BLoc'),
                centerTitle: true
            ),
            body: BlocConsumer<AuthBloc, AuthState>(
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
                    else if (state is AuthFailureState)
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
                                content: Text('Loading...'),
                                // margin: EdgeInsets.all(20),
                                // behavior: SnackBarBehavior.floating,
                                // clipBehavior: Clip.none,
                                dismissDirection: DismissDirection.none
                            )
                        );
                    }
                    else if (state is AuthSuccessState)
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Login Successfully!'),
                                dismissDirection: DismissDirection.horizontal,
                                backgroundColor: CupertinoColors.activeGreen
                            )
                        );
                    }
                    if (state is AuthFailureState)
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(state.message),
                                showCloseIcon: true,
                                backgroundColor: CupertinoColors.destructiveRed
                            )
                        );
                    }
                }
            ),

            /*BlocListener<AuthBloc, AuthState>(
                listener: (context, state)
                {
                  if (state is AuthLoadingState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Loading...'))
                    );
                  } else if (state is AuthSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Successfully!'))
                    );
                  }
                    if (state is AuthFailureState)
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message))
                        );
                    }
                },
                child: Center(child: Text('data'))
            ),*/

      /*BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(state is AuthLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if(state is AuthSuccessState) {
              return Center(child: Text('Success'));
            } else if(state is AuthFailureState) {
              return Center(child: Text(state.message));
            }
            return SizedBox();
          },
      ),*/
            bottomSheet: ElevatedButton(
                onPressed: ()
                {
            /*BlocProvider.of<AuthBloc>(context, listen: false).add(
              LoginEvent("abcd@gmail.com", "12345")
            );*/
                    /// short form
                    context.read<AuthBloc>().add(
                        LoginEvent("test@gmail.com", "1234564")
                    );
                },
                child: Text('Start Login'))
        );
    }
}
