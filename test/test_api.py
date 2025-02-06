import requests

def test_list_buckets():
    response = requests.get("http://localhost:8000")
    assert response.status_code == 200
    assert "Buckets" in response.json()["body"]