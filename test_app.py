from fastapi.testclient import TestClient
from app import app

client = TestClient(app)


def test_read_main():
    response = client.get("/metrics")
    assert response.status_code == 200
    assert "# HELP" in response.text
    assert "# TYPE" in response.text
    assert "apt_" in response.text
