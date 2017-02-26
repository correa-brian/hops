import React, {Component} from 'React'
import {View, Text, TextInput, Dimensions} from 'react-native'
import{Button} from  '../../components/Views'
import{Cards, CardSection} from '../../components/Containers'

class Signup extends Component {
  constructor(props) {
    super(props)
    this.signupUser = this.signupUser.bind(this)
    this.state = {
      firstname: '',
      lastname: '',
      username: '',
      password: '',
      email:'',
      age:'',
      user: {}
    }
  }

  signupUser() {

    let {firstname, lastname, username, password, email, age} = this.state

    let url = 'http://localhost:3000/api/user'
    fetch(url, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },

      body: JSON.stringify({

        firstname: firstname,
        lastname: lastname,
        username: username,
        password: password,
        email: email,
        age: age

      })
    })

    .then((response) => response.json())
    .then((json) => {
      console.log("Response: "+JSON.stringify(json))
        if (json.confirmation == "Success") {
          this.setState({user: json.currentUser})

          this.props.navigator.push({
            title: 'Welcome Home',
            component: Home
          })
        }
        if(json.confirmation == "Fail"){
          console.log("Fail "+JSON.stringify(response))
          return
        }
    })
    .catch((error) => {
      console.log("Error: "+JSON.stringify(error))
    })
    return
  }

render(){

  let height = Dimensions.get('window').height
  let width = Dimensions.get('window').width

  var {firstnameText, lastnameText, usernameText, emailText, passwordText, ageText} = this.state
  let {firstname, lastname, email, username, age, password} = this.state

return(
  <View style={styles.signupView}>
  <Cards style={styles.cardStyle}>
  <Text>What is your first name</Text>
  <CardSection>
  <TextInput
    onChangeText={firstname => this.setState({firstname})}
    style={styles.inputStyle} />
  </CardSection>
  <Text>What is your last name</Text>
  <CardSection>
  <TextInput
    onChangeText={lastname => this.setState({lastname})}
    style={styles.inputStyle} />
  </CardSection>
  <Text>Pick a cool username</Text>
  <CardSection>
  <TextInput
    onChangeText={username => this.setState({username})}
    style={styles.inputStyle} />
  </CardSection>
    <Text>We need your email</Text>
    <CardSection>
    <TextInput
      onChangeText={email => this.setState({email})}
      style={styles.inputStyle} />
    </CardSection>
    <Text>Now for a password</Text>
    <CardSection>
    <TextInput
      onChangeText={password => this.setState({password})}
      style={styles.inputStyle} />
    </CardSection>
    <Text>Lastly we need your age</Text>
    <CardSection>
    <TextInput
      onChangeText={age => this.setState({age})}
      style={styles.inputStyle} />
    </CardSection>
    <CardSection>
      <Button onPress={this.loginUser}> 'Login' </Button>
    </CardSection>
  </Cards>
  </View>
    )
  }

}

const styles = {
  signupView: {
    backgroundColor: '#FF0000',
    height: 600,
    marginTop: 60

  },
  cardStyle: {
    marginTop: 300
  },
  inputStyle: {
    height: 20,
    width: 300
  }
}

export default Signup
