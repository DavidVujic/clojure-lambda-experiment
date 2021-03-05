FROM public.ecr.aws/lambda/java:11

COPY target/graal-lambda-experiment.jar ${LAMBDA_TASK_ROOT}

CMD ["app.handler::handleRequest"]
