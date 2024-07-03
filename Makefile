clean:
	flutter clean
	flutter pub get

build_runner:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	flutter pub get

build_runner_watch:
	flutter pub get
	flutter pub run build_runner watch --delete-conflicting-outputs
	flutter pub get

locale:
	flutter pub run easy_localization:generate -S assets/lang -O lib/src/app/localization/lang/ -o codegen_loader.g.dart
	flutter pub get
	flutter pub run easy_localization:generate -S assets/lang  -f keys -O lib/src/app/localization/lang/ -o locale_keys.g.dart
	flutter pub get

router:
	make build_runner

config:
	flutter pub run environment_config:generate --config-extension=dev --config=main_environment_config.yaml

config\:main\:dev:
	flutter pub run environment_config:generate --config-extension=dev --config=main_environment_config.yaml

config\:main\:stage:
	flutter pub run environment_config:generate --config-extension=stage --config=main_environment_config.yaml

config\:main\:prod:
	flutter pub run environment_config:generate --config-extension=prod --config=main_environment_config.yaml

config\:dev:
	flutter pub run environment_config:generate --config=dev_environment_config.yaml

config\:stage:
	flutter pub run environment_config:generate --config=stage_environment_config.yaml

config\:prod:
	flutter pub run environment_config:generate --config=prod_environment_config.yaml

config\:all:
	make config:dev
	make config:stage
	make config:prod
	make config:main:dev

build\:release:
	flutter run --release