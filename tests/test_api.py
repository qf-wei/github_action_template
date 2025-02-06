import requests

BASE_URL = "http://localhost:9010/2015-03-31/functions/function/invocations"

def test_list_buckets():
    response = requests.post(BASE_URL, json={})
    print(response)
    assert response.status_code == 200
    assert response.json()["body"]["success"] == True