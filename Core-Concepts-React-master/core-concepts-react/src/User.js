import React from 'react';

const User = (props) => 
{
    const familiar=props.familiar;
    let greetings;
    if(familiar){
        greetings=<p>Welcome, my friend</p>
    }
    else{
        greetings=<h2>Who the hell are you?</h2>
    }
    
    return (
        <div>
            <div>
            <h2>Greetings</h2>
                {greetings}
            </div>
            <div>
                <h2>Food</h2>
                {
                   
                    //javascript turnery operator. conditional operator er moto kaaj kore
                    familiar //variable
                    ?<p>I will buy food for you</p>//if
                    :<p>Let's buy food by your own money</p>//else
                }
               
            </div>
            <div>
                <h2>Connection</h2>
                {
                    familiar && <p>Let's join my facebook</p>//if true it will show otherwise no

                }
               
            </div>
                

            
            
        </div>
    );
};

export default User;