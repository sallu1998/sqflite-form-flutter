import 'package:demo/models/c_model.dart';
import 'package:demo/repository/repository.dart';

class CategoryService{

  late Repository _repository;

  CategoryService(){
    _repository = Repository();
  }

  saveCategory(Catagory catagory) async{
    return await _repository.insertData('emp', catagory.categoryMap());
    // print(catagory.name);
    // print(catagory.email);
    // print(catagory.number);
    // print(catagory.company);
  }
}