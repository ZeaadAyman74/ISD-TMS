class ProjectsQueryModel {
  int? page;
  int? perPage;
  String? orderBy;
  String? orderDirection;
  bool? isActive;
  String? searchText;

  ProjectsQueryModel(
      {this.page, this.perPage, this.orderBy, this.orderDirection,
        this.isActive, this.searchText});

  Map<String,dynamic>toJson(){
    return {
      'page':page,
      'itemsPerPage':perPage,
      'orderBy':orderBy,
      'orderDirection':orderDirection,
      'is_active':isActive,
      'search_text':searchText
    };
  }


}