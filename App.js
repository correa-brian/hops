import React, { Component } from 'react'
import { View, Text, NavigatorIOS } from 'react-native'
import {Header} from './components/Views'
import {LoginForm} from './components/Layout'
import {Signup} from './components/Layout'
import {Welcome} from './components/Layout'

class App extends Component {

  render(){
    const initialRoute = {
      component: Welcome,
      title: "Welcome"
    }
    return(
      <NavigatorIOS style={styles.container} initialRoute={initialRoute}/>
    )
  }
}

const styles = {
  container: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: '#FF0000'
  }
}

export default App
