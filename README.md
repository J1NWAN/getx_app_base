# getx_app_base

GetX를 사용한 앱 기본 틀 작성

## 프로젝트 구조

- app/
  - core/
    - theme/
      - theme_controller.dart
      - app_themes.dart
    - widgets/
      - buttons/
        - custom_button.dart
      - inputs/
        - custom_text_field.dart
      - common/
        - loading_indicator.dart
  - data/
    - services/
      - storage_service.dart
  - modules/
    - home/
      - controllers/
        - home_controller.dart
      - views/
        - home_view.dart
      - bindings/
        - home_binding.dart
    - theme_test/ (삭제예정)
      - views/
        - theme_test_page.dart
      - bindings/
        - theme_test_binding.dart
  - routes/
    - app_pages.dart
    - app_routes.dart
