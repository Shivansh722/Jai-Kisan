# from flask import Flask
# import pickle

# app = Flask(__name__)   

# model = pickle.load(open('model.pkl', 'rb'))
# user_input = [[81,12,56,231,0,0,2]]
# model.predict(user_input)

from flask import Flask, request, jsonify
import pickle

app = Flask(__name__)

with open('model.pkl', 'rb') as model_file:
    model = pickle.load(model_file)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json(force=True)
        user_input = data['user_input']

        result = model.predict([user_input])

        return jsonify({'prediction': result.tolist()})

    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
