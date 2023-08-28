import unittest
from main import app

class TestFlaskApp(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_home_route(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Login', response.data)

    def test_acoustic_route(self):
        response = self.app.get('/acoustic')
        self.assertEqual(response.status_code, 302)
        self.assertIn(b'Redirecting...', response.data)

    def test_electric_route(self):
        response = self.app.get('/electric')
        self.assertEqual(response.status_code, 302)
        self.assertIn(b'Redirecting...', response.data)

    def test_acoustic_route(self):
        response = self.app.get('/bass')
        self.assertEqual(response.status_code, 302)
        self.assertIn(b'Redirecting...', response.data)

    def test_electric_route(self):
        response = self.app.get('/other')
        self.assertEqual(response.status_code, 302)
        self.assertIn(b'Redirecting...', response.data)    

if __name__ == '__main__':
    unittest.main()