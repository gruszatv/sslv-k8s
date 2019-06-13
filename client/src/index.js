

import React from "react";
import ReactDOM from "react-dom";


fetch('/api/get')
    .then(
        function(response) {
            if (response.status !== 200) {
                console.log('Looks like there was a problem. Status Code: ' +
                    response.status);
                return;
            }

           return response
        }
    )
    .then((data)=>{
        console.log(data)
    })
    .catch(function(err) {
        console.log('Fetch Error :-S', err);
    });

ReactDOM.render(
    <h1>Hello, world!</h1>,
    document.getElementById('root')
);
