# from flask import Flask
# import pickle

# app = Flask(__name__)   

# model = pickle.load(open('model.pkl', 'rb'))
# user_input = [[81,12,56,231,0,0,2]]
# model.predict(user_input)
'''
chaiye kya

'''

from flask import Flask, request, jsonify
import pickle
from commodity_mapping import commodity_map
from district_mapping import district_mapping
from market_mapping import market_mapping
from state_mapping import state_mapping

app = Flask(__name__)

with open('model3.pkl', 'rb') as model_file:
    model = pickle.load(model_file)
    

@app.route('/')
def home():
    return jsonify({'message': 'Hello World'})


@app.route('/predict',methods=['post'])
def get():
    try:
        data = request.get_json(force=True)
        
        commodity_value = commodity_map.get(data['commodity'], -1)
        if commodity_value == -1:
            return jsonify({'error': 'Commodity not found in mapping dictionary'})
        
        district_value = district_mapping.get(data['district'], -1)
        if district_value == -1:
            return jsonify({'error': 'District not found in mapping dictionary'})
        
        market_value = market_mapping.get(data['market'], -1)
        if market_value == -1:
            return jsonify({'error': 'Market not found in mapping dictionary'})
        
        state_value = state_mapping.get(data['state'], -1)
        if state_value == -1:
            return jsonify({'error': 'State not found in mapping dictionary'})
        
        user_input = [
            commodity_value,
            state_value,
            district_value,
            market_value,
            # data['month_Column']=0,
            # data['season_names']=0,
            data['day']
        ]
        print(user_input)
        result = model.predict([[user_input[0],user_input[1],user_input[2],user_input[3],0,0,user_input[4]]])
        return jsonify({'message': result.tolist()})
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
