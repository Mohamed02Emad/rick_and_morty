class Mappers{


  static String mapEpisodesToString(List<String> episodes){
    String temp = "";
    episodes.forEach(
        (episode) {
          final episodeTrimmed = episode.length > 40 ? "${episode.substring(0 , 33)}....." :episode ;
          temp = "$temp$episodeTrimmed\n";
        }
    );

    return temp;
  }

}

