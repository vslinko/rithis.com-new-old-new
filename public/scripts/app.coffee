rithis = angular.module "rithis", []


rithis.config ($locationProvider) ->
  $locationProvider.hashPrefix "!"


rithis.config ($routeProvider) ->
  $routeProvider.when "/",
    templateUrl: "/views/index.html"

  $routeProvider.when "/about",
    templateUrl: "/views/about.html"

  $routeProvider.when "/portfolio",
    templateUrl: "/views/portfolio.html"

  $routeProvider.when "/jobs",
    templateUrl: "/views/jobs.html"

  $routeProvider.when "/vacancy/developer",
    templateUrl: "/views/vacancy/developer.html"

  $routeProvider.when "/portfolio/happynewgift-ru",
    templateUrl: "/views/portfolio/happynewgift.html"

  $routeProvider.otherwise redirectTo: "/"


rithis.directive "portfolio", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    scope.portfolio = [
      {name: "happynewgift.ru", logo: "/images/portfolio/happynewgift.ru/logo.png"},
      {name: "aviator.pegast.su", logo: "/images/portfolio/aviator.pegast.su/logo.png"},
      {name: "skveez.com", logo: "/images/portfolio/skveez.com/logo.png"}
    ]

    scope.getProjectUrl = (project) ->
      "#!/portfolio/#{project.name.replace ".", "-"}"

rithis.run ($rootScope) ->
  $rootScope.expertises = [
      title: "Серверная<br/>разработка"
      list: ["JavaScript", "Node.js", "PHP 5.3+", "Symfony2", "Doctrine ORM/ODM/DBAL", "Silex", "Twig", "Composer", "PHPUnit", "Git", "nanoc"]
    ,
      title: "Клиентская<br/>разработка"
      list: ["jQuery", "AngularJS", "Backbone.js", "Socket.IO", "Yeoman", "SASS", "Compass", "LESS", "Bootstrap", "HTML5", "CSS3", "Адаптивный веб-дизайн"]
    ,
      title: "Системное<br/>администрирование"
      list: ["NGINX", "Ubuntu", "KVM", "AWS", "php-fpm"]
    ,
      title: "Базы данных"
      list: ["MySQL", "MongoDB", "Memcached", "Redis"]
    ,
      title: "Continuous<br/>Integration и<br/>Deployment"
      list: ["Travis CI", "capifony", "Phing"]
    ,
      title: "Управление<br/>проектами"
      list: ["Basecamp", "Kayako Fusion", "GitHub"]
    ,
      title: "Сертификации"
      list: ["Zend Certified Engineer PHP 5.3"]
  ]

