import unittest
from unittest.mock import patch

from app import create_app


class AppTests(unittest.TestCase):
    def setUp(self):
        self.client = create_app().test_client()

    def test_health(self):
        response = self.client.get("/health")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_json()["status"], "ok")

    def test_message_uses_environment(self):
        with patch.dict("os.environ", {"MESSAGE": "Versão de teste"}):
            response = self.client.get("/")
        self.assertEqual(response.get_json()["message"], "Versão de teste")


if __name__ == "__main__":
    unittest.main()
