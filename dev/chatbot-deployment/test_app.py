import pytest
from app import app as flask_app
import json

# Fixture to create test client
@pytest.fixture
def client():
    flask_app.config['TESTING'] = True
    with flask_app.test_client() as client:
        yield client

def test_index_get(client):
    """Test GET request to root endpoint renders HTML page"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"<html" in response.data or b"<!DOCTYPE html" in response.data

def test_post_valid_message(client, monkeypatch):
    """Test POST request with valid message"""

    # Mocking get_response to return a dummy reply
    def mock_get_response(message):
        return f"Mocked reply to: {message}"

    # Patch the get_response function in the 'chat' module
    monkeypatch.setattr("chat.get_response", mock_get_response)

    # Send a JSON message
    response = client.post(
        '/',
        data=json.dumps({"message": "Hello"}),
        content_type='application/json'
    )

    assert response.status_code == 200
    data = response.get_json()
    assert "answer" in data
    assert data["answer"] == "Mocked reply to: Hello"

def test_post_missing_message(client):
    """Test POST request with missing 'message' field"""
    response = client.post(
        '/',
        data=json.dumps({}),  # Missing 'message'
        content_type='application/json'
    )
    assert response.status_code == 200  # You may want to make this a 400
    data = response.get_json()
    assert "answer" in data  # May want to return an error instead