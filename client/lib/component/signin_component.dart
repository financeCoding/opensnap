library signin_component;

import 'dart:html';
import 'package:angular/angular.dart';
import '../domain.dart';
import '../service/query_service.dart';
import '../service/auth_service.dart';

@NgComponent(
    selector: 'signin',
    templateUrl: 'packages/open_snap/component/signin_component.html',
    cssUrl: 'packages/open_snap/component/signin_component.css',
    applyAuthorStyles: true,
    publishAs: 'ctrl'
)
class SigninComponent {

  User user;
  QueryService _queryService;
  AuthService _eventService;
  Router _router;
  
  SigninComponent(this._queryService, this._eventService, this._router) {
    user = new User("", "");
  }
  
  authenticate() {
    _queryService.authenticateUser(user).then((bool status) {
      if(status) {
        _eventService.signin(user);
        _router.go('photo', new Map());
      }
      else window.alert('Error during login');
    });
  }
}