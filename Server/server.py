from flask import Flask, flash, request, redirect, url_for, render_template,jsonify,send_file

app = Flask(__name__)

count = 0

@app.route('/',methods = ['GET','POST'])
def home():
	if(request.method == 'POST'):
		uuid = request.json['uuid'];
		print(uuid)
		global count
		count = count + 1
		return jsonify(result = count)
	else:
		return("<h2>Hello!!</h2>")

if __name__ == '__main__':
    app.run(debug=True)