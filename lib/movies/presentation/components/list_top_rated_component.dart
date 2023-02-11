import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';
import 'package:shimmer/shimmer.dart';


class ListTopRatedComponent extends StatelessWidget {
  const ListTopRatedComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous , current) =>previous.topRatedState != current.topRatedState,
        builder: (context ,state){
          switch (state.topRatedState){
            case RequestState.loading:
              return  const SizedBox(
                  child: Center(child: CircularProgressIndicator(color: Colors.red,)));
            case RequestState.loaded:
              return FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          height: 170,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: 120.0,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiConstance.imageUrl(movie
                                        .backdropPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[850]!,
                                          highlightColor: Colors.grey[800]!,
                                          child: Container(
                                            height: 170.0,
                                            width: 120.0,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(
                                                  8.0),
                                            ),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,

                                      ),
                                      const SizedBox(height: 10,),
                                      Row(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.0,
                                            horizontal: 8.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                                4.0),
                                          ),
                                          child: Text(
                                            movie.releaseDate.split('-')[0],
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16.0),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        const Text(
                                          ('3.5'),
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ],),
                                      const SizedBox(height: 20,),
                                      Text(
                                        movie.overView,
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,

                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                      );
                    }
                ),
              );
            case RequestState.error:
              return SizedBox(
                  height: 170,
                  child: Center(
                    child: Text(state.topRatedMessage),
                  )
              );
          }
        }
    );
  }
}
