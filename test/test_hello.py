import io
import unittest.mock

from main import print_hi


class TestHello(unittest.TestCase):
    @unittest.mock.patch('sys.stdout', new_callable=io.StringIO)
    def test_given_when_hello_called_with_name_then_greetings_are_returned(self, mock_stdout):
        print_hi('Pramod')
        self.assertEqual('Hi, Pramod\n', mock_stdout.getvalue())
