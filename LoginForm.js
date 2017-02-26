import React, {Component} from 'react'
import {View, TextInput, Dimensions} from 'react-native'
import{Button} from  '../../components/Views'
import{Cards, CardSection} from '../../components/Containers'
import Home from './Home'



class LoginForm extends Component {
  constructor(props) {
    super(props)
    this.loginUser = this.loginUser.bind(this)
    this.state = {
      username: '',
      password: '',
      user: {}
    }
  }

  loginUser() {

    let {username, password} = this.state
    console.log("loginUser: "+JSON.stringify(username))
    console.log("loginUser: "+JSON.stringify(password))


    let url = 'http://localhost:3000/user/login'
    fetch(url, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: username,
        password: password
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

  render() {

    let height = Dimensions.get('window').height
    let width = Dimensions.get('window').width

    var {usernameText, passwordText} = this.state
      let {username, password} = this.state


    //const { inputStyle} = styles
    return(
      <View style={styles.loginView}>
      <Cards style={styles.cardStyle}>
        <CardSection>
        <TextInput
          onChangeText={username => this.setState({username})}
          style={styles.inputStyle} />
        </CardSection>
        <CardSection>
        <TextInput
          onChangeText={password => this.setState({password})}
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
  loginView: {
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

export default LoginForm
