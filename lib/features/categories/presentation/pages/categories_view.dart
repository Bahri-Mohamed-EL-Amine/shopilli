import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/core/widgets/loadin_widget.dart';
import 'package:shopilli/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:shopilli/features/navigation/bloc/navigation_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/products/products_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const LoadingWidget();
          } else if (state is CategoriesLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: state.categories.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ProductsBloc>(context).add(
                      ProductsCategoryEvent(
                          category: state.categories[index].name),
                    );
                    BlocProvider.of<NavigationBloc>(context)
                        .add(const NavigationTriggeredEvent(index: 0));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 30,
                    color: Colors.grey[300],
                    child: Text(
                      state.categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
