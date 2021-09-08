from flask import Flask, request

app = Flask(__name__)


@app.route('/forum_post', methods=['POST'])
def forum_post():
    print("received /forum_post POST request:")
    print(request.get_json())
    return 'Accepted\n'


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5678, debug=True)
