import React from 'react'
import { View } from 'react-native'

const CardSection = ({ children }) => {
  const { containerStyle } = styles
  return (
    <View style={containerStyle}>
      {children}
    </View>
  )
}

const styles = {
  containerStyle: {
    borderBottomWidth: 1,
    padding: 5,
    backgroundColor: '#fff',
    justifyContent: 'flex-start',
    flexDirection: 'row',
    borderColor: '#ddd',
    position: 'relative'
  }
}

export { CardSection }
