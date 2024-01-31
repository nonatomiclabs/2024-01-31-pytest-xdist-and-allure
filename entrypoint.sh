#! /bin/bash
pytest -n auto --alluredir=allure-results $PYTEST_ADDITIONAL_ARGS tests/

echo "Return code: $?"

if [ -n "${ALLURE_REPORT}" ]
then
    allure serve -p 9090 allure-results
fi