import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'mensa_api', pubAuthor: 'Aaron Schlitt'),
    inputSpecFile: './swagger.json',
    generatorName: Generator.dart,
    outputDirectory: 'api')
class OpenAPI extends OpenapiGeneratorConfig {}