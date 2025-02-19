import 'package:flutter/material.dart';
import 'package:http/http.dart';

class authProvider extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(String email,String password)async{

    setLoading(true);

    try{
      Response respose = await post(Uri.parse('https://reqres.in/api/login'),
        body: {
        'email' : email,
          'password' : password
        }
      );

      if(respose.statusCode == 200){
        print('successfull');
        setLoading(false);
      }else{
        print('failed');
        setLoading(false);
      }
    }catch(e){
      print(e.toString());
      setLoading(false);
    }
  }
}