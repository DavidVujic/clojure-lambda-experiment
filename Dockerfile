FROM public.ecr.aws/lambda/provided:al2

COPY runtime/bootstrap ${LAMBDA_RUNTIME_DIR}/bootstrap

WORKDIR ${LAMBDA_TASK_ROOT}
COPY target/lambda-experiment lambda-experiment

CMD [ "my-handler" ]
