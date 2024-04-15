import 'dart:developer';

import 'package:bookly/Features/home/presentation/manager/cubit%20featured%20books/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListBlocBuilder extends StatelessWidget {
  const FeaturedBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedBooksListView(
            booksList: state.books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          log(state.toString() + 'here');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
