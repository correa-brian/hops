import React, {Component} from 'react'
import {View, Text} from 'react-native'
import {Button} from '../../components/Views'
import Signup from './Signup'
import LoginForm from './LoginForm'

class Welcome extends Component {

  constructor(props) {
    super(props)
    this.showSignup = this.showSignup.bind(this)
    this.showLogin = this.showLogin.bind(this)

  }

  showLogin(event){
    this.props.navigator.push({
      title: "Login",
      component: LoginForm
    })
  }

    showSignup(event){
    this.props.navigator.push({
    title: "SignUp",
      component: Signup
    })

  }

  render(){
  return(
    <View style={{marginTop: 60, height: 600}}>
    <Text>Welcome to Hops</Text>
    <Text>Signup or Login Today</Text>
    <Button onPress={this.showSignup}>Signup</Button>
    <Button onPress={this.showLogin}>Login</Button>
    </View>
    )
  }
}

const styles ={
  button: {
    height: 20,
    width: 200
  }
}

export default Welcome
