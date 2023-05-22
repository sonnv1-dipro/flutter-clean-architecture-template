import 'package:clean_architecture_template/core/widget/base_page.dart';
import 'package:clean_architecture_template/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_template/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_template/features/post/domain/usercases/post_placeholder_example.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_bloc.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_event.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends BasePage {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PostBloc(
          usercase: PostPlaceholderExample(
            repository: PostRepositoryImpl(
              postRemoteDataSource: PostRemoteDataSourceImplement(),
            ),
          ),
        );
      },
      child: const _PostBody(),
    );
  }
}

class _PostBody extends StatelessWidget {
  const _PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Column(
        children: [
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state.status.isSuccess) {
                return Text(state.post.toString());
              } else if (state.status.isError) {
                return Text(state.message.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              final event = FetchedPostEvent(id: 1);
              context.read<PostBloc>().add(event);
            },
            child: const Text("Fetch Post"),
          )
        ],
      ),
    );
  }
}
